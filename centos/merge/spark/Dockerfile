############################################
# version : spark:2.1.0
# desc : 安装spark
############################################
# 设置继承自centos ssh ,java版本镜像
FROM 10.4.65.226/linux/centos:ssh-7

# 下面是一些创建者的基本信息
MAINTAINER wangwei (www6v@126.com)

#软件版本信息
ENV SPARK_VERSION 2.1.0
ENV SCALA_VERSION 2.11.8

#安装scala
RUN wget http://10.4.65.35:8080/hdpSoftware/scala-$SCALA_VERSION.tgz && mv  scala-$SCALA_VERSION.tgz /usr/local
RUN cd /usr/local && tar -zxvf  scala-$SCALA_VERSION.tgz && ln -s ./scala-$SCALA_VERSION scala

#配置scala环境变量
ENV SCALA_HOME /usr/local/scala
RUN echo "export SCALA_HOME=$SCALA_HOME" >> /etc/profile && \
    echo "export PATH=\$PATH:\$SCALA_HOME/bin" >> /etc/profile

#安装spark
RUN wget http://10.4.65.35:8080/hdpSoftware/spark-$SPARK_VERSION-bin-hadoop2.7.tgz && mv spark-$SPARK_VERSION-bin-hadoop2.7.tgz /usr/local
RUN cd /usr/local && tar -zxvf spark-$SPARK_VERSION-bin-hadoop2.7.tgz  && ln -s ./spark-$SPARK_VERSION-bin-hadoop2.7 spark && rm -f  spark-$SPARK_VERSION-bin-hadoop2.7.tgz

#配置spark环境变量
ENV SPARK_HOME /usr/local/spark
RUN echo "export SPARK_HOME=$SPARK_HOME" >> /etc/profile && \
    echo "export PATH=\$PATH:\$SPARK_HOME/bin" >> /etc/profile && \
    echo "SPARK_NO_DAEMONIZE=false" >>  /etc/profile && \
    echo "BatchMode yes" >>  /etc/ssh/ssh_config && \
    echo "StrictHostKeyChecking no" >>  /etc/ssh/ssh_config