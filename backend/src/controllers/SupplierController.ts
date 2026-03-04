import { Request, Response, NextFunction } from 'express';
import { ISupplierService } from '../services/SupplierService';

export class SupplierController {
    constructor(private readonly supplierService: ISupplierService) { }

    getSuppliers = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
        try {
            const suppliers = await this.supplierService.getSuppliers();
            res.json({
                success: true,
                data: suppliers,
            });
        } catch (error) {
            next(error);
        }
    };
}
