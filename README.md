# docker-compose  files
以下三类系统的docker-compose文件， 包括： 

中间件系统: ambry，diamond，elasticsearch，monitor（prometheus），rocketmq，azkaban，redis，spark，zookeeper

大数据系统:hadoop，hbase，jstorm

图形系统：colmap，opencv,eigen


安装时的问题

1. elasticsearch 运行时问题

max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
 
配置宿主机的vm.max_map_count解决这个问题

2. 10.4.65.226/deeplearning/es-head docker image 是从github里elasticsearch-head 5.0版本的源代码里docker build出来的，源代码里自带Dockerfile。
源代码里要修改app.js，Gruntfile.js
