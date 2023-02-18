#!/bin/bash

sudo apt update && sudo apt upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y

sudo apt install openjdk-11-jre -y

sudo apt update

sysctl -w vm.max_map_count=524288
sysctl -w fs.file-max=131072
ulimit -n 131072
ulimit -u 8192

sudo echo -e "sysctl -w vm.max_map_count=524288\nsysctl -w fs.file-max=131072\nulimit -n 131072\nulimit -u 8192" >>  /etc/sysctl.conf
sudo sysctl --system

sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -m 0755 -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Docker Installed Successfully"

sudo docker run hello-world

docker volume create --name sonarqube_data
docker volume create --name sonarqube_logs
docker volume create --name sonarqube_extensions
docker volume create --name postgresql
docker volume create --name postgresql_data

echo "Copy the docker-compose.yml code from my github"

sleep 5

nano docker-compose.yml

docker compose up -d