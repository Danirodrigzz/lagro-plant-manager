import { Product, Category, Supplier, Season, Sale } from '@prisma/client';

// ============================================================
// Domain Types — Pure data representations
// ============================================================

/**
 * Product with its related entities included.
 * Extends the base Prisma Product type with joined data.
 */
export interface ProductWithRelations extends Product {
    category: Category;
    supplier: Supplier;
    season: Season;
    sales: Sale[];
}

// ============================================================
// Pagination Types
// ============================================================

/**
 * Parameters for cursor-based pagination.
 * Cursor-based pagination is O(1) vs O(n) for offset-based
 * when dealing with large datasets like 50k records.
 */
export interface PaginationParams {
    limit: number;
    cursor?: number;
    search?: string;
    categoryId?: number;
}

/**
 * Metadata returned alongside paginated data.
 */
export interface PaginationMeta {
    nextCursor: number | null;
    hasMore: boolean;
    total: number;
}

/**
 * Generic paginated response wrapper.
 * Uses generics (Open/Closed Principle) to work with any entity.
 */
export interface PaginatedResponse<T> {
    data: T[];
    pagination: PaginationMeta;
}

// ============================================================
// API Response Types
// ============================================================

/**
 * Standardized API response format.
 * Ensures consistent response structure across all endpoints.
 */
export interface ApiResponse<T> {
    success: boolean;
    data?: T;
    error?: string;
    message?: string;
}
