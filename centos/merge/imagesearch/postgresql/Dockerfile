############################################
# version : postgres:imgsmlr-9.5.6
# desc : 安装 imgslmr
############################################
# 设置继承自postgres 9.5.6
FROM daocloud.io/library/postgres:9.5.6-alpine

# base tool
RUN apk --update add git make gcc musl-dev gd-dev

# compile & install imgsmlr
RUN cd /usr/local && \
     git clone https://github.com/postgrespro/imgsmlr && \
     cd imgsmlr && make USE_PGXS=1 && make USE_PGXS=1 install









