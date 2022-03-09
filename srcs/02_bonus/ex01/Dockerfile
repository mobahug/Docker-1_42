
FROM node

ADD . /app

WORKDIR /app

RUN npm install \
    && npm install -g bower \
    && bower install --allow-root \
    $$ npm install -g nodemon

EXPOSE 3000

CMD ["nodemon", "server.js"]