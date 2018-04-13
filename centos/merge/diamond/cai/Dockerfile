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

## add admin user ###
RUN groupadd admin && useradd admin -g admin -p admin && echo 'admin	ALL=(ALL)	NOPASSWD:ALL' >> /etc/sudoers


COPY nginx-proxy.conf /home/admin/cai/conf/

RUN chown -R admin:admin /home/admin && chmod 755 -R /home/admin

## install nginx ###
USER admin
RUN cd  /home/admin && wget http://10.4.65.35:8080/hdpSoftware/cai.tgz \
    && tar xzf cai.tgz

EXPOSE 8080
CMD sudo /home/admin/cai/bin/nginxctl restart