FROM alpine:3.7

LABEL maintainer="ibrahim SEN<ibrahim@promek.net>"

ENV MNG_USER root
ENV MNG_PASS passwd

RUN apk update && \
    apk upgrade && \
    apk add --no-cache mongodb && \
    rm /usr/bin/mongoperf

COPY mongod.conf /etc/mongod.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

VOLUME /data/db
EXPOSE 27017

ENTRYPOINT ["/entrypoint.sh"]
CMD ["mongod"]
