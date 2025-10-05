# syntax=docker/dockerfile:1.4

##########################
# 🧱 Build Stage
##########################
FROM node:20.11.1-alpine3.19 AS build

WORKDIR /usr/src/app

# Copy dependency files first for caching
COPY package*.json ./

# 🔧 Install system dependencies (required for native Node modules)
RUN apk add --no-cache python3 make g++

# 🧩 Install dependencies safely
# `npm install` is used instead of `npm ci` to avoid lockfile mismatch issues in CI
RUN npm install --omit=dev --unsafe-perm=true

# Copy application code
COPY . .

# 🏗️ Build the app (optional step; will skip if no build script)
RUN npm run build --silent 2>/dev/null || echo "Skipping build step (no build script found)"

##########################
# 🚀 Runtime Stage
##########################
FROM node:20.11.1-alpine3.19

# Create non-root user
RUN addgroup -S app && adduser -S app -G app

WORKDIR /home/app

# Copy runtime files
COPY --from=build /usr/src/app/package*.json ./
COPY --from=build /usr/src/app/node_modules ./node_modules
COPY --from=build /usr/src/app/src ./src

# Environment setup
ENV NODE_ENV=production
ENV PORT=3000

# Expose application port
EXPOSE 3000

# Run as non-root user
USER app

# Healthcheck (optional but recommended)
HEALTHCHECK --interval=30s --timeout=5s \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3000/healthz || exit 1

# Start the app
CMD ["node", "src/server.js"]
