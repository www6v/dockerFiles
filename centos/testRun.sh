#!/usr/bin/env bash

docker run -p 10022:22 -v /root/hdp-docker:/work/dfs/data --name testssh -d 10.4.65.226/linux/centos:ssh-7

docker run -p 10022:22 -v /root/hdp-docker/centos/merge/zookeeper/zoo1:/opt/data  -v /root/hdp-docker/centos/merge/zookeeper/conf:/opt/zookeeper/conf --name zk1 -d 10.4.65.226/library/zookeeper:3.4.8

docker network create zoo


docker run -v /root/benchmark/zk/zk-py:/root/zk-py --name zktest -it 10.4.65.226/benchmark/zktest:1.0 /bin/bash

docker run -p 10055:22 -v /home/benchmark/HiBench:/root/HiBench -v /home/admin/hdp-docker/centos/merge/hadoop/conf:/usr/local/hadoop/etc/hadoop --network hdpOverlay --name hadoop_test -h hadoop_test -it 10.4.65.226/deeplearning/hadoop:2.7.3v2 /bin/bash

docker run -p 10056:22 -v /home/benchmark/ycsb-0.13.0-SNAPSHOT:/root/ycsb -v /home/admin/hdp-docker/centos/merge/hbase/conf:/usr/local/hbase/conf --network hdpOverlay --name hbasetest -it 10.4.65.226/deeplearning/hbase:1.2.4 /bin/bash

docker run -v /root/hdp-docker/centos/merge/pipeline/azkaban-execserver/conf/:/usr/local/azkaban-exec-server/conf/ -v /root/hdp-docker/centos/merge/pipeline/azkaban-execserver/bin/:/usr/local/azkaban-exec-server/bin/ --network hdpOverlay --name azk-master -it  10.4.65.226/deeplearning/azk-exec:3.16.0 /bin/bash

docker run -d --restart=always -p 8101:8080 --name rancher-server registry.cn-hangzhou.aliyuncs.com/ranchers/server:v1.5.3

docker run -e CATTLE_AGENT_IP="10.240.212.164"  -d --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher registry.cn-hangzhou.aliyuncs.com/ranchers/agent:v1.2.1 http://10.4.64.60:8080/v1/scripts/1A25123BC1CC6A30379A:1483142400000:hf5ZrWF01D8akFYKzgcaJ2BjVU

 docker run -e CATTLE_AGENT_IP="10.240.212.182"  --name rancher-agent -d --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.2.1 http://10.240.212.182:8101/v1/scripts/A490B683629E722C51D1:1483142400000:bu7bcfHP8ij9xOQKIkTjXEfInY

docker run -e CATTLE_AGENT_IP="10.240.212.164"  -d --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher registry.cn-hangzhou.aliyuncs.com/ranchers/agent:v1.2.1 http://10.240.212.164:8101/v1/scripts/960D14DECEE5BC094ED8:1483142400000:lJ8zBKtgJzLDJ1Muuv4rcVEj4NU

curl -l -H "Content-type: application/json" -X POST -d '{"messageBody":"{}","password":"test"}' http://domain/apis/users.json

curl -d "messageBody={'video.name':'http://10.4.65.35:8080/hdpSoftware/20170405094622-20170405094548.zip','record.id':'123','alg.name':'ImageFeature_ORB','flow.name':'Reconstruction'}" http://10.240.212.164:8103/topic/processFeature.ar


docker run -p 10024:22 -v /home/admin/testworkspace:/usr/local/workspace --name azk-test -it 10.4.65.226/deeplearning/azk-exec:3.16.0


docker run -p 10127:22 -v /home/admin/testworkspace:/usr/local/workspace --name azk-test-ubuntu -it 10.4.65.226/linux/ubuntu:ssh-1404 /bin/bash

docker run -p 10129:22 -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix --name azk-test-ubuntu-3 -it 10.4.65.226/deeplearning/azkaban-exec-img:ubt14-3.1.6 /bin/bash
docker run -p 10129:22 -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix --name azk-test-ubuntu -it 10.4.65.226/deeplearning/azkaban-exec-orb:ubt-3.1.6 /bin/bash
docker run -p 10129:22 --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix --name azk-test-ubuntu 10.4.65.226/deeplearning/azkaban-exec-orb:ubt-3.1.6

docker run --name postgres -e POSTGRES_PASSWORD=postgres -d daocloud.io/library/postgres:9.5.6-alpine


docker run -v /root/code/hdp-docker/centos/merge/elasticsearch/master1/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml:ro -v /root/code/hdp-docker/centos/merge/elasticsearch/master1/data:/usr/share/elasticsearch/data --name els-test -it 10.4.65.226/deeplearning/elasticsearch:5.2.2 /bin/bash


docker run -p 10321:22  -p 8981:80 -v /home/admin/hdp-docker/centos/merge/nginxfile:/usr/local/nginxfile --network hdpOverlay --name nginx1 -d registry.cn-hangzhou.aliyuncs.com/pengg/nginx-centos

docker run -p 10322:22  -p 8982:80 -v /home/admin/hdp-docker/centos/merge/nginxfile:/usr/local/nginxfile --network hdpOverlay --name nginx2 -d registry.cn-hangzhou.aliyuncs.com/pengg/nginx-centos


docker run  --privileged -p 10057:22  -v /home/admin/flume-monitor:/usr/local/flume-monitor --network hdpOverlay --name flume-monitor -h flume-monitor -d 10.4.65.226/deeplearning/azkaban-exec-img:ubt14-3.1.6


docker run --name jstorm-nimbus --network hdpOverlay -v /home/admin/hdp-docker/centos/merge/jstorm/conf/storm.yaml:/opt/jstorm/conf/storm.yaml -it cranelana/jstorm-2.2.1 /bin/bash

docker run -d -p 28080:8080 --network hdpOverlay --name jstorm-ui -v /home/admin/hdp-docker/centos/merge/jstorm/conf/storm.yaml:/root/.jstorm/storm.yaml 10.4.65.226/deeplearning/jstorm-ui:2.2.1


docker run -p 8080:8080 --name cai -v /home/admin/cai/diamond:/home/admin/cai/htdocs/diamond-server/diamond -it 10.4.65.226/deeplearning/cai:1.0.0 /bin/bash

docker run -p 8080:8080 --network hdpOverlay --name diamond-server -v /home/code/hdp-docker/centos/merge/diamond/server/jdbc.properties:/home/admin/diamond_server/tomcat/depoly/diamond-server/WEB-INF/classes/jdbc.properties -it 10.4.65.226/deeplearning/diamond-server:1.0.0 /bin/bash


docker run -d --name zkui -p 9097:9090 --network hdpOverlay -e ZKUI_ZK_SERVER=zk1:2181,zk2:2181,zk3:2181 qnib/zkui

nvidia-docker run -it -p 8008:8000 -v /home/longchao/code/faiss/docs:/Documents --name faiss daangn/faiss-image-server

nvidia-docker run -it -p 8009:8000 -v /home/longchao/code/faiss/docs:/Documents --name faiss karthikv2k/faiss_docker

docker run -d --name picturecloud -p 8380:8080 --network hdpOverlay 10.4.65.226/deeplearning/picturecloud:1.0.0


nvidia-docker run -p 3399:3389 -p 5913:5901 -p 1029:22 -it 10.4.65.226/gpu/colmap:1.0.2 /bin/bash

nvidia-docker run -it   -p 1022:22 -p 4008:4000 -p 5919:5901  10.4.65.226/library/ubuntu-nxserver:1.0.1 /bin/bash

nvidia-docker run -p 1022:22 -p 4008:4000  -it 10.4.65.226/library/ubuntu-nxserver:1.0.0 /bin/bash

nvidia-docker run -p 3399:3389 -p 5913:5901 -p 1029:22 -it 10.4.65.226/gpu/colmap:1.0.2 /bin/bash

nvidia-docker run -d -p 4016:4000 -p 1012:22 --name cuda8 -e PASSWORD=password -e USER=user --cap-add=SYS_PTRACE 10.4.65.226/library/ubuntu-nomachine-cuda:8.0

nvidia-docker run -d -p 4020:4000 -p 1014:22 --name colmap-cuda8 -e PASSWORD=password -e USER=root --cap-add=SYS_PTRACE  10.4.65.226/gpu/colmap:1.0.3

  docker run -itd --env="VNC_RESOLUTION=1920x1080" --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --name hoyai_dev -p 5672:5672 -p 2266:2266 -p 5432:5432 -p 8000:8000 -p 6006:6006 -p 8888:8888 -p 5901:5901 hoyai/hoyai_dev_docker:squashed3

  docker run `curl -s http://localhost:3476/docker/cli` -d -p 4020:4000 -p 1014:22 -p 5916:5901 --name colmap-cuda8 -e PASSWORD=password -e USER=root --cap-add=SYS_PTRACE  10.4.65.226/gpu/colmap:1.0.3


  docker run `curl -s http://localhost:3476/docker/cli` -p 5900:5900 -p 6080:6080  -it 10.4.65.226/library/vnc-nvidia:1.0.0 /bin/bash

    docker run --privileged -e "DISPLAY=unix:0.0" -v="/tmp/.X11-unix:/tmp/.X11-unix:rw" `curl -s http://localhost:3476/docker/cli` -p 5900:5900 -p 6080:6080  -it 10.4.65.226/gpu/colmap:1.0.4 /bin/bash

x11docker run ---desktop `curl -s http://localhost:3476/docker/cli` -p 5900:5900 -p 6080:6080  -it 10.4.65.226/gpu/colmap:1.0.4 /bin/bash

nvidia-docker run -d -p 4020:4000 -p 1014:22 -p 5916:5901 --env="DISPLAY"  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"  --volume="/usr/lib/x86_64-linux-gnu/libXv.so.1:/usr/lib/x86_64-linux-gnu/libXv.so.1" --name colmap-cuda8 -e PASSWORD=password -e USER=root --cap-add=SYS_PTRACE  10.4.65.226/gpu/colmap:1.0.3

nvidia-docker run -d -p 4023:4000 -p 1032:22 --env="DISPLAY"  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"  --volume="/usr/lib/x86_64-linux-gnu/libXv.so.1:/usr/lib/x86_64-linux-gnu/libXv.so.1"  --name cuda81 -e PASSWORD=password -e USER=user --cap-add=SYS_PTRACE 10.4.65.226/library/ubuntu-nomachine-cuda:8.1


 ruby /redis/src/redis-trib.rb fix 172.3.0.200:7000 172.3.0.200:7001 172.3.0.200:7002 172.3.0.201:7003 172.3.0.201:7004 172.3.0.201:7005

docker run -d -p 4000:4000  -v /home/admin/demo/hdp-docker/centos/merge/pipeline/algComp:/usr/local/algComp -v /home/admin/demo/hdp-docker/centos/merge/pipeline/workspace:/usr/local/workspace --name cup101 registry.cn-hangzhou.aliyuncs.com/lenovo-arcloud/cup:1.0.1