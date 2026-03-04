# Stage 1: Build
FROM node:18-alpine AS builder

WORKDIR /app

# Copy package files and prisma schema
# (Paths are relative to project root because context is '.')
COPY backend/package*.json ./
COPY backend/prisma ./prisma/

# Install dependencies (only for backend)
RUN npm install

# Copy backend source code
COPY backend/ .

# Generate Prisma client and compile TypeScript
RUN npx prisma generate
RUN npm run build

# Stage 2: Runtime
FROM node:18-alpine

WORKDIR /app

# Copy production dependencies
COPY backend/package*.json ./
RUN npm ci --only=production

# Copy prisma schema and generated client from builder
COPY --from=builder /app/node_modules/@prisma ./node_modules/@prisma
COPY --from=builder /app/prisma ./prisma
COPY --from=builder /app/dist ./dist

EXPOSE 3000

# Railway will provide DATABASE_URL in env
CMD ["node", "dist/server.js"]
