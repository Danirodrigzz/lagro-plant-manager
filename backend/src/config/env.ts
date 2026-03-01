import dotenv from 'dotenv';

dotenv.config();

/**
 * Centralized environment configuration.
 * Validates required environment variables at startup
 * to fail fast instead of at runtime.
 */
interface EnvConfig {
    PORT: number;
    DATABASE_URL: string;
    NODE_ENV: string;
}

function loadEnvConfig(): EnvConfig {
    const requiredVars = ['DATABASE_URL'];

    for (const varName of requiredVars) {
        if (!process.env[varName]) {
            throw new Error(`Missing required environment variable: ${varName}`);
        }
    }

    return {
        PORT: parseInt(process.env.PORT || '3000', 10),
        DATABASE_URL: process.env.DATABASE_URL!,
        NODE_ENV: process.env.NODE_ENV || 'development',
    };
}

export const env = loadEnvConfig();
