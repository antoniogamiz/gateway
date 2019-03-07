FROM node:10

COPY package*.json /usr/src/
WORKDIR /usr/src
COPY . /usr/src/
RUN npm install
RUN npm install -g nodemon

EXPOSE 8080
EXPOSE 9876

CMD node server.js