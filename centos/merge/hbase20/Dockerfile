############################################
# version : hbase:1.2.4
# desc : 安装hbase
############################################
# 设置继承自centos ssh ,java版本镜像
FROM 10.4.65.226/linux/centos:ssh-7

# 下面是一些创建者的基本信息
MAINTAINER wangwei (www6v@126.com)

#软件版本信息
ENV HBASE_VERSION 2.0.0-SNAPSHOT

#安装hadoop
RUN wget http://10.4.65.35:8080/hdpSoftware/hbase-$HBASE_VERSION-bin.tar.gz && mv hbase-$HBASE_VERSION-bin.tar.gz /usr/local
RUN cd /usr/local && tar -zxvf hbase-$HBASE_VERSION-bin.tar.gz  && ln -s ./hbase-$HBASE_VERSION hbase && rm -f  hbase-$HBASE_VERSION-bin.tar.gz

ENV HBASE_HOME /usr/local/hbase
ENV PATH $HBASE_HOME/bin:$PATH

#配置Hadoop环境变量
RUN echo "export HBASE_HOME=$HBASE_HOME" >> /etc/profile && \
    echo "export PATH=\$PATH:\$HBASE_HOME/bin" >> /etc/profile && \
    echo "BatchMode yes" >>  /etc/ssh/ssh_config && \
    echo "StrictHostKeyChecking no" >>  /etc/ssh/ssh_config

