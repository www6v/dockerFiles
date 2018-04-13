############################################
# version : deeplearning/ubt14-hadoop-hbase-zk-conf:v1
# desc : 在配置好hadoop,hbase配置好的镜像基础上，配置zk
############################################
FROM 10.4.65.226/deeplearning/ubt14-hadoop-hbase:v1-conf

# 下面是一些创建者的基本信息
MAINTAINER wangwei (www6v@126.com)

#ZK的版本信息
ENV ZK_VERSION 3.4.8

#安装ZK
COPY ../../tar.gz/zookeeper-$ZK_VERSION.tar.gz /usr/local
RUN cd /usr/local && tar -zxvf zookeeper-$ZK_VERSION.tar.gz && rm -f  zookeeper-$ZK_VERSION.tar.gz
RUN chown -R hadoop:hadoop /usr/local/zookeeper-$ZK_VERSION
RUN cd /usr/local && ln -s ./zookeeper-$ZK_VERSION zookeeper

ENV ZK_HOME /usr/local/zookeeper

#配置ZK
USER hadoop
RUN sudo mkdir -p /opt/hadoop/data/zookeeper
RUN mv $ZK_HOME/conf/zoo_sample.cfg $ZK_HOME/conf/zoo.cfg
RUN sed -i 's/dataDir=.*/dataDir=\/opt\/hadoop\/data\/zookeeper\//g' $ZK_HOME/conf/zoo.cfg