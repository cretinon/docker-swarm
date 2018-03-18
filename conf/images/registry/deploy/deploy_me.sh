#!/bin/sh

mkdir -p /docker/share/registry/

docker stack deploy  -c ../swarm/registry.yml registry
