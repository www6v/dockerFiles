# dockerFiles
各种系统的docker文件： 包括中间件，大数据系统

1. elasticsearch 运行时问题

max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
 
配置宿主机的vm.max_map_count解决这个问题

2. 10.4.65.226/deeplearning/es-head docker image 是从github里elasticsearch-head 5.0版本的源代码里docker build出来的，源代码里自带Dockerfile。
