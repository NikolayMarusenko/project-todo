FROM node:8-alpine

RUN mkdir -p /app

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .


EXPOSE 8080

ENTRYPOINT ["npm", "start"]
