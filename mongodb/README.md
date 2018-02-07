# promek/mongodb

github : https://github.com/promek/dockers/tree/master/mongodb

An alpine:3.7 image with mongodb. 

## Environment Variables

* **MNG_USER:** (default : root)
* **MNG_PASS:** (default : passwd)

## Examples

-----------------------
```bash
docker pull promek/mongodb

docker run -d --name mongo \
    -e MNG_USER="dbuser" \
    -e MNG_PASS="secret-passwd" \
    -v /path/to/data:/data/db \
    -p "27017:27017" \
    promek/mongodb
```
