############################################
# version :ambry:1.0
# desc : 安装ambry
############################################
# 设置继承自centos ssh ,java版本镜像
FROM 10.4.65.226/linux/centos:ssh-7

# 下面是一些创建者的基本信息
MAINTAINER wangwei (www6v@126.com)

#RUN yum -y install redhat-lsb

RUN mkdir -p /data/ambry/bin &&  mkdir -p /data/ambry/log

COPY ./start-*.sh /data/ambry/

COPY ./ssl/* /data/ambry/

RUN cd /data/ambry && chmod +x /data/ambry/start-*.sh && cd bin/ && wget  http://10.4.65.35:8080/hdpSoftware/ambry.jar

