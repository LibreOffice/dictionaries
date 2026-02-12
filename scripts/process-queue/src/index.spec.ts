import {describe, it, expect, vi, beforeEach, afterEach} from 'vitest';
import {generateObject} from 'ai';

vi.mock('ai', () => ({
  generateObject: vi.fn(),
}));

const fsMock = vi.hoisted(() => ({
  readFile: vi.fn(),
  writeFile: vi.fn(),
  mkdir: vi.fn(),
  readdir: vi.fn(),
  access: vi.fn(),
}));

vi.mock('node:fs/promises', () => ({
  ...fsMock,
  default: fsMock,
}));

const fsSyncMock = vi.hoisted(() => ({
  writeFileSync: vi.fn(),
  mkdirSync: vi.fn(),
}));

vi.mock('node:fs', () => ({
  ...fsSyncMock,
  default: fsSyncMock,
}));

const {mockHunspell, mockFactory} = vi.hoisted(() => {
  const mockHunspell = {
    spell: vi.fn((_word: string) => false), // All words pass through (not in dictionary)
    addDictionary: vi.fn(),
  };

  const mockFactory = {
    mountBuffer: vi.fn((_: Buffer, name: string) => name),
    unmount: vi.fn(),
    create: vi.fn(() => mockHunspell),
  };

  return {mockHunspell, mockFactory};
});

vi.mock('hunspell-asm', () => ({
  loadModule: vi.fn(() => Promise.resolve(mockFactory)),
}));

import {main} from './index.js';

describe('word analysis script', () => {
  let originalArgv: string[];

  beforeEach(() => {
    originalArgv = process.argv;
    process.argv = ['node', 'script.js', '--dictionary', 'en/en_US'];
    vi.clearAllMocks();
    // Reset hunspell mock to default (all words pass through)
    mockHunspell.spell.mockReturnValue(false);
  });

  afterEach(() => {
    vi.restoreAllMocks();
    process.argv = originalArgv;
  });

  it('throws error when --dictionary is not provided', async () => {
    process.argv = ['node', 'script.js'];
    await expect(main()).rejects.toThrowError('--dictionary is required');
  });

  function setupQueueMocks(words: string[], lastTimestamp = '1970-01-01T00:00:00.000Z'): void {
    // Mock queue directory exists
    fsMock.access.mockResolvedValue(undefined);

    // Mock queue directory contains one file with timestamp > lastTimestamp
    fsMock.readdir.mockResolvedValue(['1000.json'] as string[]);

    // Mock file reads based on path
    fsMock.readFile.mockImplementation((path) => {
      const pathStr = path as string;

      if (pathStr.includes('last-updated') && pathStr.endsWith('.txt')) {
        return Promise.resolve(lastTimestamp);
      }

      if (pathStr.endsWith('1000.json')) {
        return Promise.resolve(JSON.stringify(words));
      }

      if (pathStr.endsWith('_reedsy.dic')) {
        return Promise.resolve('0\n');
      }

      // Dictionary .aff and .dic files - return empty buffer
      return Promise.resolve(Buffer.from(''));
    });
  }

  it('processes words and saves timestamp after completion', async () => {
    const llmOutput = [
      {word: 'Hello', transformedWord: 'hello', score: 1},
    ];

    const wordQueueContent = ['Hello'];
    const existingDictContent = '2\napple\nzebra\n';

    // Mock queue directory exists
    fsMock.access.mockResolvedValue(undefined);
    fsMock.readdir.mockResolvedValue(['1000.json'] as string[]);

    fsMock.readFile.mockImplementation((path) => {
      const pathStr = path as string;

      if (pathStr.includes('last-updated') && pathStr.endsWith('.txt')) {
        return Promise.resolve('1970-01-01T00:00:00.000Z');
      }

      if (pathStr.endsWith('1000.json')) {
        return Promise.resolve(JSON.stringify(wordQueueContent));
      }

      if (pathStr.endsWith('_reedsy.dic')) {
        return Promise.resolve(existingDictContent);
      }

      return Promise.resolve(Buffer.from(''));
    });

    vi.mocked(generateObject).mockResolvedValue({
      object: llmOutput,
    } as Awaited<ReturnType<typeof generateObject>>);

    await main();

    // Verify analysis file written to analyses/{dictionary}/reports/{timestamp}.json
    expect(fsSyncMock.writeFileSync).toHaveBeenCalledWith(
      expect.stringMatching(/analyses\/en\/en_US\/reports\/\d{4}-\d{2}-\d{2}T\d{2}-\d{2}-\d{2}\.json$/),
      JSON.stringify(llmOutput, null, 2),
      'utf8',
    );

    // Verify dictionary updated with new word
    expect(fsMock.writeFile).toHaveBeenCalledWith(
      expect.stringContaining('en_US_reedsy.dic'),
      '3\napple\nhello\nzebra\n',
      'utf8',
    );

    // Verify ISO timestamp saved to per-dictionary file
    expect(fsMock.writeFile).toHaveBeenCalledWith(
      expect.stringMatching(/analyses\/en\/en_US\/last-updated\.txt$/),
      expect.stringMatching(/^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}Z$/),
      'utf-8',
    );
  });

  it('handles empty queue directory', async () => {
    // Mock queue directory does not exist
    fsMock.access.mockRejectedValue(new Error('ENOENT'));

    fsMock.readFile.mockImplementation((path) => {
      const pathStr = path as string;

      if (pathStr.includes('last-updated') && pathStr.endsWith('.txt')) {
        return Promise.resolve('1970-01-01T00:00:00.000Z');
      }

      return Promise.resolve(Buffer.from(''));
    });

    vi.mocked(generateObject).mockResolvedValue({
      object: [],
    } as Awaited<ReturnType<typeof generateObject>>);

    await main();

    expect(generateObject).not.toHaveBeenCalled();

    // Verify that report file is not created when analysis is empty
    expect(fsSyncMock.writeFileSync).not.toHaveBeenCalledWith(
      expect.stringMatching(/analyses\/en\/en_US\/reports\/\d{4}-\d{2}-\d{2}T\d{2}-\d{2}-\d{2}\.json$/),
      expect.anything(),
      expect.anything(),
    );
  });

  it('handles LLM errors', async () => {
    setupQueueMocks(['Hello']);

    vi.mocked(generateObject).mockRejectedValue(new Error('Something went wrong'));

    await expect(main()).rejects.toThrowError('Something went wrong');
  });

  it('sorts dictionary words alphabetically and adds word count', async () => {
    const llmOutput = [
      {word: 'Zebra', transformedWord: 'zebra', score: 1},
      {word: 'Apple', transformedWord: 'apple', score: 1},
      {word: 'Monkey', transformedWord: 'monkey', score: 1},
    ];

    const wordQueueContent = ['Zebra', 'Apple', 'Monkey'];
    const existingDictContent = '2\ndog\ncat\n';

    fsMock.access.mockResolvedValue(undefined);
    fsMock.readdir.mockResolvedValue(['1000.json'] as string[]);

    fsMock.readFile.mockImplementation((path) => {
      const pathStr = path as string;

      if (pathStr.includes('last-updated') && pathStr.endsWith('.txt')) {
        return Promise.resolve('1970-01-01T00:00:00.000Z');
      }

      if (pathStr.endsWith('1000.json')) {
        return Promise.resolve(JSON.stringify(wordQueueContent));
      }

      if (pathStr.endsWith('_reedsy.dic')) {
        return Promise.resolve(existingDictContent);
      }

      return Promise.resolve(Buffer.from(''));
    });

    vi.mocked(generateObject).mockResolvedValue({
      object: llmOutput,
    } as Awaited<ReturnType<typeof generateObject>>);

    await main();

    expect(fsMock.writeFile).toHaveBeenCalledWith(
      expect.stringContaining('en_US_reedsy.dic'),
      '5\napple\ncat\ndog\nmonkey\nzebra\n',
      'utf8',
    );
  });

  it('deduplicates words already in dictionary', async () => {
    const llmOutput = [
      {
        word: 'Hello',
        transformedWord: 'hello',
        score: 1,
      },
    ];

    const wordQueueContent = ['Hello'];
    const existingDictContent = '3\napple\nhello\nzebra\n';

    fsMock.access.mockResolvedValue(undefined);
    fsMock.readdir.mockResolvedValue(['1000.json'] as string[]);

    fsMock.readFile.mockImplementation((path) => {
      const pathStr = path as string;

      if (pathStr.includes('last-updated') && pathStr.endsWith('.txt')) {
        return Promise.resolve('1970-01-01T00:00:00.000Z');
      }

      if (pathStr.endsWith('1000.json')) {
        return Promise.resolve(JSON.stringify(wordQueueContent));
      }

      if (pathStr.endsWith('_reedsy.dic')) {
        return Promise.resolve(existingDictContent);
      }

      return Promise.resolve(Buffer.from(''));
    });

    vi.mocked(generateObject).mockResolvedValue({
      object: llmOutput,
    } as Awaited<ReturnType<typeof generateObject>>);

    await main();

    expect(fsMock.writeFile).toHaveBeenCalledWith(
      expect.stringContaining('en_US_reedsy.dic'),
      '3\napple\nhello\nzebra\n',
      'utf8',
    );
  });

  it('only processes queue files newer than last timestamp', async () => {
    const wordQueueContent = ['Hello'];

    fsMock.access.mockResolvedValue(undefined);
    // File timestamp 500 is older than lastProcessed 1000
    fsMock.readdir.mockResolvedValue(['500.json'] as string[]);

    fsMock.readFile.mockImplementation((path) => {
      const pathStr = path as string;

      if (pathStr.includes('last-updated') && pathStr.endsWith('.txt')) {
        // Last processed at timestamp 1000 (ISO format)
        return Promise.resolve('1970-01-01T00:00:01.000Z');
      }

      if (pathStr.endsWith('500.json')) {
        return Promise.resolve(JSON.stringify(wordQueueContent));
      }

      if (pathStr.endsWith('_reedsy.dic')) {
        return Promise.resolve('0\n');
      }

      return Promise.resolve(Buffer.from(''));
    });

    vi.mocked(generateObject).mockResolvedValue({
      object: [],
    } as Awaited<ReturnType<typeof generateObject>>);

    await main();

    // LLM should not be called since no new words
    expect(generateObject).not.toHaveBeenCalled();
  });

  it('filters out words that already exist in hunspell dictionary', async () => {
    const wordQueueContent = ['existing', 'newword'];

    fsMock.access.mockResolvedValue(undefined);
    fsMock.readdir.mockResolvedValue(['1000.json'] as string[]);

    fsMock.readFile.mockImplementation((path) => {
      const pathStr = path as string;

      if (pathStr.includes('last-updated') && pathStr.endsWith('.txt')) {
        return Promise.resolve('1970-01-01T00:00:00.000Z');
      }

      if (pathStr.endsWith('1000.json')) {
        return Promise.resolve(JSON.stringify(wordQueueContent));
      }

      if (pathStr.endsWith('_reedsy.dic')) {
        return Promise.resolve('0\n');
      }

      return Promise.resolve(Buffer.from(''));
    });

    // Mock hunspell: 'existing' is in dictionary (spell returns true), 'newword' is not
    mockHunspell.spell.mockImplementation((word: string) => word === 'existing');

    vi.mocked(generateObject).mockResolvedValue({
      object: [{word: 'newword', transformedWord: 'newword', score: 1}],
    } as Awaited<ReturnType<typeof generateObject>>);

    await main();

    // Only 'newword' should be passed to LLM
    expect(generateObject).toHaveBeenCalledWith(
      expect.objectContaining({
        prompt: expect.stringContaining('newword') as string,
      }),
    );
    expect(generateObject).toHaveBeenCalledWith(
      expect.objectContaining({
        prompt: expect.not.stringContaining('existing') as string,
      }),
    );
  });

  it('handles missing last-updated file', async () => {
    fsMock.access.mockResolvedValue(undefined);
    fsMock.readdir.mockResolvedValue(['1000.json'] as string[]);

    const error = new Error('ENOENT') as NodeJS.ErrnoException;
    error.code = 'ENOENT';

    fsMock.readFile.mockImplementation((path) => {
      const pathStr = path as string;

      if (pathStr.includes('last-updated') && pathStr.endsWith('.txt')) {
        return Promise.reject(error);
      }

      if (pathStr.endsWith('1000.json')) {
        return Promise.resolve(JSON.stringify(['Hello']));
      }

      if (pathStr.endsWith('_reedsy.dic')) {
        return Promise.resolve('0\n');
      }

      return Promise.resolve(Buffer.from(''));
    });

    vi.mocked(generateObject).mockResolvedValue({
      object: [{word: 'Hello', transformedWord: 'hello', score: 1}],
    } as Awaited<ReturnType<typeof generateObject>>);

    await main();

    // Should process all words when no last-updated file exists
    expect(generateObject).toHaveBeenCalledWith(
      expect.objectContaining({
        prompt: expect.stringContaining('Hello') as string,
      }),
    );
  });

  it('handles invalid timestamp in last-updated file', async () => {
    fsMock.access.mockResolvedValue(undefined);
    fsMock.readdir.mockResolvedValue(['1000.json'] as string[]);

    fsMock.readFile.mockImplementation((path) => {
      const pathStr = path as string;

      if (pathStr.includes('last-updated') && pathStr.endsWith('.txt')) {
        return Promise.resolve('invalid-timestamp');
      }

      if (pathStr.endsWith('1000.json')) {
        return Promise.resolve(JSON.stringify(['Hello']));
      }

      if (pathStr.endsWith('_reedsy.dic')) {
        return Promise.resolve('0\n');
      }

      return Promise.resolve(Buffer.from(''));
    });

    vi.mocked(generateObject).mockResolvedValue({
      object: [{word: 'Hello', transformedWord: 'hello', score: 1}],
    } as Awaited<ReturnType<typeof generateObject>>);

    await main();

    // Should process all words when timestamp is invalid (defaults to 0)
    expect(generateObject).toHaveBeenCalledWith(
      expect.objectContaining({
        prompt: expect.stringContaining('Hello') as string,
      }),
    );
  });

  it('rethrows unexpected errors when reading last-updated file', async () => {
    const unexpectedError = new Error('Unexpected error') as NodeJS.ErrnoException;
    unexpectedError.code = 'EACCES';

    fsMock.readFile.mockImplementation((path) => {
      const pathStr = path as string;

      if (pathStr.includes('last-updated') && pathStr.endsWith('.txt')) {
        return Promise.reject(unexpectedError);
      }

      return Promise.resolve(Buffer.from(''));
    });

    await expect(main()).rejects.toThrowError('Unexpected error');
  });

  it('skips non-JSON files in queue directory', async () => {
    fsMock.access.mockResolvedValue(undefined);
    // Include a non-JSON file that should be skipped
    fsMock.readdir.mockResolvedValue(['1000.json', 'readme.txt', '.DS_Store'] as string[]);

    fsMock.readFile.mockImplementation((path) => {
      const pathStr = path as string;

      if (pathStr.includes('last-updated') && pathStr.endsWith('.txt')) {
        return Promise.resolve('1970-01-01T00:00:00.000Z');
      }

      if (pathStr.endsWith('1000.json')) {
        return Promise.resolve(JSON.stringify(['Hello']));
      }

      if (pathStr.endsWith('_reedsy.dic')) {
        return Promise.resolve('0\n');
      }

      return Promise.resolve(Buffer.from(''));
    });

    vi.mocked(generateObject).mockResolvedValue({
      object: [{word: 'Hello', transformedWord: 'hello', score: 1}],
    } as Awaited<ReturnType<typeof generateObject>>);

    await main();

    // Should only process JSON files
    expect(generateObject).toHaveBeenCalledWith(
      expect.objectContaining({
        prompt: expect.stringContaining('Hello') as string,
      }),
    );
  });

  it('skips JSON files with invalid timestamp filenames', async () => {
    setupQueueMocks(['Hello']);
    fsMock.readdir.mockResolvedValue(['1000.json', 'invalid.json'] as string[]);

    vi.mocked(generateObject).mockResolvedValue({
      object: [{word: 'Hello', transformedWord: 'hello', score: 1}],
    } as Awaited<ReturnType<typeof generateObject>>);

    await main();

    expect(generateObject).toHaveBeenCalled();
  });

  it('excludes words with score below acceptance threshold', async () => {
    const llmOutput = [
      {word: 'good', transformedWord: 'good', score: 0.9}, // Above threshold
      {word: 'bad', transformedWord: 'bad', score: 0.5}, // Below threshold
    ];

    fsMock.access.mockResolvedValue(undefined);
    fsMock.readdir.mockResolvedValue(['1000.json'] as string[]);

    fsMock.readFile.mockImplementation((path) => {
      const pathStr = path as string;

      if (pathStr.includes('last-updated') && pathStr.endsWith('.txt')) {
        return Promise.resolve('1970-01-01T00:00:00.000Z');
      }

      if (pathStr.endsWith('1000.json')) {
        return Promise.resolve(JSON.stringify(['good', 'bad']));
      }

      if (pathStr.endsWith('_reedsy.dic')) {
        return Promise.resolve('0\n');
      }

      return Promise.resolve(Buffer.from(''));
    });

    vi.mocked(generateObject).mockResolvedValue({
      object: llmOutput,
    } as Awaited<ReturnType<typeof generateObject>>);

    await main();

    // Only 'good' should be added to dictionary (score >= 0.8)
    expect(fsMock.writeFile).toHaveBeenCalledWith(
      expect.stringContaining('en_US_reedsy.dic'),
      '1\ngood\n',
      'utf8',
    );
  });

  it('rethrows unexpected errors when reading _reedsy.dic', async () => {
    const unexpectedError = new Error('Permission denied') as NodeJS.ErrnoException;
    unexpectedError.code = 'EACCES';

    fsMock.access.mockResolvedValue(undefined);
    fsMock.readdir.mockResolvedValue(['1000.json'] as string[]);

    fsMock.readFile.mockImplementation((path) => {
      const pathStr = path as string;

      if (pathStr.includes('last-updated') && pathStr.endsWith('.txt')) {
        return Promise.resolve('1970-01-01T00:00:00.000Z');
      }

      if (pathStr.endsWith('1000.json')) {
        return Promise.resolve(JSON.stringify(['Hello']));
      }

      if (pathStr.endsWith('_reedsy.dic')) {
        return Promise.reject(unexpectedError);
      }

      return Promise.resolve(Buffer.from(''));
    });

    await expect(main()).rejects.toThrowError('Permission denied');
  });

  it('creates _reedsy.dic file when it does not exist', async () => {
    const llmOutput = [
      {word: 'Hello', transformedWord: 'hello', score: 1},
    ];

    const enoentError = new Error('ENOENT') as NodeJS.ErrnoException;
    enoentError.code = 'ENOENT';

    fsMock.access.mockResolvedValue(undefined);
    fsMock.readdir.mockResolvedValue(['1000.json'] as string[]);

    fsMock.readFile.mockImplementation((path) => {
      const pathStr = path as string;

      if (pathStr.includes('last-updated') && pathStr.endsWith('.txt')) {
        return Promise.resolve('1970-01-01T00:00:00.000Z');
      }

      if (pathStr.endsWith('1000.json')) {
        return Promise.resolve(JSON.stringify(['Hello']));
      }

      if (pathStr.endsWith('_reedsy.dic')) {
        return Promise.reject(enoentError);
      }

      return Promise.resolve(Buffer.from(''));
    });

    vi.mocked(generateObject).mockResolvedValue({
      object: llmOutput,
    } as Awaited<ReturnType<typeof generateObject>>);

    await main();

    // Should create dictionary with just the new word
    expect(fsMock.writeFile).toHaveBeenCalledWith(
      expect.stringContaining('en_US_reedsy.dic'),
      '1\nhello\n',
      'utf8',
    );
  });
});
