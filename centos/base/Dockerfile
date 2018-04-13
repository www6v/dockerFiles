############################################
# version : centos:ssh-7
# desc : centos上安装的ssh
############################################
# 设置继承自centos 7.1官方镜像
FROM 10.4.65.226/linux/centos:7.1

# 下面是一些创建者的基本信息
MAINTAINER wangwei (www6v@126.com)

USER	root

# root password
RUN echo 'root:password' | chpasswd

# 为解决Header V3 RSA/SHA256 Signature, key ID f4a80eb5: NOKEY问题
RUN rpm --import /etc/pki/rpm-gpg/RPM*

######	install basic tools	#####
RUN yum clean all
RUN	yum install -y curl which tar sudo openssh-server openssh-clients rsync vim wget less passwd && yum clean all


#软件版本信息
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

######	配置 ssh		#####
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys


RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config
RUN sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config \
    && echo "BatchMode yes" >>  /etc/ssh/ssh_config \
    && echo "StrictHostKeyChecking no" >>  /etc/ssh/ssh_config \
    && echo 'Asia/Shanghai' >/etc/timezone

RUN mkdir /var/run/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]