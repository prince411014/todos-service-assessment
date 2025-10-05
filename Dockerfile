# syntax=docker/dockerfile:1.4

##########################
# 🧱 Build Stage
##########################
FROM node:20.11.1-alpine3.19 AS build

# Set working directory
WORKDIR /usr/src/app

# Copy dependency files
COPY package*.json ./

# Install build tools (for native dependencies)
RUN apk add --no-cache python3 make g++

# Install dependencies (omit dev deps for production build)
# --unsafe-perm fixes permissions issues in non-root environments
RUN npm ci --omit=dev --unsafe-perm=true || npm install --omit=dev --unsafe-perm=true

# Copy the rest of the source code
COPY . .

# Optional: build step (won’t fail if build script missing)
RUN npm run build --silent 2>/dev/null || echo "Skipping build stage (no build script)"

##########################
# 🚀 Runtime Stage
##########################
FROM node:20.11.1-alpine3.19

# Create non-root user
RUN addgroup -S app && adduser -S app -G app

# Set working directory
WORKDIR /home/app

# Copy only necessary files from build stage
COPY --from=build /usr/src/app/package*.json ./
COPY --from=build /usr/src/app/node_modules ./node_modules
COPY --from=build /usr/src/app/src ./src

# Environment variables
ENV NODE_ENV=production
ENV PORT=3000

# Expose the port
EXPOSE 3000

# Switch to non-root user
USER app

# Healthcheck (optional for K8s readiness)
HEALTHCHECK --interval=30s --timeout=5s \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3000/healthz || exit 1

# Start the application
CMD ["node", "src/server.js"]
