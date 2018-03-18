#!/bin/sh

# prerequisite
# dns : add vps5 & vps6

# enable swap
dd if=/dev/zero of=/swap bs=1024 count=1024000
mkswap -c /swap 1024000
chmod 0600 /swap
swapon /swap

# update and install debian
apt-get update ; apt-get -y install curl git lsof lvm2 glusterfs-server; apt-get clean ;

# install docker and docker-compose
curl -sSL https://get.docker.com | sh ;
curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# install and configure gluster
mkdir -p /glusterfs
gluster peer probe $1
echo "localhost:/docker /docker/share glusterfs defaults,_netdev 0 0" >> /etc/fstab
mkdir -p /docker/share
mount /docker/share
while [ $? -eq 1 ]; do sleep 10 ; mount /docker/share ; done

# set docker
cp /docker/share/git_clone/docker-swarm/docker.service /lib/systemd/system/docker.service
systemctl daemon-reload
systemctl restart docker

# start swarm
while [ ! -x /docker/share/swarm/join_as_manager.sh ]; do echo "waiting swarm" ; sleep 10 ; done
/docker/share/swarm/join_as_manager.sh

# elk prereq
#sysctl -w vm.max_map_count=262144

# galera prereq
#mkdir -p /docker/local/mysql/lib/
#mkdir -p /docker/local/mysql/node1/lib
#mkdir -p /docker/local/mysql/node2/lib
#mkdir -p /docker/local/mysql/node3/lib

