FROM node:9-alpine

LABEL maintainer="ibrahim SEN<ibrahim@promek.net>"

# Loopback Module : loopback-component-storage,loopback-connector-sqlite3,loopback-connector-mysql
ENV LBC_MODS loopback-connector-sqlite3

RUN apk update && \
    apk upgrade

RUN apk add --no-cache paxctl && \ 
    paxctl -cm `which node`

RUN npm install loopback-cli -g && \
    npm install pm2 -g

COPY api.tar.gz /api.tar.gz
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x entrypoint.sh

VOLUME /home
EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]
CMD ["pm2-runtime"]

