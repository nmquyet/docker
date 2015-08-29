FROM centos:centos6
MAINTAINER "nmquyet" <minhquyet@gmail.com>

RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install supervisor; yum clean all

# Supervisor Config
ADD ./etc/supervisord.conf /etc/supervisord.conf

CMD ["/bin/bash"]
