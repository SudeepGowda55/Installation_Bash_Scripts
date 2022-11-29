#!/bin/bash

read -p "Enter the length of the password you want: " PASSWD_LENGTH

for PASSWORD in $( seq 1 20 );
do 
    openssl rand -base64 $PASSWD_LENGTH
done 
