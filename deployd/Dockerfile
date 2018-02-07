FROM node:9.5.0-alpine

LABEL maintainer="ibrahim SEN<ibrahim@promek.net>"

# Deployd Modules : dpd-count,dpd-fileupload,dpd-event
ENV DPD_MODS dpd-count

#mongo environment
ENV MNG_HOST 172.17.0.3
ENV MNG_PORT 27017
ENV MNG_DBNM admin
ENV MNG_USER root
ENV MNG_PASS passwd

RUN apk update && \
    apk upgrade && \
    npm install deployd -g && \
    npm install deployd-cli -g && \
    npm install pm2 -g

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

VOLUME /home
EXPOSE 2403

ENTRYPOINT ["/entrypoint.sh"]
CMD ["pm2-runtime"]

