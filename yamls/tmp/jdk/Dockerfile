# AlpineLinux with a glibc-2.21 and Oracle Java 8
#FROM alpine:latest
FROM centos:7
MAINTAINER leowu

# Install cURL
#RUN apk --update add curl ca-certificates tar && \
#    curl -Ls https://raw.githubusercontent.com/trivago/rumi/master/docker/bin/glibc-2.21-r2.apk > /tmp/glibc-2.21-r2.apk && \
#    apk add --allow-untrusted /tmp/glibc-2.21-r2.apk
#
# Java Version
ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 191
ENV JAVA_VERSION_BUILD 12
ENV JAVA_PACKAGE       jdk

# Download and unarchive Java
RUN  curl -L http://192.168.190.230/jdk-8u191-linux-x64.tar.gz  \
    | tar -xzf - -C /opt &&\
    ln -s /opt/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} /opt/jdk &&\
    rm -rf /opt/jdk/*src.zip \
           /opt/jdk/lib/missioncontrol \
           /opt/jdk/lib/visualvm \
           /opt/jdk/lib/*javafx* \
           /opt/jdk/jre/lib/plugin.jar \
           /opt/jdk/jre/lib/ext/jfxrt.jar \
           /opt/jdk/jre/bin/javaws \
           /opt/jdk/jre/lib/javaws.jar \
           /opt/jdk/jre/lib/desktop \
           /opt/jdk/jre/plugin \
           /opt/jdk/jre/lib/deploy* \
           /opt/jdk/jre/lib/*javafx* \
           /opt/jdk/jre/lib/*jfx* \
           /opt/jdk/jre/lib/amd64/libdecora_sse.so \
           /opt/jdk/jre/lib/amd64/libprism_*.so \
           /opt/jdk/jre/lib/amd64/libfxplugins.so \
           /opt/jdk/jre/lib/amd64/libglass.so \
           /opt/jdk/jre/lib/amd64/libgstreamer-lite.so \
           /opt/jdk/jre/lib/amd64/libjavafx*.so \
           /opt/jdk/jre/lib/amd64/libjfx*.so

# Set environment
ENV JAVA_HOME /opt/jdk
ENV PATH ${PATH}:${JAVA_HOME}/bin
