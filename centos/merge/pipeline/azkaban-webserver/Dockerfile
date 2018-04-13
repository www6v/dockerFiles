############################################
# version : azkaban-web-server:3.1.6
# desc : 安装azkaban-web-server
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
RUN wget http://10.4.65.35:8080/hdpSoftware/azkaban-web-server-$AZK_VERSION.tar.gz && mv azkaban-web-server-$AZK_VERSION.tar.gz /usr/local
RUN cd /usr/local && tar -zxvf azkaban-web-server-$AZK_VERSION.tar.gz  && ln -s ./azkaban-web-server-$AZK_VERSION azkaban-web-server && rm -f azkaban-web-server-$AZK_VERSION.tar.gz \
      && mkdir azkaban-web-server/logs/ && sed -i "s/&//" azkaban-web-server/bin/azkaban-web-start.sh


CMD ["sh", "-c", "cd /usr/local/azkaban-web-server ; bin/azkaban-web-start.sh"]