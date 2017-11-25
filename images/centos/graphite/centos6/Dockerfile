FROM nmquyet/nginx:centos6
MAINTAINER "nmquyet" <minhquyet@gmail.com>

RUN yum -y update

# https://github.com/graphite-project/carbon/tree/0.9.15
# https://github.com/graphite-project/graphite-web/releases/tag/0.9.15

RUN yum -y install python-devel git gcc pycairo libffi-devel bitmap-*
RUN cd /usr/local/src && \
    git clone https://github.com/graphite-project/graphite-web.git && \
    git clone https://github.com/graphite-project/carbon.git
RUN virtualenv /pythonenv/graphite
RUN cd /usr/local/src/graphite-web && git checkout 0.9.15
RUN cd /usr/local/src/carbon && git checkout 0.9.15

RUN . /pythonenv/graphite/bin/activate && \
    pip install -r /usr/local/src/graphite-web/requirements.txt && \
    pip install -U django==1.6 django-tagging==0.3.6 txAMQP==0.6.2 flup && \
    cd /usr/local/src/carbon/ && \
    python2.7 setup.py install && \ 
    cd /usr/local/src/graphite-web/ && \
    python2.7 setup.py install

ADD etc/graphite/*.conf /opt/graphite/conf/
ADD etc/graphite/webapp/local_settings.py /opt/graphite/webapp/graphite/local_settings.py

WORKDIR /opt/graphite/

RUN . /pythonenv/graphite/bin/activate && \
    export PYTHONPATH=/opt/graphite/webapp/ && \
    django-admin.py syncdb --settings=graphite.settings --noinput

# Generate graphite-web static files
# cd /opt/graphite && \
#RUN . /pythonenv/graphite/bin/activate && \
#    export PYTHONPATH=/opt/graphite/webapp/ && \
#    django-admin.py collectstatic --noinput --settings=graphite.settings

RUN chown -R nginx:nginx /opt/graphite/storage/ && \
    #chown -R nginx:nginx /opt/graphite/static/ && \
    chown -R nginx:nginx /opt/graphite/webapp/

ADD etc/nginx/sites-available/graphite.conf /etc/nginx/sites-available/graphite.conf
RUN rm -rf /etc/nginx/sites-enabled/* && \
    ln -s /etc/nginx/sites-available/graphite.conf /etc/nginx/sites-enabled/graphite.conf

ADD etc/supervisor/conf.d/graphite.conf /etc/supervisor/conf.d/graphite.conf

RUN yum clean all && rm -rf /tmp/* /var/tmp/* /usr/local/src/graphite-web /usr/local/src/carbon ~/.cache/pip/*

ENV AMQP_HOST rabbitmq
ENV AMQP_PORT 5672
ENV AMQP_VHOST /
ENV AMQP_USER guest
ENV AMQP_PASSWORD guest
ENV AMQP_EXCHANGE graphite

EXPOSE 80 2023

# Add init script
ADD scripts/graphite_conf_init.sh /graphite_conf_init.sh
RUN chmod +x /graphite_conf_init.sh

CMD ["/graphite_conf_init.sh"]
