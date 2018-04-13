#!/usr/bin/env bash
supervisord -c /etc/supervisor.d/redis.ini
sleep 5
