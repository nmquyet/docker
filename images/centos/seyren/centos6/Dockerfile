FROM nmquyet/supervisord:centos6
MAINTAINER nmquyet <minhquyet@gmail.com>

RUN yum -y update
RUN yum -y install java-1.7.0-openjdk mongodb mongodb-server

ADD seyren-1.2.1.jar /opt/seyren.jar

ADD etc/supervisor/conf.d/seyren.conf /etc/supervisor/conf.d/seyren.conf

RUN yum clean all && rm -rf /tmp/* /var/tmp/* 

ENV GRAPHITE_URL http://graphite
ENV SEYREN_URL http://dockerhost:8080

# Log
RUN mkdir /var/log/seyren
ENV SEYREN_LOG_PATH /var/log/seyren/
ENV SEYREN_LOG_FILE_LEVEL info
ENV GRAPHS_ENABLE true

# SMTP 
ENV SMTP_HOST smtp.gmail.com
ENV SMTP_PORT 587
ENV SMTP_FROM noreply@seyren
ENV SMTP_USERNAME your_user@gmail.com
ENV SMTP_PASSWORD your_password
ENV SMTP_PROTOCOL smtp

EXPOSE 80

CMD ["echo hello"]
