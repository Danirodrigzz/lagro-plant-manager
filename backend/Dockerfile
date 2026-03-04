# Stage 1: Build
FROM node:18-alpine AS builder

WORKDIR /app

# Copy package files and prisma schema
COPY backend/package*.json ./
COPY backend/prisma ./prisma/

# Install ALL dependencies for building
RUN npm install

# Copy source code
COPY backend/ .

# Generate Prisma client and build TypeScript
RUN npx prisma generate
RUN npm run build

# Stage 2: Runtime
FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY backend/package*.json ./
# Copy prisma schema (needed for client generation or runtime)
COPY backend/prisma ./prisma/

# Install ONLY production dependencies
# This is cleaner and ensures we have the right binaries for alpine
RUN npm ci --only=production

# Re-generate the Prisma client in the runtime stage
# This ensures the engine is correctly placed in node_modules
RUN npx prisma generate

# Copy the compiled code from the builder stage
COPY --from=builder /app/dist ./dist

EXPOSE 3000

# Start migrations and then the server
CMD npx prisma migrate deploy && node dist/server.js
