FROM centos

LABEL MAINTAINER="xxx" \
SUMMARY="CentOS 8 with git, python3.9, gcc8."

ADD ./gn /usr/bin
ADD ./ninja /usr/bin
ADD ./fd /usr/bin
RUN sed -i -e "s|mirrorlist=|#mirrorlist=|g" /etc/yum.repos.d/CentOS-* && sed -i -e "s|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g" /etc/yum.repos.d/CentOS-* && yum -y update && yum -y install git python3.9 patch && dnf -y install gcc-c++ gcc

ENV PATH="${PATH}:/webrtc-android/depot_tools"
WORKDIR /webrtc-android/src
