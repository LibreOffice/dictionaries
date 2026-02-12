import fs from 'node:fs/promises';
import path from 'node:path';
import {logger} from './logger.js';
import {isErrnoException} from './errors.js';

export async function retrieveWords(
  dictionary: string,
  lastChecked: number,
  queuePath: string,
): Promise<string[]> {
  const dictQueueDir = path.join(queuePath, dictionary);
  logger.info('Retrieving words', {data: {path: dictQueueDir, dictionary}});

  try {
    await fs.access(dictQueueDir);
  } catch {
    logger.info('No queue directory found', {data: {path: dictQueueDir}});
    return [];
  }

  const files = await fs.readdir(dictQueueDir);
  const words: string[] = [];

  for (const file of files) {
    if (!file.endsWith('.json')) continue;
    const enqueuedOn = parseInt(file.replace('.json', ''), 10);
    if (Number.isNaN(enqueuedOn)) continue;

    if (enqueuedOn > lastChecked) {
      const filePath = path.join(dictQueueDir, file);
      const contents = await fs.readFile(filePath, 'utf-8');
      const fileWords = JSON.parse(contents) as string[];
      words.push(...fileWords);
    }
  }

  logger.info('Retrieved words from queue', {data: {count: words.length}});
  return words;
}

export async function getLastCheckedTimestamp(dictionary: string, dictPath: string): Promise<number | null> {
  const filePath = path.join(dictPath, 'analyses', dictionary, 'last-updated.txt');
  try {
    const content = await fs.readFile(filePath, 'utf-8');
    const timestamp = Date.parse(content.trim());

    if (isNaN(timestamp)) {
      logger.warn('Invalid timestamp, processing all words', {data: {filePath}});
      return null;
    }

    return timestamp;
  } catch (error) {
    if (isErrnoException(error)) {
      logger.info('No last-updated file found, processing all words', {data: {filePath}});
      return null;
    }
    throw error;
  }
}

export async function saveLastCheckedTimestamp(
  dictionary: string,
  dictPath: string,
): Promise<void> {
  const filePath = path.join(dictPath, 'analyses', dictionary, 'last-updated.txt');
  await fs.mkdir(path.dirname(filePath), {recursive: true});
  const timestamp = new Date().toISOString();
  await fs.writeFile(filePath, timestamp, 'utf-8');
  logger.info('Saved last checked timestamp', {data: {timestamp, filePath}});
}
