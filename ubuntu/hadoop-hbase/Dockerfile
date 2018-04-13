############################################
# version : deeplearning/ubt14-hadoop-hbase:v1
# desc : ubuntu上安装的ssh，java, hadoop
############################################
FROM 10.4.65.226/linux/ubuntu:ssh-1404

# 下面是一些创建者的基本信息
MAINTAINER wangwei (www6v@126.com)

#为hadoop集群提供dns服务
RUN sudo apt-get -y install dnsmasq

#软件版本信息
ENV JDK_VERION 1.8.0_121
ENV HADOOP_VERSION 2.7.3
ENV HBASE_VERSION 1.2.4

#安装和配置java环境
COPY ../../tar.gz/jdk$JDK_VERSION.tar /usr/local
RUN cd /usr/local && tar -zxvf jdk$JDK_VERSION.tar && rm -f jdk$JDK_VERSION.tar

ENV JAVA_HOME /usr/local/jdk$JDK_VERSION
ENV CLASSPATH ${JAVA_HOME}/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH $PATH:${JAVA_HOME}/bin

#安装和配置 hadoop
RUN groupadd hadoop
RUN useradd -m hadoop -g hadoop
RUN echo "hadoop:hadoop" | chpasswd

COPY ../../tar.gz/hadoop-$HADOOP_VERSION.tar.gz /usr/local
RUN cd /usr/local && tar -zxvf hadoop-$HADOOP_VERSION.tar.gz && rm -f  hadoop-$HADOOP_VERSION.tar.gz
RUN chown -R hadoop:hadoop /usr/local/hadoop-$HADOOP_VERSION
RUN cd /usr/local && ln -s ./hadoop-$HADOOP_VERSION hadoop

ENV HADOOP_PREFIX /usr/local/hadoop
ENV HADOOP_HOME /usr/local/hadoop
ENV HADOOP_COMMON_HOME /usr/local/hadoop
ENV HADOOP_HDFS_HOME /usr/local/hadoop
ENV HADOOP_MAPRED_HOME /usr/local/hadoop
ENV HADOOP_YARN_HOME /usr/local/hadoop
ENV HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop
ENV PATH ${HADOOP_HOME}/bin:$PATH

#安装和配置 hbase
COPY ../../tar.gz/hbase-$HBASE_VERSION-bin.tar.gz /usr/local/
RUN cd /usr/local && tar -zxvf hbase-$HBASE_VERSION-bin.tar.gz && rm -f hbase-$HBASE_VERSION-bin.tar.gz
RUN chown -R hadoop:hadoop /usr/local/hbase-$HBASE_VERSION
RUN cd /usr/local && ln -s ./hbase-$HBASE_VERSION hbase

ENV HBASE_HOME /usr/local/hbase
ENV PATH ${HBASE_HOME}/bin:$PATH

#配置ssh sudo权限和免密码登录
RUN echo "hadoop ALL= NOPASSWD: ALL" >> /etc/sudoers

USER hadoop
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys