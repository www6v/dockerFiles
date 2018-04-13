#!/bin/bash

interval=${WAIT_INTERVAL:-2}
retries=${WAIT_RETRIES:-300}
url=${WAIT_URL}

echo "interval = $interval"
echo "retries = $retries"
echo "url = $url"

if [ -z $url ];then
    echo "wait for url is empty "
    exit 0
fi

count=$retries
while [[ $(curl -f $url 2>/dev/null 1>/dev/null || echo "$?") -gt 0 ]];do
    echo "connect $url fail.... try again($count)"
    ((count=$count-1))
    if [ $count -lt 0 ];then
	break
    fi
    sleep $interval
done

if [ $count = -1 ];then
    echo "fail to connect $url"
    exit 1
else
    echo "success"
    exit 0
fi
