
#FROM node:carbon
FROM node:8

RUN npm install -g nodemon

WORKDIR /usr/src/app

COPY package*.json /usr/src/app/

RUN npm -y install
#mv /usr/src/app/node_modules /node_modules

COPY . /usr/src/app

EXPOSE 3000

CMD [ "node", "./bin/www" ]
