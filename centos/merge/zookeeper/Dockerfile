############################################
# version : zookeeper:3.4.8
# desc : 安装zookeeper
############################################
# 设置继承自centos ssh ,java版本镜像
FROM 10.4.65.226/linux/centos:ssh-7

# 下面是一些创建者的基本信息
MAINTAINER wangwei (www6v@126.com)

#ZK的版本信�?ENV ZK_VERSION 3.4.8

#安装ZK
RUN wget http://10.4.65.35:8080/hdpSoftware/zookeeper-$ZK_VERSION.tar.gz && mv zookeeper-$ZK_VERSION.tar.gz /opt
RUN cd /opt && tar -zxf zookeeper-$ZK_VERSION.tar.gz && rm -f  zookeeper-$ZK_VERSION.tar.gz
RUN cd /opt && ln -s ./zookeeper-$ZK_VERSION zookeeper

RUN mkdir -p /opt/data
RUN mkdir -p /opt/log


ENV ZK_HOME /opt/zookeeper
ENV PATH $PATH:$ZOO_HOME/bin

RUN echo "ZK_HOME=$ZK_HOME" >> /etc/profile \
   && echo "PATH=\$PATH:\$ZK_HOME/bin" >> /etc/profile \
    && echo "export PATH ZK_HOME" >> /etc/profile

EXPOSE 2181 2888 3888
ENV TZ "Asia/Shanghai"


RUN sed -i 's/^\s*ZOO_LOG4J_PROP=.*.$/ZOO_LOG4J_PROP="INOF,ROLLINGFILE"/' $ZK_HOME/bin/zkEnv.sh
RUN sed -i 's/^\s*ZOO_LOG_DIR=.*.$/ZOO_LOG_DIR="\/opt\/log"/' $ZK_HOME/bin/zkEnv.sh

CMD ["sh", "-c", "/opt/zookeeper/bin/zkServer.sh start ; /usr/sbin/sshd -D"]