############################################
# version : azkaban-exec:3.1.6
# desc : 安装azkaban-exec-server
############################################
# 设置继承自centos ssh ,java版本镜像
FROM 10.4.65.226/deeplearning/hadoop:2.7.3v2

# 下面是一些创建者的基本信息
MAINTAINER wangwei (www6v@126.com)


##
ENV AZK_VERSION 3.16.0

###### 配置时区 ####
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#安装azkaban
RUN wget http://10.4.65.35:8080/hdpSoftware/azkaban-exec-server-$AZK_VERSION.tar.gz && mv azkaban-exec-server-$AZK_VERSION.tar.gz /usr/local
RUN cd /usr/local && tar -zxvf azkaban-exec-server-$AZK_VERSION.tar.gz  && ln -s ./azkaban-exec-server-$AZK_VERSION azkaban-exec-server && rm -f azkaban-exec-server-$AZK_VERSION.tar.gz

RUN sed -i "s/&//" /usr/local/azkaban-exec-server/bin/azkaban-executor-start.sh



CMD ["sh", "-c", "cd /usr/local/azkaban-exec-server ; bin/azkaban-executor-start.sh"]
