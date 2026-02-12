import {writeFileSync, mkdirSync} from 'node:fs';
import {generateObject} from 'ai';
import z from 'zod';
import {AnthropicProviderOptions, createAnthropic} from '@ai-sdk/anthropic';
import {makePrompt, SYSTEM_PROMPT} from './llm-prompts.js';
import {dirname, join} from 'node:path';
import {logger} from './logger.js';

const wordAnalysisSchema = z.object({
  word: z.string(),
  transformedWord: z.string(),
  score: z.number().min(0).max(1),
});

export type WordAnalysis = z.infer<typeof wordAnalysisSchema>;

export async function runAnalysis(
  words: string[],
  dictionary: string,
  model: string,
): Promise<WordAnalysis[]> {
  if (words.length === 0) {
    logger.info('No words for LLM to analyse, skipping...');
    return [];
  }

  logger.info(`Running LLM analysis on ${words.length} words for ${dictionary} dictionary`);
  const anthropic = createAnthropic();

  const {object} = await generateObject({
    model: anthropic(model),
    temperature: 0,
    output: 'array',
    schema: wordAnalysisSchema,
    providerOptions: {
      anthropic: {
        effort: 'high',
      } satisfies AnthropicProviderOptions,
    },
    system: SYSTEM_PROMPT,
    prompt: makePrompt(words, dictionary),
  }).catch((err) => {
    logger.error((err as Error).message);
    throw err;
  });

  return object;
}

export function saveAnalysisToFile(
  analysis: WordAnalysis[],
  dictionary: string,
  dictPath: string,
): void {
  if (analysis.length === 0) {
    logger.info('No words analysed, skipping report generation');
    return;
  }

  const timestamp = new Date().toISOString().split('.')[0].replaceAll(':', '-');
  const filePath = join(dictPath, 'analyses', dictionary, 'reports', `${timestamp}.json`);
  logger.info(`Saving analysis to ${filePath}`);

  mkdirSync(dirname(filePath), {recursive: true});
  writeFileSync(filePath, JSON.stringify(analysis, null, 2), 'utf8');
}
