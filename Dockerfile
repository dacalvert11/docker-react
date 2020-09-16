FROM node:alpine as builder
WORKDIR '/app'
RUN npm config set registry http://registry.npmjs.org/
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

