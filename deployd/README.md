# promek/deployd

An alpine image with Deployd 

## Environment Variables

 -- Deployd Modules : dpd-count,dpd-fileupload,dpd-event
* **DPD_MODS:** (default : dpd-count)
 
 -- mongo 

* **MNG_HOST:** (default : 172.17.0.3)
* **MNG_PORT:** (default : 27017)
* **MNG_DBNM:** (default : admin)
* **MNG_USER:** (default : root)
* **MNG_PASS:** (default : passwd)


## Examples

-----------------------
```bash
docker pull promek/deployd

docker run -d --name dpd \
    -e DPD_MODS="dpd-count,dpd-fileupload"
    -e MNG_HOST="172.17.0.3" \
    -e MNG_PORT="27017" \
    -e MNG_DBNM="admin" \
    -e MNG_USER="dbuser" \
    -e MNG_PASS="secret-passwd" \
    -v /path/to/data:/home \
    -p "2403:2403" \
    promek/deployd
```

