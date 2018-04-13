############################################
# version : hbasetest:1.2.4
# desc : 安装hbase
############################################
# 设置继承自python镜像版本
FROM 10.4.65.226/library/python:2.7.11

# 下面是一些创建者的基本信息
MAINTAINER zhulongchao (541976478@qq.com)

#基本软件
RUN apt-get update && \
    apt-get install -y wget unzip tar sudo openssh-server openssh-clients rsync vim wget less passwd

#软件版本信息
ENV HBASE_VERSION 1.2.4
ENV JDK_VERSION 1.8.0_121
ENV SOFTWARE_DIR http://10.4.65.35:8080/hdpSoftware

#安装和配置java环境
RUN wget $SOFTWARE_DIR/jdk$JDK_VERSION.tar && mv jdk$JDK_VERSION.tar /usr/local && \
    cd /usr/local && tar -zxvf jdk$JDK_VERSION.tar && rm -f jdk$JDK_VERSION.tar && ln -s ./jdk$JDK_VERSION jdk

ENV JAVA_HOME /usr/local/jdk
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH $PATH:$JAVA_HOME/bin

RUN chmod +x /usr/local/jdk/bin/* \
    && echo "JAVA_HOME=$JAVA_HOME" >> /etc/profile \
    && echo "CLASSPATH=./:\$JAVA_HOME/lib:\$JAVA_HOME/jre/lib/ext" >> /etc/profile \
    && echo "PATH=\$PATH:\$JAVA_HOME/bin:\$JAVA_HOME/jre/bin" >> /etc/profile \
    && echo "export PATH JAVA_HOME CLASSPATH" >> /etc/profile \

#安装 hbase
RUN  wget $SOFTWARE_DIR/hbase-$HBASE_VERSION-bin.tar.gz && mv hbase-$HBASE_VERSION-bin.tar.gz /usr/local && \
    cd /usr/local && tar -zxvf hbase-$HBASE_VERSION-bin.tar.gz  && ln -s ./hbase-$HBASE_VERSION hbase && rm -f  hbase-$HBASE_VERSION-bin.tar.gz


#配置Hbase环境变量
ENV HBASE_HOME /usr/local/hbase
ENV PATH $HBASE_HOME/bin:$PATH
RUN echo "export HBASE_HOME=$HBASE_HOME" >> /etc/profile && \
    echo "export PATH=\$PATH:\$HBASE_HOME/bin" >> /etc/profile && \
    echo "BatchMode yes" >>  /etc/ssh/ssh_config && \
    echo "StrictHostKeyChecking no" >>  /etc/ssh/ssh_config

