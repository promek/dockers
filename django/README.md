# promek/django

github : https://github.com/promek/dockers/tree/master/django

An alpine image with Django

## Environment Variables

* **GNC_BIND:** (default : 0.0.0.0:8080)
* **GNC_WORKERS:** (default : 3)

## Examples

-----------------------
```bash
docker pull promek/django:1.11.22

docker run -d --name wstest \
    -e GNC_BIND="0.0.0.0:8080" \
    -e GNC_WORKERS="3" \
    -v /path/to/data:/home \
    -p "8080:8080" \
    promek/django:1.11.22
```
