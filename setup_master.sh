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
gluster volume create docker replica 2 transport tcp vps5.cretinon.fr:/glusterfs/docker vps6.cretinon.fr:/glusterfs/docker force
while [ $? -eq 1 ]; do sleep 10 ; gluster volume create docker replica 2 transport tcp vps5.cretinon.fr:/glusterfs/docker vps6.cretinon.fr:/glusterfs/docker force ; done
gluster volume start docker
echo "localhost:/docker /docker/share glusterfs defaults,_netdev 0 0" >> /etc/fstab
mkdir -p /docker/share
mount /docker/share

# download my env
mkdir -p /docker/share/git_clone
git clone https://github.com/cretinon/docker-swarm.git

# set docker
cp /docker/share/git_clone/docker-swarm/docker.service /lib/systemd/system/docker.service
systemctl daemon-reload
systemctl restart docker

# start swarm
docker swarm init
mkdir -p /docker/share/swarm
echo "#!/bin/sh" > /docker/share/swarm/join_as_manager.sh.tmp
docker swarm join-token manager | grep join >> /docker/share/swarm/join_as_manager.sh.tmp
chmod +x /docker/share/swarm/join_as_manager.sh.tmp
mv /docker/share/swarm/join_as_manager.sh.tmp /docker/share/swarm/join_as_manager.sh

# install portainer
mkdir -p /docker/share/portainer/data
docker stack deploy portainer --compose-file /docker/share/git_clone/docker-swarm/portainer.yml

# install traefik
mkdir -p /docker/share/traefik
touch /docker/share/traefik/acme.json
docker stack deploy traefik --compose-file /docker/share/git_clone/docker-swarm/traefik.yml

# install elk
mkdir -p /docker/share/logstash/config/
mkdir -p /docker/share/logstash/pipeline/
mkdir -p /docker/share/kibana/config/
docker stack deploy elk --compose-file /docker/share/git_clone/docker-swarm/elk.yml
