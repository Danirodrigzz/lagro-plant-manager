import { PaginatedResponse, PaginationParams, ProductWithRelations } from '../types';
import { Category } from '@prisma/client';

/**
 * Interface Segregation Principle (ISP):
 * Service contract defines only business logic methods.
 * Keeps the controller layer decoupled from implementation details.
 */
export interface IProductService {
    getProducts(params: PaginationParams): Promise<PaginatedResponse<ProductWithRelations>>;
    getProductById(id: number): Promise<ProductWithRelations | null>;
}

export interface ICategoryService {
    getCategories(): Promise<Category[]>;
}
