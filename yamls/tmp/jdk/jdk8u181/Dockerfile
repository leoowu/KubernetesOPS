FROM centos:7

RUN yum install deltarpm -y \
    && yum -y -q update \
    && yum install unzip zip wget vim libxslt.i686 libstdc++.i686 epel-release initscripts sudo -y \
    && yum -y -q update \
    && yum install net-tools htop  -y \
# JAVA
    && wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz \
    && tar -zxvf jdk-8u181-linux-x64.tar.gz \
    && rm -Rf jdk-8u181-linux-x64.tar.gz \
    && mv jdk1.8.0_181 /usr/local/jdk \
    && update-alternatives --install "/usr/bin/java" "java" "/usr/local/jdk/bin/java" 1 \
    && yum clean all \
    && rm -rf /var/cache/yum 


ENTRYPOINT ["/bin/bash"]
