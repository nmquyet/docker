FROM nmquyet/supervisord:centos6
MAINTAINER "nmquyet" <minhquyet@gmail.com>

ADD ./etc/yum.repos.d/nginx.repo /etc/yum.repos.d/nginx.repo
RUN yum -y update

RUN yum -y install nginx
ADD etc/nginx/nginx.conf /etc/nginx/nginx.conf
ADD etc/supervisor/conf.d/nginx.conf /etc/supervisor/conf.d/nginx.conf
RUN mkdir /etc/nginx/sites-enabled
RUN mkdir /etc/nginx/sites-available
RUN ln -s /etc/nginx/conf.d/default.conf /etc/nginx/sites-enabled/default.conf

RUN yum clean all
RUN rm -rf /var/tmp/* tmp/* ~/.cache/pip/*

EXPOSE 80

CMD ["/bin/echo 'nginx started'"]
