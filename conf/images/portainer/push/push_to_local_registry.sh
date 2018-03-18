#!/bin/sh

docker tag cretinon/portianer localhost:5001/portainer
docker push localhost:5001/portainer
