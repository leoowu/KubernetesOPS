#From harbor.ucex.corp/library/centos7:latest
From centos:7
MAINTAINER leoowu@foxmail.com

# Download and unarchive Java
RUN yum install -y epel-release centos-release-scl && \
    yum update -y && \
    yum install -y net-tools bind-utils curl wget vim  telnet && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    yum clean all && \
    rm -rf /var/cache/yum
