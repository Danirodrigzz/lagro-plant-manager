import { prisma } from '../config/database';
import { Season } from '@prisma/client';

export interface ISeasonRepository {
    findAll(): Promise<Season[]>;
}

export class SeasonRepository implements ISeasonRepository {
    async findAll(): Promise<Season[]> {
        return prisma.season.findMany({
            orderBy: { name: 'asc' },
        });
    }
}
