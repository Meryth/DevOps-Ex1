#Stage 1: Build Node 18 app
FROM node:18 AS build
WORKDIR /blog
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

#Stage 2: Create production image
FROM nginx:alpine
COPY --from=build /blog/.next /usr/share/nginx/html
EXPOSE 4000
CMD ["nginx", "-g", "daemon off;"]