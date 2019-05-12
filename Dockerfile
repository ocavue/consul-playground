FROM ubuntu:16.04

RUN echo '' > /etc/apt/sources.list && \
    echo 'deb http://mirrors.163.com/ubuntu/ xenial main restricted universe multiverse               ' >> /etc/apt/sources.list && \
    echo 'deb http://mirrors.163.com/ubuntu/ xenial-security main restricted universe multiverse      ' >> /etc/apt/sources.list && \
    echo 'deb http://mirrors.163.com/ubuntu/ xenial-updates main restricted universe multiverse       ' >> /etc/apt/sources.list && \
    echo 'deb http://mirrors.163.com/ubuntu/ xenial-proposed main restricted universe multiverse      ' >> /etc/apt/sources.list && \
    echo 'deb http://mirrors.163.com/ubuntu/ xenial-backports main restricted universe multiverse     ' >> /etc/apt/sources.list && \
    echo 'deb-src http://mirrors.163.com/ubuntu/ xenial main restricted universe multiverse           ' >> /etc/apt/sources.list && \
    echo 'deb-src http://mirrors.163.com/ubuntu/ xenial-security main restricted universe multiverse  ' >> /etc/apt/sources.list && \
    echo 'deb-src http://mirrors.163.com/ubuntu/ xenial-updates main restricted universe multiverse   ' >> /etc/apt/sources.list && \
    echo 'deb-src http://mirrors.163.com/ubuntu/ xenial-proposed main restricted universe multiverse  ' >> /etc/apt/sources.list && \
    echo 'deb-src http://mirrors.163.com/ubuntu/ xenial-backports main restricted universe multiverse ' >> /etc/apt/sources.list && \
    cat /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y openssh-server vim curl lsof
RUN apt-get install -y dnsutils
ADD ./setup.sh /data/consul-playground/setup.sh
RUN bash /data/consul-playground/setup.sh

CMD ["bash", "/data/consul-playground/startup.sh"]