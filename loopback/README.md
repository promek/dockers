# promek/loopback

github : https://github.com/promek/dockers/tree/master/loopback

An alpine image with Loopback

## Environment Variables

-- Loopback Module : loopback-component-storage,loopback-connector-sqlite3,loopback-connector-mysql....
* **LBC_MODS:** (default : loopback-connector-sqlite3)

## Examples

-----------------------
```bash
docker pull promek/loopback

docker run -d --name lbctest \
    -e LBC_MODS="loopback-connector-sqlite3,loopback-component-storage"
    -v /path/to/data:/home \
    -p "3000:3000" \
    promek/loopback
```

