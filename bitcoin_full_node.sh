#!/bin/bash

sudo apt-get update

sudo apt install git build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev libminiupnpc-dev libzmq3-dev

wget https://bitcoin.org/bin/bitcoin-core-22.0/bitcoin-22.0-x86_64-linux-gnu.tar.gz

tar -xzf bitcoin-22.0-x86_64-linux-gnu.tar.gz

sudo install -m 0755 -o root -g root -t /usr/local/bin bitcoin-22.0/bin/*

sudo apt-get update

rm -r bitcoin-22.0-x86_64-linux-gnu.tar.gz

bitcoind -testnet -daemon