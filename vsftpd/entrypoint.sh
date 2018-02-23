#!/bin/sh

: ${FTP_USER}
: ${FTP_PASS}

if ! [ -f /home/.setpwd ]; then
    addgroup -g 1000 -S $FTP_USER
    adduser -D -G $FTP_USER -h /home/files -s /bin/false $FTP_USER
    echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd
    chown $FTP_USER:$FTP_USER /home/files/ -R
    echo "!!!DO NOT DELETE!!! promek/vsftpd docker container" > /home/.setpwd
fi

if [ -z $1 ]; then
  /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
else
  $@
fi
