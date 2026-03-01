import { ICategoryRepository } from '../interfaces/repositories';
import { ICategoryService } from '../interfaces/services';
import { Category } from '@prisma/client';

/**
 * Category service — Business logic layer for categories.
 * Dependency Inversion: Depends on ICategoryRepository abstraction.
 */
export class CategoryService implements ICategoryService {
    constructor(private readonly categoryRepository: ICategoryRepository) { }

    async getCategories(): Promise<Category[]> {
        return this.categoryRepository.findAll();
    }
}
