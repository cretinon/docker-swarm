#!/bin/sh

mkdir -p /docker/share/portainer/data

docker stack deploy  -c ../swarm/portaine.yml portainer
