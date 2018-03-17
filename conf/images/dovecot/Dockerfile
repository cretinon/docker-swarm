###
### DOVECOT
###
FROM debian:stable

###
### ENV
###

###
### Install
###
RUN apt-get update &&\
        apt-get -y -q install dovecot-mysql dovecot-pop3d dovecot-imapd dovecot-managesieved && \
        apt-get clean && \
        rm -rf /var/cache/apt/* /var/lib/apt/lists/*

###
### Bootstrap Scipts
###
COPY ./scripts/docker-entrypoint.sh /

###
### Ports
###
EXPOSE 143
EXPOSE 993 
EXPOSE 110
EXPOSE 995
EXPOSE 4190

####
#### Entrypoint
####
ENTRYPOINT ["/docker-entrypoint.sh"]
