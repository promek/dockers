# promek/ghost

github : https://github.com/promek/dockers/tree/master/ghost

An alpine image with Ghost 

## Examples

-----------------------
```bash
docker pull promek/ghost:1.24.1

docker run -d --name ght \
    -v /path/to/data:/var/lib/ghost/content \
    -p "80:2368" \
    promek/ghost:1.24.1
```

