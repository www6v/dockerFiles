############################################
# version : hadoop:2.7.3-all
# desc : 安装hadoop
############################################
# 设置继承自centos ssh ,java版本镜像
FROM 10.4.65.226/linux/centos:ssh-7

# 下面是一些创建者的基本信息
MAINTAINER wangwei (www6v@126.com)

#软件版本信息
ENV HADOOP_VERSION 2.7.3

#安装hadoop
RUN wget http://10.4.65.35:8080/hdpSoftware/hadoop-$HADOOP_VERSION.tar.gz && mv hadoop-$HADOOP_VERSION.tar.gz /usr/local
RUN cd /usr/local && tar -zxvf hadoop-$HADOOP_VERSION.tar.gz  && ln -s ./hadoop-$HADOOP_VERSION hadoop && rm -f  hadoop-$HADOOP_VERSION.tar.gz


ENV HADOOP_HOME /usr/local/hadoop
ENV HADOOP_PREFIX /usr/local/hadoop
ENV HADOOP_COMMON_HOME /usr/local/hadoop
ENV HADOOP_HDFS_HOME /usr/local/hadoop
ENV HADOOP_MAPRED_HOME /usr/local/hadoop
ENV HADOOP_YARN_HOME /usr/local/hadoop
ENV HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop
ENV YARN_CONF_DIR $HADOOP_PREFIX/etc/hadoop
ENV PATH $HADOOP_HOME/bin:$PATH

#配置Hadoop环境变量
RUN echo "export HADOOP_PREFIX=$HADOOP_PREFIX" >> /etc/profile && \
    echo "export HADOOP_HOME=$HADOOP_HOME" >> /etc/profile && \
    echo "export HADOOP_COMMON_HOME=$HADOOP_HOME" >> /etc/profile && \
    echo "export HADOOP_HDFS_HOME=$HADOOP_HOME" >> /etc/profile && \
    echo "export HADOOP_MAPRED_HOME=$HADOOP_HOME" >> /etc/profile && \
    echo "export HADOOP_YARN_HOME=$HADOOP_HOME" >> /etc/profile && \
    echo "export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop" >> /etc/profile && \
    echo "export YARN_CONF_DIR=$HADOOP_HOME/etc/hadoop" >> /etc/profile && \
    echo "export PATH=\$PATH:\$HADOOP_HOME/bin" >> /etc/profile && \
    echo "BatchMode yes" >>  /etc/ssh/ssh_config && \
    echo "StrictHostKeyChecking no" >>  /etc/ssh/ssh_config

