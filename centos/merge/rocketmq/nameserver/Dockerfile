############################################
# version : rocketmq:4.0.0
# desc : 安装rocketmq
############################################
# 设置继承自centos ssh ,java版本镜像
FROM 10.4.65.226/linux/centos:ssh-7

# 下面是一些创建者的基本信息
MAINTAINER wangwei (www6v@126.com)

#安装rocketmq
RUN wget http://10.4.65.35:8080/hdpSoftware/apache-rocketmq-all.tar.gz && mkdir /usr/local/apache-rocketmq-all &&mv apache-rocketmq-all.tar.gz /usr/local/apache-rocketmq-all
RUN cd /usr/local/apache-rocketmq-all && tar -zxvf apache-rocketmq-all.tar.gz  && rm -f apache-rocketmq-all.tar.gz
