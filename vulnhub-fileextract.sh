#!/bin/bash

sudo apt-get update

sudo apt-get install p7zip-full -y

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

sudo ./aws/install

aws --version

sudo apt-get update

aws s3 ls s3://vulnhub-ami

read -p "Enter the file URL : " FILEURL

wget $FILEURL -O vulnhub.ova

7z x vulnhub.ova

ls

read -p "Enter the Current OVA filename : " OVAFILENAME

read -p "Enter the filename you want it to get saved : " FILENAME   

mv $OVAFILENAME $FILENAME.ova

aws s3 cp $FILENAME.ova s3://vulnhub-ami

echo "Done!"