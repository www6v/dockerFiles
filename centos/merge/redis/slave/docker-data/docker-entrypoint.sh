#!/bin/sh

if [ "$1" = 'redis-slave' ]; then
    for port in `seq 7003 7005`; do
      mkdir -p /redis-conf/${port}
      mkdir -p /redis-data/${port}

      if [ -e /redis-data/${port}/nodes.conf ]; then
        rm /redis-data/${port}/nodes.conf
      fi
    done

    for port in `seq 7003 7005`; do
      PORT=${port} envsubst < /redis-conf/redis-cluster.tmpl > /redis-conf/${port}/redis.conf
    done


    supervisord -c /etc/supervisor/supervisord.conf
    sleep 3
    tail -f /var/log/supervisor/redis*.log
else
  exec "$@"
fi
