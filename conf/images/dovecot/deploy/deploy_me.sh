#!/bin/sh

mkdir -p /docker/share/dovecot/

docker stack deploy  -c ../swarm/dovecot.yml dovecot
