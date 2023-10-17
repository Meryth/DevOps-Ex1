#Stage 1: Build Node 18 app
FROM node:18 AS build
WORKDIR /blog
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

#Stage 2: Create production image
FROM node:18
WORKDIR /blog
COPY --from=build /blog/.next ./.next
COPY --from=build /blog/node_modules ./node_modules
COPY --from=build /blog/package.json ./package.json
EXPOSE 3000

CMD ["npm", "start"]