FROM node:21.7.3-alpine3.19 AS builder
MAINTAINER Priyank Garg
WORKDIR /app
COPY public /app/public
COPY src /app/src
COPY package.json /app
COPY package-lock.json /app
RUN npm install

FROM node:21.7.3-alpine3.19
COPY --from=builder node_modules /app/node_modules
ENTRYPOINT npm start