############################################
# version :ar-recog:1.0
# desc : 安装ar-recog
############################################
# 设置继承自centos ssh ,java版本镜像
FROM 10.4.65.226/deeplearning/opencv-ubt:3.1.0

# 下面是一些创建者的基本信息
MAINTAINER wangwei (www6v@126.com)

#软件版本信息
ENV RECOG_VERSION 1.0-SNAPSHOT

RUN cd /home && wget http://10.4.65.35:8080/hdpSoftware/ar-recog-$RECOG_VERSION-bin.tar.gz \
    && tar -zxf ar-recog-$RECOG_VERSION-bin.tar.gz && ln -s ar-recog-1.0.0 ar-recog \
    && mkdir -p /home/ar-recog/log && yum install -y dos2unix \
      && mv /home/cup/bin/libObjReco.so /home/cup/bin/libObjReco.sobak && cd /home/ar-recog && dos2unix bin/* && rm -f /home/ar-recog-$RECOG_VERSION-bin.tar.gz


