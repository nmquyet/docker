FROM nmquyet/supervisord:centos6
MAINTAINER "nmquyet" <minhquyet@gmail.com>

ADD ./etc/yum.repos.d/nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum -y update; yum clean all
RUN yum -y install nginx; yum clean all

RUN echo "[program:nginx]" >> /etc/supervisord.conf
RUN echo "command=/usr/sbin/nginx" >> /etc/supervisord.conf

#ADD ./etc/supervisor/conf.d/nginx.conf /etc/supervisor/conf.d/nginx.conf

EXPOSE 80

CMD supervisord -c /etc/supervisord.conf
