############################################
# version : predictionIo:0.11
# desc : 安装predictionIo
############################################
# 设置继承自centos ssh ,java版本镜像
FROM 10.4.65.226/linux/centos:ssh-7

# 下面是一些创建者的基本信息
MAINTAINER wangwei (www6v@126.com)

#软件版本信息
ENV HADOOP_VERSION 2.7.3
ENV HBASE_VERSION 2.0.0-SNAPSHOT
ENV SPARK_VERSION 2.1.0
ENV SCALA_VERSION 2.11.8
ENV ELS_VERSION 5.2.2
ENV PIO_VERSION 0.11.1-SNAPSHOT

#安装依赖环境hadoop，hbase，elasticsearch，spark
RUN wget http://10.4.65.35:8080/hdpSoftware/pio-dependency.tar.gz && mv pio-dependency.tar.gz /usr/local
RUN cd /usr/local && tar -zxvf pio-dependency.tar.gz  && ln -s ./hadoop-$HADOOP_VERSION hadoop && rm -f  pio-dependency.tar.gz \
     && ln -s ./hbase-$HBASE_VERSION hbase  && ln -s ./scala-$SCALA_VERSION scala  && ln -s ./spark-$SPARK_VERSION-bin-hadoop2.7 spark \
     && mv  elasticsearch-$ELS_VERSION /usr/share && ln -s ./elasticsearch-$ELS_VERSION elasticsearch


#安装predictionIo
RUN wget http://10.4.65.35:8080/hdpSoftware/PredictionIO-$PIO_VERSION.tar.gz && mv PredictionIO-$PIO_VERSION.tar.gz /usr/local \
     && cd /usr/local && tar -zxvf PredictionIO-$PIO_VERSION.tar.gz && ln -s ./PredictionIO-$PIO_VERSION PredictionIO && rm -f PredictionIO-$PIO_VERSION.tar.gz


#设置环境变量

ENV SCALA_HOME /usr/local/scala
RUN echo "export SCALA_HOME=$SCALA_HOME" >> /etc/profile && \
    echo "export PATH=\$PATH:\$SCALA_HOME/bin" >> /etc/profile

ENV ES_HOME /usr/share/elasticsearch
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "export ES_HOME=$ES_HOME" >> /etc/profile && \
    echo "export PATH=\$PATH:\$ES_HOME/bin" >> /etc/profile && \
    echo "BatchMode yes" >>  /etc/ssh/ssh_config && \
    echo "StrictHostKeyChecking no" >>  /etc/ssh/ssh_config

ENV HADOOP_HOME /usr/local/hadoop
ENV HADOOP_PREFIX /usr/local/hadoop
ENV HADOOP_COMMON_HOME /usr/local/hadoop
ENV HADOOP_HDFS_HOME /usr/local/hadoop
ENV HADOOP_MAPRED_HOME /usr/local/hadoop
ENV HADOOP_YARN_HOME /usr/local/hadoop
ENV HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop
ENV YARN_CONF_DIR $HADOOP_PREFIX/etc/hadoop
ENV PATH $HADOOP_HOME/bin:$PATH

RUN echo "export HADOOP_PREFIX=$HADOOP_PREFIX" >> /etc/profile && \
    echo "export HADOOP_HOME=$HADOOP_HOME" >> /etc/profile && \
    echo "export HADOOP_COMMON_HOME=$HADOOP_HOME" >> /etc/profile && \
    echo "export HADOOP_HDFS_HOME=$HADOOP_HOME" >> /etc/profile && \
    echo "export HADOOP_MAPRED_HOME=$HADOOP_HOME" >> /etc/profile && \
    echo "export HADOOP_YARN_HOME=$HADOOP_HOME" >> /etc/profile && \
    echo "export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop" >> /etc/profile && \
    echo "export YARN_CONF_DIR=$HADOOP_HOME/etc/hadoop" >> /etc/profile

ENV HBASE_HOME /usr/local/hbase

#配置Hbase环境变量
RUN echo "export HBASE_HOME=$HBASE_HOME" >> /etc/profile && \
    echo "export PATH=\$PATH:\$HBASE_HOME/bin" >> /etc/profile

ENV SPARK_HOME /usr/local/spark
RUN echo "export SPARK_HOME=$SPARK_HOME" >> /etc/profile && \
    echo "export PATH=\$PATH:\$SPARK_HOME/bin" >> /etc/profile && \
    echo "SPARK_NO_DAEMONIZE=false" >>  /etc/profile

ENV PIO_HOME /usr/local/PredictionIO
RUN echo "export PIO_HOME=$PIO_HOME" >> /etc/profile && \
    echo "export PATH=\$PATH:\$PIO_HOME/bin" >> /etc/profile


CMD ["sh", "-c", "source /etc/profile ; pio eventserver"]