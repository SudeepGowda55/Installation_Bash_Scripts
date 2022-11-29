#!/bin/bash

read -p "Please Enter the subnet you want to scan Ex:- 192.168.1 : " SUBNET

for IP in $( seq 1 254 );
do 
    echo $( ping -c 1 $SUBNET.$IP )
done
    