#!/bin/bash

sudo apt-get update

wget https://bitcoin.org/bin/bitcoin-core-22.0/bitcoin-22.0-x86_64-linux-gnu.tar.gz

tar -xzf bitcoin-22.0-x86_64-linux-gnu.tar.gz

sudo install -m 0755 -o root -g root -t /usr/local/bin bitcoin-22.0/bin/*

sudo apt-get update

rm -r bitcoin-22.0-x86_64-linux-gnu.tar.gz

#  to run and interact with testnet 

# bitcoind -testnet -daemon

# to run and interact with mainnet

bitcoind -daemon