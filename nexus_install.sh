#!/bin/bash

sudo apt update && sudo apt upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y

sudo apt install openjdk-11-jre -y

sudo apt update

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

sudo docker run hello-world

docker pull sonatype/nexus3

docker volume create --name nexus-data

docker run -d -p 8081:8081 --name nexus -v nexus-data:/nexus-data sonatype/nexus3

echo "Wait For 2-3 minutes for complete installation"