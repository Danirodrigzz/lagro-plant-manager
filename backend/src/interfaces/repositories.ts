import { PaginatedResponse, PaginationParams, ProductWithRelations } from '../types';
import { Category } from '@prisma/client';

/**
 * Interface Segregation Principle (ISP):
 * Repository contract defines only the data access methods needed.
 * Concrete implementations can use Prisma, raw SQL, or any other ORM.
 *
 * Dependency Inversion Principle (DIP):
 * The service layer depends on this abstraction, not the concrete Prisma implementation.
 */
export interface IProductRepository {
    findAll(params: PaginationParams): Promise<PaginatedResponse<ProductWithRelations>>;
    findById(id: number): Promise<ProductWithRelations | null>;
    count(search?: string, categoryId?: number): Promise<number>;
}

export interface ICategoryRepository {
    findAll(): Promise<Category[]>;
}
