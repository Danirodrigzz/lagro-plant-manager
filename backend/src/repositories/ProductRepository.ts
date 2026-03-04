import { prisma } from '../config/database';
import { IProductRepository } from '../interfaces/repositories';
import { PaginatedResponse, PaginationParams, ProductWithRelations } from '../types';
import { Sale } from '@prisma/client';

/**
 * Concrete implementation of IProductRepository using Prisma.
 *
 * Single Responsibility: Only handles data access logic for products.
 * Dependency Inversion: Implements the IProductRepository interface,
 * allowing the service layer to depend on the abstraction.
 */
export class ProductRepository implements IProductRepository {
    /**
     * Fetches paginated products with cursor-based pagination.
     *
     * Why cursor-based? With 50k records, OFFSET-based pagination
     * degrades linearly — OFFSET 40000 still scans 40k rows.
     * Cursor-based uses WHERE id > cursor which leverages the PK index → O(1).
     */
    async findAll(params: PaginationParams): Promise<PaginatedResponse<ProductWithRelations>> {
        const { limit, cursor, search, categoryId } = params;

        // Build dynamic where clause
        const where: any = {};

        if (search) {
            where.OR = [
                { name: { contains: search, mode: 'insensitive' } },
                { scientificName: { contains: search, mode: 'insensitive' } },
                { description: { contains: search, mode: 'insensitive' } },
            ];
        }

        if (categoryId) {
            where.categoryId = categoryId;
        }

        // Cursor-based pagination
        const queryOptions: any = {
            take: limit + 1, // Fetch one extra to check if there are more
            where,
            include: {
                category: true,
                supplier: true,
                season: true,
                sales: true,
            },
            orderBy: { id: 'asc' },
        };

        if (cursor) {
            queryOptions.skip = 1; // Skip the cursor itself
            queryOptions.cursor = { id: cursor };
        }

        const [products, total] = await Promise.all([
            prisma.product.findMany(queryOptions) as Promise<ProductWithRelations[]>,
            prisma.product.count({ where }),
        ]);

        const hasMore = products.length > limit;
        const data = hasMore ? products.slice(0, limit) : products;
        const nextCursor = hasMore ? data[data.length - 1].id : null;

        return {
            data,
            pagination: {
                nextCursor,
                hasMore,
                total,
            },
        };
    }

    async findById(id: number): Promise<ProductWithRelations | null> {
        return prisma.product.findUnique({
            where: { id },
            include: {
                category: true,
                supplier: true,
                season: true,
                sales: true,
            },
        }) as Promise<ProductWithRelations | null>;
    }

    async findSalesByProductId(id: number): Promise<Sale[]> {
        return prisma.sale.findMany({
            where: { productId: id },
            orderBy: { soldAt: 'asc' },
        });
    }

    async count(search?: string, categoryId?: number): Promise<number> {
        const where: any = {};

        if (search) {
            where.OR = [
                { name: { contains: search, mode: 'insensitive' } },
                { scientificName: { contains: search, mode: 'insensitive' } },
            ];
        }

        if (categoryId) {
            where.categoryId = categoryId;
        }

        return prisma.product.count({ where });
    }
}
