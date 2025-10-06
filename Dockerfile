# ------------------------
# Build Stage
# ------------------------
FROM node:20-alpine AS build
WORKDIR /usr/src/app

# Copy package files first for better caching
COPY package*.json ./

# Install dependencies (include dev for possible build step)
RUN npm ci || npm install

# Copy the rest of the code
COPY . .

# Run build step if available
RUN npm run build --silent || echo "No build step found, skipping."

# ------------------------
# Runtime Stage
# ------------------------
FROM node:20-alpine

# Create a non-root user for security
RUN addgroup -S app && adduser -S -G app app

WORKDIR /home/app

# Copy only necessary files for runtime
COPY --from=build /usr/src/app/package*.json ./
COPY --from=build /usr/src/app/node_modules ./node_modules
COPY --from=build /usr/src/app/src ./src

# Set environment and user
ENV NODE_ENV=production
USER app

# Expose the application port
EXPOSE 3000

# Start the app
CMD ["node", "src/server.js"]
