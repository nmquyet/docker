FROM nmquyet/supervisord:centos6
MAINTAINER "nmquyet" <minhquyet@gmail.com>

ADD ./etc/yum.repos.d/nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum -y update; yum clean all

#################################################
# Nginx
#################################################
RUN yum -y install nginx; yum clean all
RUN echo "[program:nginx]" >> /etc/supervisord.conf
RUN echo "command=/usr/sbin/nginx" >> /etc/supervisord.conf

#################################################
# Graphite & Carbon
#################################################
RUN yum -y install httpd mod_wsgi python-pip python-devel git pycairo libffi-devel
RUN cd /usr/local/src && \
    git clone https://github.com/graphite-project/graphite-web.git && \
    git clone https://github.com/graphite-project/carbon.git
#RUN yum -y install gcc 
RUN pip install -r /usr/local/src/graphite-web/requirements.txt
RUN pip install -U django-tagging

RUN cd /usr/local/src/carbon/ && \
    python setup.py install

RUN cd /usr/local/src/graphite-web/ && \
    python setup.py install

#ADD ./etc/supervisor/conf.d/nginx.conf /etc/supervisor/conf.d/nginx.conf

# nginx port
EXPOSE 80

CMD supervisord -c /etc/supervisord.conf
