FROM node:alpine as builder
WORKDIR '/app'
RUN npm config set registry http://registry.npmjs.org/
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

