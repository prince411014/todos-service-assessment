# ------------------------
# Build Stage
# ------------------------
FROM node:20-alpine AS build
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci --only=production || npm install --omit=dev
COPY . .
RUN npm run build --silent || echo "No build step found, skipping."

# ------------------------
# Runtime Stage
# ------------------------
FROM node:20-alpine
RUN addgroup -S app && adduser -S -G app app
WORKDIR /home/app
COPY --from=build /usr/src/app/package*.json ./
COPY --from=build /usr/src/app/node_modules ./node_modules
COPY --from=build /usr/src/app/src ./src
ENV NODE_ENV=production
USER app
EXPOSE 3000
CMD ["node", "src/server.js"]
