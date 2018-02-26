# promek/vsftpd

github : https://github.com/promek/dockers/tree/master/vsftpd

An alpine:3.7 image with vsftpd. 

## Environment Variables

* **FTP_USER:** (default : ftpuser)
* **FTP_PASS:** (default : passwd)

## Examples

-----------------------
```bash
docker pull promek/vsftpd

docker run -d --name vsftp \
    -e FTP_USER=ftpuser \
    -e FTP_PASS=secret-passwd \
    -v /path/to/data:/home \
    -p 20-21:20-21 -p 50000-50020:50000-50020 \
    promek/vsftpd
```
