From harbor.ucex.corp/library/centos7:latest
#From centos:7
MAINTAINER leoowu@foxmail.com

# init the OS settings
RUN yum install -y cryptopp cryptopp-devel openssl openssl-devel leveldb leveldb-devel  gmp gmp-devel librdkafka librdkafka-devel mpfr mpfr-devel \
                   protobuf-devel protobuf gperftools-libs gperftools gperftools-devel gperftools-libs  ncurses-devel bzip2-devel readline-devel  \
                   devtoolset-7-gcc-c++ devtoolset-7-gcc devtoolset-7-gdb jansson-devel jansson gcc mariadb-devel mariadb-libs libev libev-devel  \
                   mpdecimal mpdecimal-devel libcurl libcurl-devel && \
    yum clean all && \
    rm -rf /var/cache/yum
