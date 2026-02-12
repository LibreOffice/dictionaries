import {defineConfig} from 'vitest/config';

export default defineConfig({
  test: {
    testTimeout: 5_000,
    include: ['**/*.spec.ts'],
    coverage: {
      provider: 'v8',
      reporter: ['text', 'json', 'html'],
      thresholds: {
        branches: 100,
        functions: 100,
        lines: 100,
        statements: 100,
      },
    },
  },
});
