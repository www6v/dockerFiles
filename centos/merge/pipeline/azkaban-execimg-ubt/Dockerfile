############################################
# version : azkaban-exec-orb:ubt-3.1.6
# desc : 安装 orb feature extract
############################################
# 设置继承自ubuntu版本镜像
FROM registry.cn-hangzhou.aliyuncs.com/lenovo-arcloud/cup:1.0.2

#安装基础依赖库
RUN apt-get install -y -f apt && \
     apt-get update && \
     apt-get install -y tofrodos

#安装特征提取和计算库,与容器隔离


## 计算版本
ENV AZK_VERSION 3.16.0
ENV JDK_VERSION 1.8.0_121

#安装和配置java环境
RUN wget http://10.4.65.35:8080/hdpSoftware/jdk$JDK_VERSION.tar && mv jdk$JDK_VERSION.tar /usr/local
RUN cd /usr/local && tar -zxvf jdk$JDK_VERSION.tar && rm -f jdk$JDK_VERSION.tar && ln -s ./jdk$JDK_VERSION jdk

ENV JAVA_HOME /usr/local/jdk
ENV CLASSPATH .:$JAVA_HOME/lib:$JAVA_HOME/jre/lib/ext
ENV PATH $PATH:$JAVA_HOME/bin

RUN chmod +x /usr/local/jdk/bin/*

RUN echo "JAVA_HOME=$JAVA_HOME" >> /etc/profile \
    && echo "CLASSPATH=./:\$JAVA_HOME/lib:\$JAVA_HOME/jre/lib/ext" >> /etc/profile \
    && echo "PATH=\$PATH:\$JAVA_HOME/bin:\$JAVA_HOME/jre/bin" >> /etc/profile \
    && echo "export PATH JAVA_HOME CLASSPATH" >> /etc/profile

###### 配置时区 ####
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#安装azkaban
RUN wget http://10.4.65.35:8080/hdpSoftware/azkaban-exec-server-$AZK_VERSION.tar.gz && mv azkaban-exec-server-$AZK_VERSION.tar.gz /usr/local
RUN cd /usr/local && tar -zxvf azkaban-exec-server-$AZK_VERSION.tar.gz  && ln -s ./azkaban-exec-server-$AZK_VERSION azkaban-exec-server && rm -f azkaban-exec-server-$AZK_VERSION.tar.gz

RUN sed -i "s/&//" /usr/local/azkaban-exec-server/bin/azkaban-executor-start.sh


CMD ["sh", "-c", "source /etc/profile; cd /usr/local/azkaban-exec-server; fromdos bin/*; bin/azkaban-executor-start.sh"]

