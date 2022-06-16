FROM node:latest as base

WORKDIR /usr/src/app
COPY package*.json ./

## Production build ##

FROM base as prod
ENV NODE_ENV=prod
RUN  npm i typescript -g &&  npm ci
COPY . .
RUN npm run build
CMD [ "npm", "run", "start:prod" ]

## Development build ##

FROM base as dev
ENV NODE_ENV=dev
RUN npm install nodemon concurrently typescript tsc-watch -g && npm install
COPY . .
CMD [ "npm", "run", "start:dev" ]