FROM node:alpine as builder

WORKDIR /usr/src/app

COPY package.json ./

RUN yarn install

COPY ./ ./

CMD ["yarn", "build"]

FROM nginx

EXPOSE 80

COPY --from=builder /usr/src/app/build /usr/share/nginx/html