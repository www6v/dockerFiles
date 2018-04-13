############################################
# version : centos:hadoop:2.7.3
# desc : centos上安装的hadoop
############################################
# 设置继承自centos14.04官方镜像
FROM 10.4.65.226/linux/centos:ssh-7

# 下面是一些创建者的基本信息
MAINTAINER wangwei (www6v@126.com)

#软件版本信息
ENV HADOOP_VERSION 2.7.3

#安装hadoop
COPY ../../../../tar.gz/hadoop-$HADOOP_VERSION.tar.gz /opt
RUN cd /opt && tar -zxvf hadoop-$HADOOP_VERSION.tar.gz && rm -f  hadoop-$HADOOP_VERSION.tar.gz
RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop
RUN cp /etc/hadoop/mapred-site.xml.template /etc/hadoop/mapred-site.xml
RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs
RUN mkdir /hadoop-data


ENV HADOOP_PREFIX=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1

ENV USER=root
ENV PATH $HADOOP_PREFIX/bin/:$PATH

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]