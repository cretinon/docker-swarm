# docker-swarm
master : cd ; apt-get update && apt-get -y install git ; git clone https://github.com/cretinon/docker-swarm.git ; cd docker-swarm/ ; chmod +x ./setup_master.sh ; ./setup_master.sh
salve  : cd ; apt-get update && apt-get -y install git ; git clone https://github.com/cretinon/docker-swarm.git ; cd docker-swarm/ ; chmod +x ./setup_master.sh ; ./setup_slave.sh 
