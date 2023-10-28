#!/bin/bash

sudo apt-get update

sudo apt-get upgrade -y 

sudo apt-get install xfce4 xfce4-goodies tightvncserver -y

sudo apt-get install gnome-core kali-defaults kali-root-login desktop-base -y

tightvncserver -geometry 1024x768

sudo apt install net-tools -y

netstat -tulpn

echo ""

echo ""

echo "Run This command locally to connect to the VNC Server"

echo "cd Desktop"

echo "sudo ssh -L 5901:localhost:5901 -N -f kali@<.ap-south-1.compute.amazonaws.com> -i vulnhub.pem"

echo "Replace this with the current one @<.ap-south-1.compute.amazonaws.com>"