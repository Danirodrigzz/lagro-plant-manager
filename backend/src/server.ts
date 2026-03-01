import express from 'express';
import cors from 'cors';
import morgan from 'morgan';
import { env } from './config/env';
import routes from './routes';
import { errorHandler } from './middlewares/errorHandler';

/**
 * Application entry point.
 *
 * Middleware order matters:
 * 1. CORS — Allow cross-origin requests (Flutter app)
 * 2. Morgan — HTTP request logging for traceability
 * 3. JSON parser — Parse request bodies
 * 4. Routes — API endpoints
 * 5. Error handler — Catch-all for unhandled errors (must be last)
 */
const app = express();

// === Middlewares ===
app.use(cors());
app.use(morgan('dev'));
app.use(express.json());

// === Health Check ===
app.get('/health', (_req, res) => {
    res.json({
        success: true,
        message: 'Lagro Plant Manager API is running 🌱',
        timestamp: new Date().toISOString(),
    });
});

// === API Routes ===
app.use('/api/v1', routes);

// === Error Handler (must be after routes) ===
app.use(errorHandler);

// === Start Server ===
app.listen(env.PORT, () => {
    console.log(`🌱 Lagro API running on http://localhost:${env.PORT}`);
    console.log(`📋 Environment: ${env.NODE_ENV}`);
});

export default app;
