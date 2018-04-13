############################################
# version : diamond
# desc : 安装diamond
############################################
# 设置继承自centos ssh ,java版本镜像
FROM 10.4.65.226/linux/centos:ssh-7

RUN groupadd admin && useradd admin -g admin -p admin && echo 'admin	ALL=(ALL)	NOPASSWD:ALL' >> /etc/sudoers

USER admin

RUN mkdir /home/admin/diamond_server && cd /home/admin/diamond_server && wget http://10.4.65.35:8080/hdpSoftware/taobao-tomcat-7.0.59.tgz \
    && tar xzf taobao-tomcat-7.0.59.tgz && ln -s taobao-tomcat-7.0.59 tomcat

COPY server.xml /home/admin/diamond_server/tomcat/conf

RUN cd /home/admin/diamond_server/tomcat/deploy && wget http://10.4.65.35:8080/hdpSoftware/diamond.tgz \
    && tar xzf diamond.tgz

RUN cd /home/admin/diamond_server/tomcat/deploy && rm -f diamond.tgz && mv diamond.war diamond-server

CMD sh /home/admin/diamond_server/tomcat/bin/startup.sh