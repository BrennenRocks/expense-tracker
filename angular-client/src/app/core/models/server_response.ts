export interface ServerResponse {
  success: boolean,
  count?: number,
  data?: any[],
  error?: {
    message: string
  }
}