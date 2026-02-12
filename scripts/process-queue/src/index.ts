import {parseArgs} from 'node:util';
import {updateReedsyDictionaries} from './dictionary.js';
import {runAnalysis, saveAnalysisToFile} from './llm-analysis.js';
import {getLastCheckedTimestamp, retrieveWords, saveLastCheckedTimestamp} from './queue.js';
import {filterExistingWords} from './filters.js';
import {logger} from './logger.js';

interface IOptions {
  dictionary: string;
  dictionariesPath: string;
  queuePath: string;
  model: string;
}

interface IResult {
  wordsAdded: number;
  wordsAnalysed: number;
}

export async function processDictionary(options: IOptions): Promise<IResult> {
  const {dictionary, dictionariesPath, queuePath, model} = options;

  const timestamp = await getLastCheckedTimestamp(dictionary, dictionariesPath);
  const words = await retrieveWords(dictionary, timestamp ?? 0, queuePath);
  const filtered = await filterExistingWords(words, dictionary, dictionariesPath);
  const analysis = await runAnalysis(filtered, dictionary, model);
  saveAnalysisToFile(analysis, dictionary, dictionariesPath);
  const wordsAdded = await updateReedsyDictionaries(analysis, dictionary, dictionariesPath);
  await saveLastCheckedTimestamp(dictionary, dictionariesPath);

  return {
    wordsAdded,
    wordsAnalysed: analysis.length,
  };
}

export async function main(): Promise<void> {
  const {values} = parseArgs({
    options: {
      dictionary: {
        type: 'string',
      },
      'dictionaries-path': {
        type: 'string',
        default: '.',
      },
      'queue-path': {
        type: 'string',
        default: './queue',
      },
      model: {
        type: 'string',
        default: 'claude-opus-4-5',
      },
    },
  });

  if (!values.dictionary) {
    throw new Error('--dictionary is required');
  }

  await processDictionary({
    dictionary: values.dictionary,
    dictionariesPath: values['dictionaries-path'],
    queuePath: values['queue-path'],
    model: values.model,
  });
}

/* v8 ignore start */
const isDirectExecution = process.argv[1]?.endsWith('index.ts');
if (isDirectExecution) {
  main().catch((err) => {
    logger.error((err as Error).message);
    process.exit(1);
  });
}
/* v8 ignore stop */
