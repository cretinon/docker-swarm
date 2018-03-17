###
### BIND
###
FROM debian:stable

###
### ENV
###
ENV BIND9_IP ''
ENV BIND9_ROOTDOMAIN ''
ENV BIND9_KEYNAME ''
ENV BIND9_KEY ''
ENV BIND9_FORWARDERS '8.8.8.8;8.8.4.4;'
ENV BIND9_IPV4ONLY ''
ENV BIND9_QUERY_CACHE_ACCEPT '127.0.0.1;'
ENV BIND9_RECURSION_ACCEPT '127.0.0.1;'
ENV BIND9_STATIC_ENTRIES ''

###
### Install
###
RUN apt-get update &&\
        apt-get -y -q install bind9 && \
        apt-get clean && \
        rm -rf /var/cache/apt/* /var/lib/apt/lists/*

###
### Bootstrap Scipts
###
COPY ./scripts/docker-entrypoint.sh /
RUN mkdir -p /run/named /etc/bind/zones
RUN chown bind:bind /run/named

###
### Ports
###
EXPOSE 53
EXPOSE 53/udp

####
#### Entrypoint
####
ENTRYPOINT ["/docker-entrypoint.sh"]
