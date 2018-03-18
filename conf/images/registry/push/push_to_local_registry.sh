#!/bin/sh

docker tag cretinon/registry localhost:5001/registry
docker push localhost:5001/registry
