FROM node:8

WORKDIR /usr/src/app
COPY package*.json ./
COPY . /usr/src/app
EXPOSE 5000
CMD ["node", "index.js"]
