import { Supplier } from '@prisma/client';
import { ISupplierRepository } from '../repositories/SupplierRepository';

export interface ISupplierService {
    getSuppliers(): Promise<Supplier[]>;
}

export class SupplierService implements ISupplierService {
    constructor(private readonly supplierRepository: ISupplierRepository) { }

    async getSuppliers(): Promise<Supplier[]> {
        return this.supplierRepository.findAll();
    }
}
