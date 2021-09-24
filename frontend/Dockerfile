FROM node:lts-alpine AS frontend-build
WORKDIR /usr/src/app/frontend
COPY package.json ./
COPY yarn.lock ./

RUN yarn install

COPY . .

# RUN yarn global add @vue/cli

RUN chmod +x ./entrypoint.sh
EXPOSE 8080 
