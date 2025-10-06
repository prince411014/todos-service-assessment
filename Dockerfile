# ------------------------
# Build Stage
# ------------------------
FROM node:20-alpine AS build

# Set working directory
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install production dependencies (fallback to npm install if lockfile missing)
RUN npm ci --only=production || npm install --omit=dev

# Copy application source code
COPY . .

# Optional: Build step (for React/TypeScript or compiled code)
RUN npm run build --silent || echo "No build step found, skipping."

# ------------------------
# Runtime Stage
# ------------------------
FROM node:20-alpine

# Create app user and group
RUN addgroup -S app && adduser -S -G app app

# Set working directory
WORKDIR /home/app

# Copy only what's needed for runtime
COPY --from=build /usr/src/app/package*.json ./
COPY --from=build /usr/src/app/node_modules ./node_modules
COPY --from=build /usr/src/app/src ./src

# Set environment
ENV NODE_ENV=production

# Expose application port
EXPOSE 3000

# Use non-root user
USER app

# Start the server
CMD ["node", "src/server.js"]

