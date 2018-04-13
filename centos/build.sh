#!/usr/bin/env bash
docker build -t 10.4.65.226/linux/centos:ssh-7 base
docker build -t 10.4.65.226/deeplearning/hadoop:2.7.3v2 merge/hadoop
docker build -t 10.4.65.226/library/zookeeper:3.4.8 merge/zookeeper

docker build -t 10.4.65.226/deeplearning/hbase:1.2.4 merge/hbase

docker build -t 10.4.65.226/benchmark/hbasetest:1.0 hbasetest/centos

docker build -t 10.4.65.226/deeplearning/azk-web:3.16.0 pipeline/azkaban-webserver

docker build -t 10.4.65.226/deeplearning/azk-exec:3.16.0 pipeline/azkaban-execserver

mysql  -uazkaban -pazkaban azkaban < /root/create-all-sql-3.16.0.sql

docker build -t 10.4.65.226/deeplearning/hbase:2.0.0-SNAPSHOT merge/hbase20

docker build -t 10.4.65.226/library/postgres:imgsmlr-9.5.6 merge/hbase20

docker build -t 10.4.65.226/deeplearning/azkaban-exec-orb:ubt-3.1.6 merge/hbase20

docker build -t 10.4.65.226/deeplearning/spark:std-2.1.0 merge/spark

docker build -t 10.4.65.226/deeplearning/es-head:1.0 .

docker build -t 10.4.65.226/deeplearning/elasticsearch:5.2.2 elasticsearch/master1

docker build -t 10.4.65.226/deeplearning/predictionIo:0.11.1 predictionIo

docker build -t 10.4.65.226/deeplearning/ambry:1.0 ambry

docker build -t 10.4.65.226/deeplearning/jstorm-ui:2.2.1 jstorm/ui

docker build -t 10.4.65.226/deeplearning/redis-slave:3.2.9 redis/slave

docker build -t 10.4.65.226/deeplearning/redis-master:3.2.9 redis/master

docker build -t 10.4.65.226/deeplearning/redis-sentinel:3.2.9 redis/sentinel

docker build -t 10.4.65.226/deeplearning/jstorm-zlc:2.2.1 jstorm/storm

docker build -t 10.4.65.226/deeplearning/ar-recog:1.0 ar-recogcd

docker build -t 10.4.65.226/deeplearning/replicator:1.0.0 replicator

docker build -t 10.4.65.226/deeplearning/picturecloud:1.0.0 .

docker build -t 10.4.65.226/library/arplatform:1.0.0 arplatform

docker build -t 10.4.65.226/deeplearning/ar-image-index:1.0.0 .

docker build -t 10.4.65.226/deeplearning/colmap:1.0.0 .


---gpu with desktop

docker build -t 10.4.65.226/library/docker-ubuntu-desktop:1.0.0 .
docker build -t 10.4.65.226/library/ubuntu-nxserver:1.0.0 .

docker build -t 10.4.65.226/library/ubuntu-nxserver:16.0.4 .

docker build -t 10.4.65.226/gpu/cuda-runtime-8:1.0.0 .

docker build -t 10.4.65.226/gpu/colmap:1.0.4 .

docker build -t=10.4.65.226/library/ubuntu-nomachine-cuda:8.0 .

nvidia-docker build -t 10.4.65.226/library/vnc-nvidia:1.0.0 .

docker build -t ide-ui-base .

docker build -t 10.4.65.226/library/ubt-desktop-cv:1.0.0 .

docker build -t 10.4.65.226/deeplearning/cup:1.0.1 .