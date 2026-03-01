import { Request, Response, NextFunction } from 'express';
import { IProductService } from '../interfaces/services';
import { PaginationParams } from '../types';

/**
 * Product controller — HTTP layer.
 *
 * Single Responsibility: Only handles HTTP request/response.
 * Parses query params, delegates to service, formats response.
 *
 * Dependency Inversion: Receives IProductService via constructor,
 * completely decoupled from the data layer.
 */
export class ProductController {
    constructor(private readonly productService: IProductService) { }

    /**
     * GET /api/v1/products
     * Query params: limit, cursor, search, categoryId
     */
    getProducts = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
        try {
            const params: PaginationParams = {
                limit: parseInt(req.query.limit as string) || 20,
                cursor: req.query.cursor ? parseInt(req.query.cursor as string) : undefined,
                search: req.query.search as string | undefined,
                categoryId: req.query.categoryId ? parseInt(req.query.categoryId as string) : undefined,
            };

            const result = await this.productService.getProducts(params);

            res.json({
                success: true,
                ...result,
            });
        } catch (error) {
            next(error);
        }
    };

    /**
     * GET /api/v1/products/:id
     */
    getProductById = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
        try {
            const id = parseInt(req.params.id as string);

            if (isNaN(id)) {
                res.status(400).json({
                    success: false,
                    error: 'Invalid product ID',
                });
                return;
            }

            const product = await this.productService.getProductById(id);

            if (!product) {
                res.status(404).json({
                    success: false,
                    error: 'Product not found',
                });
                return;
            }

            res.json({
                success: true,
                data: product,
            });
        } catch (error) {
            next(error);
        }
    };
}
