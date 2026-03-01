import { Request, Response, NextFunction } from 'express';
import { ICategoryService } from '../interfaces/services';

/**
 * Category controller — HTTP layer for category endpoints.
 */
export class CategoryController {
    constructor(private readonly categoryService: ICategoryService) { }

    /**
     * GET /api/v1/categories
     */
    getCategories = async (_req: Request, res: Response, next: NextFunction): Promise<void> => {
        try {
            const categories = await this.categoryService.getCategories();

            res.json({
                success: true,
                data: categories,
            });
        } catch (error) {
            next(error);
        }
    };
}
