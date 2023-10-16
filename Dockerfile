FROM node:18 AS build
WORKDIR /blog
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build