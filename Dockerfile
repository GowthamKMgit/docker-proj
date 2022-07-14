FROM node:alpine as block1

WORKDIR /var/app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build



FROM nginx
EXPOSE 80
COPY --from=block1 /var/app/build /usr/share/nginx/html