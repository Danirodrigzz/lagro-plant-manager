import { IProductRepository } from '../interfaces/repositories';
import { IProductService } from '../interfaces/services';
import { PaginatedResponse, PaginationParams, ProductWithRelations } from '../types';
import { Sale } from '@prisma/client';

/**
 * Product service — Business logic layer.
 *
 * Single Responsibility: Contains only business rules for products.
 * Dependency Inversion: Receives IProductRepository via constructor injection,
 * making it testable and decoupled from Prisma.
 *
 * Open/Closed: New business rules can be added without modifying
 * the repository or controller layers.
 */
export class ProductService implements IProductService {
    constructor(private readonly productRepository: IProductRepository) { }

    async getProducts(params: PaginationParams): Promise<PaginatedResponse<ProductWithRelations>> {
        // Business rule: enforce maximum limit to prevent abuse
        const sanitizedParams: PaginationParams = {
            ...params,
            limit: Math.min(params.limit || 20, 100),
        };

        return this.productRepository.findAll(sanitizedParams);
    }

    async getProductById(id: number): Promise<ProductWithRelations | null> {
        return this.productRepository.findById(id);
    }

    async getProductSales(id: number): Promise<Sale[]> {
        return this.productRepository.findSalesByProductId(id);
    }
}
