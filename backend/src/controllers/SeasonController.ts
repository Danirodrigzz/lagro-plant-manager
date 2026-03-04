import { Request, Response, NextFunction } from 'express';
import { ISeasonService } from '../services/SeasonService';

export class SeasonController {
    constructor(private readonly seasonService: ISeasonService) { }

    getSeasons = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
        try {
            const seasons = await this.seasonService.getSeasons();
            res.json({
                success: true,
                data: seasons,
            });
        } catch (error) {
            next(error);
        }
    };
}
