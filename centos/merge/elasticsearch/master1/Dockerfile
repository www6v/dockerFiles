############################################
# version : elasticsearch:5.2.2
# desc : 安装spark
############################################
# 设置继承自centos ssh ,java版本镜像
FROM  ubuntu:16.04
 
 
# 下面是一些创建者的基本信息
MAINTAINER wangwei (www6v@126.com)

#软件版本信息
ENV ELS_VERSION 5.2.2

#安装scala
RUN apt-get update
RUN apt-get -y install wget 
RUN wget http://10.4.65.35:8080/hdpSoftware/elasticsearch-$ELS_VERSION.tar.gz && mv  elasticsearch-$ELS_VERSION.tar.gz /usr/share
RUN cd /usr/share && tar -zxvf elasticsearch-$ELS_VERSION.tar.gz && ln -s ./elasticsearch-$ELS_VERSION elasticsearch && rm -rf  elasticsearch-$ELS_VERSION.tar.gz

# photo lib
RUN sed -i 's/http:\/\/archive\.ubuntu\.com\/ubuntu\//http:\/\/mirrors\.163\.com\/ubuntu\//g' /etc/apt/sources.list 
RUN apt-get update && apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler libgflags-dev libgoogle-glog-dev liblmdb-dev libatlas-base-dev libboost-all-dev

# java
#RUN  add-apt-repository ppa:openjdk/ppa
#RUN  add-apt-repository ppa:openjdk-r/ppa
RUN  apt-get update
RUN  apt-get -y install openjdk-8-jdk
RUN  apt-get -y install openjdk-8-jre 
#RUN  apt-get -y install openjdk-8-jre openjdk-8-jdk-headlesss
#RUN  update-alternatives -config java
#RUN  update-alternatives -config javac

ENV ES_HOME /usr/share/elasticsearch
RUN groupadd es \
     && useradd elasticsearch -g es -p elasticsearch \
     && chmod 755 -R "$ES_HOME" \
     && chown -R elasticsearch:es /usr/share/elasticsearch/

RUN set -ex \
    && for path in \
           /usr/share/elasticsearch/data \
           /usr/share/elasticsearch/logs \
           /usr/share/elasticsearch/config \
           /usr/share/elasticsearch/config/scripts \
    ; do \
    	mkdir -p "$path"; \
    	chown -R elasticsearch:es "$path"; \
     done

#环境变量
 
#RUN mkdir /etc/localtime
RUN mkdir /etc/ssh &&  touch /etc/ssh/ssh_config
#RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "export ES_HOME=$ES_HOME" >> /etc/profile && \
    echo "export PATH=\$PATH:\$ES_HOME/bin" >> /etc/profile && \
    echo "BatchMode yes" >>  /etc/ssh/ssh_config && \
    echo "StrictHostKeyChecking no" >>  /etc/ssh/ssh_config

ONBUILD RUN echo "\* soft nofile 64000" >> /etc/security/limits.conf
ONBUILD RUN echo "\* hard nofile 75000" >> /etc/security/limits.conf
ONBUILD RUN echo vm.max_map_count=262144 > /etc/sysctl.d/max_map_count.conf
ONBUILD RUN echo vm.swappiness=0 > /etc/sysctl.d/swappiness.conf


CMD ["sh", "-c", "chown -R elasticsearch:es /usr/share/elasticsearch/ ; su elasticsearch /usr/share/elasticsearch/bin/elasticsearch"]