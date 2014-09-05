FROM ubuntu:trusty
MAINTAINER FENG, HONGLIN <hfeng@tutum.co>

#install memcached
RUN apt-get update && \
    apt-get install -y libevent-dev libsasl2-2 sasl2-bin libsasl2-2 libsasl2-dev libsasl2-modules && \
    apt-get install -y memcached pwgen && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


ADD create_memcached_admin_user.sh /create_memcached_admin_user.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE 11211

CMD ["/run.sh"]
