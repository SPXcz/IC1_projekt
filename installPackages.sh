#!/bin/bash

# Tento skript je urceny pre instalovanie potrebnych
# balickov.
#
# Instalovane balicky:
#	> gcc 
#	> make
# > curl
# > docker + docker-compose

# packages
sudo apt-get --assume-yes install gcc
sudo apt-get --assume-yes install make
sudo apt-get --assume-yes install curl

# install openssh
sudo apt-get --assume-yes install openssh-server

# install DOCKER
sudo apt --assume-yes install docker.io
sudo systemctl start docker
sudo systemctl enable docker

# install DOCKER-COMPOSE
sudo curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


echo "Verzia docker: `docker --version`"
echo "Verzia docker-compose: `docker–compose –-version`"
