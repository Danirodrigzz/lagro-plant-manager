import { prisma } from '../config/database';
import { ICategoryRepository } from '../interfaces/repositories';
import { Category } from '@prisma/client';

/**
 * Concrete implementation of ICategoryRepository.
 * Single Responsibility: Only handles category data access.
 */
export class CategoryRepository implements ICategoryRepository {
    async findAll(): Promise<Category[]> {
        return prisma.category.findMany({
            orderBy: { name: 'asc' },
        });
    }
}
