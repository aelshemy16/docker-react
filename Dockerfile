FROM node:16.13.1-alpine3.14 as builder
WORKDIR /app
COPY package.json .
RUN npm i 
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
