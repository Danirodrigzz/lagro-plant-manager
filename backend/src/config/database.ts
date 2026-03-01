import { PrismaClient } from '@prisma/client';

/**
 * Singleton instance of PrismaClient.
 * Ensures a single database connection pool across the application.
 * Follows the Singleton pattern to prevent connection exhaustion.
 */
class Database {
    private static instance: PrismaClient;

    private constructor() { }

    public static getInstance(): PrismaClient {
        if (!Database.instance) {
            Database.instance = new PrismaClient({
                log: process.env.NODE_ENV === 'development' ? ['query', 'error', 'warn'] : ['error'],
            });
        }
        return Database.instance;
    }
}

export const prisma = Database.getInstance();
