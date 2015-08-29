FROM centos:centos6
MAINTAINER "nmquyet" <minhquyet@gmail.com>

# Install nginx & php 
RUN yum -y update && yum -y install epel-release \ 
    supervisor \
    nginx \
    php-fpm \
    php-mysql \ 
    php-gd \
    php-imap \
    php-ldap \
    php-pear \
    php-xml \
    php-xmlrpc \
    php-intl \
    php-mbstring \
    php-curl \
    php-mcrypt \
    php-mssql \
    php-snmp \
    php-soap \
    php-redis \
    php-pecl-memcache

# Supervisor Config
ADD ./etc/supervisord.conf /etc/supervisord.conf

# Start Supervisord
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

# nginx php config
#RUN rm -Rf /etc/nginx/conf.d/*
#RUN rm -Rf /etc/php-fpm.d/www.conf
#RUN rm -Rf /etc/nginx/nginx.conf
#RUN mkdir /etc/nginx/sites-available
#RUN mkdir /etc/nginx/sites-enabled
#ADD ./etc/nginx/sites-available/default.conf /etc/nginx/sites-available/default.conf
#ADD ./etc/nginx/nginx.conf /etc/nginx/nginx.conf
#ADD ./etc/php-fpm.d/www.conf /etc/php-fpm.d/www.conf
#RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

# Add test scripts
#RUN mkdir -p /home/sites/default/public_html
#ADD ./info.php /home/sites/default/public_html/index.php
#RUN chown -Rf nginx:nginx /home/sites

#EXPOSE 80

#CMD ["/bin/bash", "/start.sh"]
