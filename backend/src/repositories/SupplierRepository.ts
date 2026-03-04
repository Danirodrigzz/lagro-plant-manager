import { prisma } from '../config/database';
import { Supplier } from '@prisma/client';

export interface ISupplierRepository {
    findAll(): Promise<Supplier[]>;
}

export class SupplierRepository implements ISupplierRepository {
    async findAll(): Promise<Supplier[]> {
        return prisma.supplier.findMany({
            orderBy: { name: 'asc' },
        });
    }
}
