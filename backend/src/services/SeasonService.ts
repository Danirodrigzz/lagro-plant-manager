import { Season } from '@prisma/client';
import { ISeasonRepository } from '../repositories/SeasonRepository';

export interface ISeasonService {
    getSeasons(): Promise<Season[]>;
}

export class SeasonService implements ISeasonService {
    constructor(private readonly seasonRepository: ISeasonRepository) { }

    async getSeasons(): Promise<Season[]> {
        return this.seasonRepository.findAll();
    }
}
