#!/bin/sh
echo "server=${BIND_PORT_5300_UDP_ADDR}#${BIND_PORT_5300_UDP_PORT}" >> /etc/dnsmasq.conf
# Use -d key for debugging
/usr/sbin/dnsmasq --keep-in-foreground