# docker-swarm
# master
master : cd ; apt-get update && apt-get -y install git ; git clone https://github.com/cretinon/docker-swarm.git ; cd docker-swarm/ ; chmod +x ./setup_master.sh ; ./setup_master.sh IP_MASTER IP_CLIENT
# client
salve  : cd ; apt-get update && apt-get -y install git ; git clone https://github.com/cretinon/docker-swarm.git ; cd docker-swarm/ ; chmod +x ./setup_client.sh ; ./setup_client.sh IP_MASTER 
