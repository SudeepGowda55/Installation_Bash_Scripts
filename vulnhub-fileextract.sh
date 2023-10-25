#!/bin/bash

sudo apt-get update

sudo apt-get install p7zip-full -y

sudo apt install unzip -y

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

sudo ./aws/install

aws --version

sudo apt-get update

sleep 2

aws s3 ls s3://vulnhub-ami

read -p "Enter the Vulnhub Zip file URL : " FILEURL

wget $FILEURL -O vulnhub.ova

ls

sleep 2

7z x vulnhub.ova

ls

sleep 2

read -p "Enter the Current Existing Vulnhub OVA filename after extracted : " OVAFILENAME

read -p "Enter the filename you want it to get saved : " FILENAME   

mv $OVAFILENAME $FILENAME.ova

echo "Coping File to S3 Bucket"

sleep 2

aws s3 cp $FILENAME.ova s3://vulnhub-ami

echo "Done!"
