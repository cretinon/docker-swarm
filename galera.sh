#!/bin/sh

docker stack deploy -c galera.yml galera
docker service ls | grep galera_seed | awk '{print $4}' | grep "1/1"
while [ $? -eq 1 ]; do sleep 10 ; docker service ls | grep galera_seed | awk '{print $4}' | grep "1/1" ; done
docker service scale galera_node=2 
docker service scale galera_seed=0
docker service scale galera_node=3
