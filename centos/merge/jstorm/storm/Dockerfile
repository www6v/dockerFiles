FROM 10.4.65.226/deeplearning/jstorm:2.2.1

# 下面是一些创建者的基本信息
MAINTAINER wangwei (www6v@126.com)

ENV TZ "Asia/Shanghai"

# Install required packages
# RUN apk add --no-cache --update\
RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-server \
    openssh-client \
    vim

RUN mv /etc/ssh/sshd_config /etc/ssh/sshd_configbak

COPY sshd_config /etc/ssh/sshd_config

#软件版本信息
ENV JDK_VERSION 1.8.0_121

#安装和配置java环境
RUN wget http://10.4.65.35:8080/hdpSoftware/jdk$JDK_VERSION.tar && mv jdk$JDK_VERSION.tar /usr/local
RUN cd /usr/local && tar -zxvf jdk$JDK_VERSION.tar && rm -f jdk$JDK_VERSION.tar && ln -s ./jdk$JDK_VERSION jdk

ENV JAVA_HOME /usr/local/jdk
ENV CLASSPATH .:$JAVA_HOME/lib:$JAVA_HOME/jre/lib/ext
ENV PATH $JAVA_HOME/bin:$PATH

RUN chmod +x /usr/local/jdk/bin/*

RUN echo "JAVA_HOME=$JAVA_HOME" >> /etc/profile \
    && echo "CLASSPATH=./:\$JAVA_HOME/lib:\$JAVA_HOME/jre/lib/ext" >> /etc/profile \
    && echo "PATH=\$JAVA_HOME/bin:\$JAVA_HOME/jre/bin:\$PATH" >> /etc/profile \
    && echo "export TZ=Asia/Shanghai" >> /etc/profile \
    && echo "export PATH JAVA_HOME CLASSPATH" >> /etc/profile

RUN echo root:password | chpasswd

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD [" /etc/init.d/ssh "," restart"]