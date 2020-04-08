# promek/fluentd-pgs

github : https://github.com/promek/dockers/tree/master/fluentd-pgs

Fluentd debian image with PostgreSQL plugin

## Examples

-----------------------
```bash
docker pull promek/fluentd-pgs

docker run -d --name flttest \
    -p "5440:5440" \
    -v /path/to/etc:/fluentd/etc \
    -v /path/to/log:/fluentd/log \
    promek/fluentd-pgs
```

$ vi /path/to/etc/fluent.conf
<source>
  @type http
  tag restpgs
  port 5440
  bind 0.0.0.0
  body_size_limit 32m
  keepalive_timeout 10s
  <parse>
    @type "regexp"
    expression /=(?<body>\S+)&([^=]+)=(?<subject>\S+)/
  </parse>
</source>

<match restpgs.**>
  @type postgres
  host 192.168.1.10
  database postgre_dbn
  username postgre_usr
  password secretpassw
  key_names field1,field2
  sql INSERT INTO notify (field1,field2) VALUES ($1,$2)
  flush_intervals 5s
</match>
