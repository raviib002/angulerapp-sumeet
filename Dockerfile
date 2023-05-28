# Application build
FROM node:19-alpine AS build

WORKDIR /app

COPY . .

RUN npm install

#Run npm install -g npm@9.6.7

RUN npm run build

# Serve Application using Nginx Server
FROM nginx:alpine

COPY --from=build /app/dist/zappy_boiler_plate /usr/share/nginx/html

EXPOSE 80

