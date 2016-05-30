FROM nmquyet/supervisord:centos6
MAINTAINER nmquyet <minhquyet@gmail.com>

RUN curl -s https://packagecloud.io/install/repositories/grafana/stable/script.rpm.sh | bash
RUN yum -y install grafana-2.1.3-1.x86_64
ADD etc/supervisor/conf.d/grafana.conf /etc/supervisor/conf.d/grafana.conf

EXPOSE 3000

CMD ["echo started"]
