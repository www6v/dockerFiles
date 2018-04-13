############################################
# version : diamond-ops
# desc : 安装diamond-ops
############################################
# 设置继承自centos ssh ,java版本镜像
FROM 10.4.65.226/linux/centos:ssh-7

RUN groupadd admin && useradd admin -g admin -p admin && echo 'admin	ALL=(ALL)	NOPASSWD:ALL' >> /etc/sudoers

USER admin

RUN mkdir /home/admin/diamond-ops && cd /home/admin/diamond-ops && wget http://10.4.65.35:8080/hdpSoftware/taobao-tomcat-7.0.59.tgz \
    && tar xzf taobao-tomcat-7.0.59.tgz && ln -s taobao-tomcat-7.0.59 tomcat

COPY server.xml /home/admin/diamond-ops/tomcat/conf

RUN cd /home/admin/diamond-ops/tomcat/deploy && wget http://10.4.65.35:8080/hdpSoftware/diamondops.tgz \
    && tar xzf diamondops.tgz

RUN cd /home/admin/diamond-ops/tomcat/deploy && rm -f diamondops.tgz && mv diamondops.war diamond-ops

CMD sh /home/admin/diamond-ops/tomcat/bin/startup.sh
