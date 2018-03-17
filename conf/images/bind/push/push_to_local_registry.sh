#!/bin/sh

docker tag cretinon/bind localhost:5001/bind
docker push localhost:5001/bind
