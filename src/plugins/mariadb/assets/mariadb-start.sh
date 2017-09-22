#!/bin/bash

MARIADB_VERSION=<%= mariadbVersion %>

set -e

sudo mkdir -p <%= mariaDbDir %>
sudo docker pull mariadb:$MARIADB_VERSION

set +e

sudo docker update --restart=no mariadb
sudo docker exec mariadb mariadb quit
sleep 2
sudo docker rm -f mariadb

set -e

echo "Running mariadb:<%= mariadbVersion %>"

sudo docker run \
  -d \
  --restart=always \
  --publish=127.0.0.1:3306:3306 \
  --volume=<%= mariaDbDir %>:/data/db \
  --volume=/etc/mysql/conf.d:/mariadb.conf \
  --name=mariadb \
  mariadb:$MARIADB_VERSION mariadb
