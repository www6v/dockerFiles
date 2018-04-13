FROM 10.4.65.226/linux/centos:ssh-7

RUN yum clean all && yum makecache

RUN  yum install -y ImageMagick

ENV PC_VERSION v1.0
RUN cd /home && wget http://10.4.65.35:8080/hdpSoftware/picture-cloud-$PC_VERSION.jar



ENTRYPOINT [ "sh", "-c", "source /etc/profile; java -Xms512m -Xmx512m -jar /home/picture-cloud-$PC_VERSION.jar ; tail -f /dev/null" ]

