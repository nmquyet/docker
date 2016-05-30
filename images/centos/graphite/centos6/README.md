### Port

Port|Description
----|-------------
80  |graphite-web
2003|carbon-cache

### Run Container

```
docker run --name graphite -d -p 80:80 -p 2003:2003 \
    -e "AMQP_HOST=" \
    -e "AMQP_PORT=" \
    -e "AMQP_VHOST=" \
    -e "AMQP_EXCHANGE=" \
    -e "AMQP_USER=" \
    -e "AMQP_PASSWORD=" \
    nmquyet/graphite:centos6
```
