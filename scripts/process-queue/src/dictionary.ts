import {HunspellFactory} from 'hunspell-asm';
import {readFile, writeFile} from 'node:fs/promises';
import path from 'node:path';
import {WordAnalysis} from './llm-analysis.js';
import {config} from './config.js';
import {logger} from './logger.js';
import {isErrnoException} from './errors.js';

export async function mountDictionary(
  dict: string,
  factory: HunspellFactory,
  dictPath: string,
): Promise<{aff: string; dic: string; reedsyDic: string}> {
  const {affBuffer, dictBuffer, reedsyDictBuffer} = await getDictionaryBuffer(dict, dictPath);
  const flattenedDictName = dict.replaceAll('/', '_');

  return {
    aff: factory.mountBuffer(affBuffer, `${flattenedDictName}.aff`),
    dic: factory.mountBuffer(dictBuffer, `${flattenedDictName}.dic`),
    reedsyDic: factory.mountBuffer(reedsyDictBuffer, `${flattenedDictName}_reedsy.dic`),
  };
}

export function unmountDictionary(
  {aff, dic, reedsyDic}: {aff: string; dic: string; reedsyDic: string},
  factory: HunspellFactory,
): void {
  factory.unmount(aff);
  factory.unmount(dic);
  factory.unmount(reedsyDic);
}

async function getDictionaryBuffer(dict: string, dictPath: string): Promise<{
  affBuffer: Buffer;
  dictBuffer: Buffer;
  reedsyDictBuffer: Buffer;
}> {
  const reedsyDictPath = path.join(dictPath, `${dict}_reedsy.dic`);
  const [affBuffer, dictBuffer, reedsyDictContent] = await Promise.all([
    readFile(path.join(dictPath, `${dict}.aff`)),
    readFile(path.join(dictPath, `${dict}.dic`)),
    readFileWithFallback(reedsyDictPath, config.emptyDictionary),
  ]);

  return {affBuffer, dictBuffer, reedsyDictBuffer: Buffer.from(reedsyDictContent)};
}

export async function updateReedsyDictionaries(
  output: WordAnalysis[],
  dictionary: string,
  dictPath: string,
): Promise<number> {
  const wordsToAdd = output
    .filter((w) => w.score >= config.acceptanceThreshold)
    .map((w) => w.transformedWord);

  if (wordsToAdd.length === 0) {
    logger.info('No words met the acceptance threshold');
    return 0;
  }

  const reedsyDictFile = path.join(dictPath, `${dictionary}_reedsy.dic`);
  const existingWords = await readDictionaryWords(reedsyDictFile);
  const mergedWords = mergeAndSortWords(existingWords, wordsToAdd);
  const newWordsCount = mergedWords.length - existingWords.length;
  const contents = formatDictionaryFile(mergedWords);
  await writeFile(reedsyDictFile, contents, 'utf8');
  logger.info(`${dictionary} dictionary updated successfully with ${newWordsCount} new words`);
  return newWordsCount;
}

async function readDictionaryWords(filePath: string): Promise<string[]> {
  const content = await readFileWithFallback(filePath, config.emptyDictionary);
  const lines = content.split('\n').filter(Boolean);
  return lines.slice(1); // Skip first line (word count)
}

function mergeAndSortWords(existing: string[], newWords: string[]): string[] {
  const combined = new Set([...existing, ...newWords]);
  return Array.from(combined).sort((a, b) => a.localeCompare(b));
}

function formatDictionaryFile(words: string[]): string {
  return `${words.length}\n${words.join('\n')}\n`;
}

async function readFileWithFallback(filePath: string, fallback: string): Promise<string> {
  try {
    return await readFile(filePath, 'utf8');
  } catch (error) {
    if (isErrnoException(error)) return fallback;
    throw error;
  }
}
