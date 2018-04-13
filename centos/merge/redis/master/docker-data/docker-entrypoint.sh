#!/bin/sh

if [ "$1" = 'redis-cluster' ]; then
    for port in `seq 7000 7002`; do
      mkdir -p /redis-conf/${port}
      mkdir -p /redis-data/${port}

      if [ -e /redis-data/${port}/nodes.conf ]; then
        rm /redis-data/${port}/nodes.conf
      fi
    done

    for port in `seq 7000 7002`; do
      PORT=${port} envsubst < /redis-conf/redis-cluster.tmpl > /redis-conf/${port}/redis.conf
    done

    supervisord -c /etc/supervisor/supervisord.conf
    sleep 3

    #echo "yes" | ruby /redis/src/redis-trib.rb create --replicas 1 redis-master:7000 redis-master:7001 redis-master:7002 redis-slave:7003 redis-slave:7004 redis-slave:7005
    #echo "yes" | ruby /redis/src/redis-trib.rb create --replicas 1 172.3.0.200:7000 172.3.0.200:7001 172.3.0.200:7002 172.3.0.201:7003 172.3.0.201:7004 172.3.0.201:7005
    tail -f /var/log/supervisor/redis*.log
elsele
  exec "$@"
fi
