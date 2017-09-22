#!/bin/bash
sudo docker update --restart=no mariadb
sudo docker exec mariadb mariadb quit
sleep 2
sudo docker rm -f mariadb
