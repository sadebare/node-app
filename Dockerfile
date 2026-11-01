FROM node:24-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm test && npm prune --omit=dev

FROM node:24-alpine 
WORKDIR /app
RUN apk upgrade --no-cache && rm -rf /usr/local/lib/node_modules/npm 
COPY --from=build /app .
USER node
EXPOSE 3000
CMD ["node", "src/server.js"]
