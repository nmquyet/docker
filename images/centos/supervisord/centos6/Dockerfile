FROM centos:centos6
MAINTAINER "nmquyet" <minhquyet@gmail.com>

# Install yum dependencies
RUN yum -y update && \
    yum groupinstall -y development && \
    yum install -y \
    bzip2-devel \
    git \
    hostname \
    openssl \
    openssl-devel \
    sqlite-devel \
    sudo \
    tar \
    wget \
    zlib-dev

# Install python2.7
RUN cd /tmp && \
    wget https://www.python.org/ftp/python/2.7.8/Python-2.7.8.tgz && \
    tar xvfz Python-2.7.8.tgz && \
    cd Python-2.7.8 && \
    ./configure --prefix=/usr/local && \
    make && \
    make altinstall

# Install setuptools + pip
RUN cd /tmp && \
    wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-1.4.2.tar.gz && \
    tar -xvf setuptools-1.4.2.tar.gz && \
    cd setuptools-1.4.2 && \
    python2.7 setup.py install && \
    curl https://bootstrap.pypa.io/get-pip.py | python2.7 - && \
    pip install virtualenv


RUN mkdir /pythonenv
RUN virtualenv /pythonenv/supervisord
RUN . /pythonenv/supervisord/bin/activate && easy_install supervisor

# Supervisor Config
ADD ./etc/supervisord.conf /etc/supervisord.conf
ADD init.sh /init.sh
RUN chmod +x /init.sh

RUN yum clean all;
RUN rm -rf /tmp/* /var/tmp/* ~/.cache/pip/*

ENTRYPOINT ["/init.sh"]

CMD ["/bin/echo started"]
