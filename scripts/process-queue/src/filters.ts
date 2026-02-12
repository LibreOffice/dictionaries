import {loadModule} from 'hunspell-asm';
import {mountDictionary, unmountDictionary} from './dictionary.js';

export async function filterExistingWords(
  words: string[],
  dictionary: string,
  dictPath: string,
): Promise<string[]> {
  const factory = await loadModule();

  const files = await mountDictionary(dictionary, factory, dictPath);
  try {
    const hunspell = factory.create(files.aff, files.dic);
    hunspell.addDictionary(files.reedsyDic);

    return words.filter((word) => !hunspell.spell(word));
  } finally {
    unmountDictionary(files, factory);
  }
}
