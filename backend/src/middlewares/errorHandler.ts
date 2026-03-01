import { Request, Response, NextFunction } from 'express';

/**
 * Global error handling middleware.
 *
 * Catches all unhandled errors and returns a consistent JSON response.
 * In production, hides internal error details for security.
 * Provides traceability via console.error logging.
 */
export function errorHandler(
    err: Error,
    _req: Request,
    res: Response,
    _next: NextFunction
): void {
    console.error(`[ERROR] ${new Date().toISOString()} — ${err.message}`);
    console.error(err.stack);

    const statusCode = (err as any).statusCode || 500;
    const message = process.env.NODE_ENV === 'production'
        ? 'Internal server error'
        : err.message;

    res.status(statusCode).json({
        success: false,
        error: message,
        ...(process.env.NODE_ENV !== 'production' && { stack: err.stack }),
    });
}
