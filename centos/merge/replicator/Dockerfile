FROM 10.4.65.226/linux/centos:ssh-7

RUN yum clean all && yum makecache
RUN yum install -y dos2unix

RUN cd /home && mkdir rocketmq-mysql && cd rocketmq-mysql \
    && wget http://10.4.65.35:8080/hdpSoftware/rocketmq-mysql-pack.tar.gz && tar -zxf  rocketmq-mysql-pack.tar.gz \
    && rm -rf rocketmq-mysql-pack.tar.gz

RUN cd /home/rocketmq-mysql/bin &&  dos2unix *

