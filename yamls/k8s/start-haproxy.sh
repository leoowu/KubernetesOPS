#!/bin/bash
MasterIP1=192.168.9.102
MasterIP2=192.168.9.103
MasterIP3=192.168.9.105
MasterPort=6443

docker run -d --restart=always --name HAProxy-K8S -p 6444:6444 -e MasterIP1=$MasterIP1 -e MasterIP2=$MasterIP2 -e MasterIP3=$MasterIP3 -e MasterPort=$MasterPort harbor.ucex.corp/wise2ck8s/haproxy-k8s
