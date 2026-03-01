FROM node:18-alpine

WORKDIR /app

# Copy package files first (Docker layer caching optimization)
COPY package*.json ./
RUN npm ci --only=production

# Copy prisma schema and generate client
COPY prisma ./prisma
RUN npx prisma generate

# Copy compiled source
COPY dist ./dist

EXPOSE 3000

CMD ["node", "dist/server.js"]
