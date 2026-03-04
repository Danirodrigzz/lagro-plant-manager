# Stage 1: Build
FROM node:18-alpine AS builder

WORKDIR /app

# Copy package files and prisma schema
COPY backend/package*.json ./
COPY backend/prisma ./prisma/

# Install all dependencies (including devDependencies for build)
RUN npm install

# Copy backend source code
COPY backend/ .

# Generate Prisma client and compile TypeScript
RUN npx prisma generate
RUN npm run build

# Stage 2: Runtime
FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY backend/package*.json ./

# Install production dependencies
RUN npm ci --only=production

# Copy EVERYTHING needed for Prisma from builder:
# 1. The generated engine and client code (.prisma)
# 2. The client package wrapper (@prisma/client)
# 3. The prisma schema file
COPY --from=builder /app/node_modules/.prisma ./node_modules/.prisma
COPY --from=builder /app/node_modules/@prisma ./node_modules/@prisma
COPY --from=builder /app/prisma ./prisma
COPY --from=builder /app/dist ./dist

EXPOSE 3000

# Railway will provide DATABASE_URL in env
# We use a shell command to ensure migrations are applied before starting
CMD npx prisma migrate deploy && node dist/server.js
