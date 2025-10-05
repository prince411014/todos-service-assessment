FROM node:20-alpine AS build
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .

FROM node:20-alpine
RUN addgroup -S app && adduser -S -G app app
USER app
WORKDIR /home/app
COPY --from=build /usr/src/app /home/app
EXPOSE 3000
CMD ["node", "src/server.js"]