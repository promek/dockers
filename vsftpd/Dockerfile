FROM alpine:3.7

LABEL maintainer="ibrahim SEN<ibrahim@promek.net>"

ENV FTP_USER ftpuser
ENV FTP_PASS passwd

RUN apk update && \
    apk upgrade && \
    apk add --no-cache vsftpd

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ftpusers /etc/vsftpd/ftpusers
COPY vsftpd.user_list /etc/vsftpd.user_list

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

VOLUME /home

EXPOSE 20-21 50000-50020

CMD /entrypoint.sh
