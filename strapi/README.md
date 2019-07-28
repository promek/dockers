# promek/django

github : https://github.com/promek/dockers/tree/master/strapi

Strapi Docker image

## Examples

-----------------------
```bash
docker pull promek/strapi:beta

# sqlite
docker run -d --name apitest \
    -v strapi-app:/usr/src/api \
    -p 1337:1337 \
    promek/strapi:beta

# mongo
docker run -d --name apitest \
    -e START_PARAMS=start \
    -e APP_NAME=strapi-app \
    -e DATABASE_CLIENT=mongo \
    -e DATABASE_HOST=strapi-mongo \
    -e DATABASE_PORT=27017 \
    -e DATABASE_NAME=strapi \
    -v strapi-app:/usr/src/api \
    --link strapi-mongo:mongo \
    -p 1337:1337 \
    promek/strapi:beta
```
