#!/usr/bin/env bash
docker run -itd -p 9443:443 --name arplatform  -v /home/admin/hdp-docker/centos/merge/arplatform/logs:/logs -v /home/admin/hdp-docker/centos/merge/arplatform/storage:/storage  -v /home/admin/hdp-docker/centos/merge/arplatform/hosts:/etc/hosts --network hdpOverlay 10.4.65.226/library/arplatform:1.0.0
