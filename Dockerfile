# Build stage
FROM node:20-alpine AS build
WORKDIR /usr/src/app
COPY package.json package-lock.json* ./
RUN npm ci --only=production || npm install
COPY . .
RUN npm run build --silent 2>/dev/null || true

# Runtime stage
FROM node:20-alpine
RUN addgroup -S app && adduser -S -G app app
WORKDIR /home/app
COPY --from=build /usr/src/app/package.json ./
COPY --from=build /usr/src/app/node_modules ./node_modules
COPY --from=build /usr/src/app/src ./src
EXPOSE 3000
USER app
ENV NODE_ENV=production
CMD ["node", "src/server.js"]
