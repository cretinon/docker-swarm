#!/bin/sh

mkdir -p /docker/share/bind/

docker stack deploy  -c ../swarm/bind9.yml bind
