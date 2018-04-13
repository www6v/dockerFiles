############################################
# version : dnsmasq:v1
# desc : dns镜像
############################################
FROM  10.4.65.226/library/alpine:latest

# 下面是一些创建者的基本信息
MAINTAINER wangwei (www6v@126.com)

RUN apk add --no-cache dnsmasq

VOLUME /etc/dnsmasq.d

ADD hosts /etc/dnsmasq.d/hosts
ADD dnsmasq.conf /etc/dnsmasq.conf
ADD start.sh /start.sh

EXPOSE 5353/udp
ENTRYPOINT ["/start.sh"]