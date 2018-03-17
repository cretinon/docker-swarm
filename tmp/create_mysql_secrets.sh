#!/bin/bash

set -e

# Create 1024 bit secrets. Remove newlines that openssl includes.
PASSWORD=${ADMIN_PASSWORD-$(openssl rand -hex 128 | tr -d "\n")}
echo $PASSWORD | docker secret create pa_mysql_mysql_pwd - > /dev/null

# Use config to share configuration files
# Accessed at /etc/mysql-cluster.cnf
cat mysql-cluster.cnf | docker config create pa_mysql_cluster_cnf - > /dev/null
# Accessed at /etc/my.cnf
cat my.cnf | docker config create pa_mysql_cnf - > /dev/null

echo "Secrets and configuration created"
docker secret ls --filter NAME=pa_mysql
docker config ls --filter NAME=pa_mysql