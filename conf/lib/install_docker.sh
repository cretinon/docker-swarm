#!/bin/sh

curl -sSL https://get.docker.com | sh 
curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

cp docker.service /lib/systemd/system/docker.service

systemctl daemon-reload
systemctl restart docker
