FROM python:2.7-alpine
LABEL maintainer="ibrahim SEN<ibrahim@promek.net>"

ENV PYTHONUNBUFFERED 1

#gunicorn environment
ENV GNC_BIND 0.0.0.0:8080
ENV GNC_WORKERS 1

RUN apk update \
    && apk upgrade \
    && apk add libjpeg-turbo \
    && apk add --virtual build-deps gcc python2-dev sqlite-dev jpeg-dev zlib-dev musl-dev \
    && pip install pysqlite==2.8.3 \
    && pip install Pillow==6.1.0 \
    && apk del build-deps \
    && pip install Django==1.11.22 \
    && pip install gunicorn==19.9.0

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

COPY gunicorn.cfg /home/gunicorn.cfg
RUN mkdir /home/log

RUN mkdir /home/_install
COPY src.tar.gz /home/_install/src.tar.gz

VOLUME /home

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
