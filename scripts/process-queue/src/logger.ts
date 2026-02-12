export const logger = {
  info: (message: string, meta?: {data?: Record<string, unknown>}) => {
    console.log(`[INFO] ${message}`, meta?.data ?? '');
  },
  warn: (message: string, meta: {data: Record<string, unknown>}) => {
    console.warn(`[WARN] ${message}`, meta.data);
  },
  error: (message: string) => {
    console.error(`[ERROR] ${message}`);
  },
};
