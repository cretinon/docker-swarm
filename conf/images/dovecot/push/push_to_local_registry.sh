#!/bin/sh

docker tag cretinon/dovecot localhost:5001/dovecot
docker push localhost:5001/dovecot
