############################################
# version : hbasetest:centos
# desc : 安装python2.7.11
############################################
# 设置继承自hbase版本镜像
FROM 10.4.65.226/deeplearning/hbase:1.2.4

# 下面是一些创建者的基本信息
MAINTAINER zhulongchao (541976478@qq.com)

#软件版本信息
ENV PY_VERSION 2.7.11
ENV SOFTWARE_DIR http://10.4.65.35:8080/hdpSoftware
RUN yum clean all
RUN yum install gcc* openssl openssl-devel ncurses-devel.x86_64  bzip2-devel sqlite-devel python-devel zlib

#安装hadoop
RUN wget $SOFTWARE_DIR/Python-$PY_VERSION.tar.xz && mv Python-$PY_VERSION.tar.xz /usr/local
RUN cd /usr/local && xz -d  Python-$PY_VERSION.tar.xz && tar -zxvf Python-$PY_VERSION.tar && ln -s ./hbase-$PY_VERSION hbase && rm -f  hbase-$PY_VERSION-bin.tar.gz

RUN cd /usr/localPython-$PY_VERSION && \
     ./configure --prefix=/usr/local && \
     make && make install

RUN mv /usr/bin/python /usr/bin/python2.7.5 && \
    ln -s /usr/local/bin/python2.7  /usr/bin/python

RUN wget $SOFTWARE_DIR/setuptools-1.4.2.tar.gz && mv setuptools-1.4.2.tar.gz /usr/local
RUN cd /usr/local && tar -xvf setuptools-1.4.2.tar.gz && cd setuptools-1.4.2 && python setup.py install

RUN wget $SOFTWARE_DIR/get-pip.py && python get-pip.py


