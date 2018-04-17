#!/bin/bash

# Paths used for vault
export GOPATH=/go
export VAULT_PATH=$GOPATH/src/github.com/hashicorp/vault

# Install required componenents for building
apk --update add git bash make

# Clone vault
mkdir -p $VAULT_PATH
git clone https://github.com/hashicorp/vault $VAULT_PATH
cd $VAULT_PATH

# Compile vault
make bootstrap && make dev

# Install vault to /usr/loca/bin
cp $GOPATH/bin/vault /usr/local/bin/vault
vault version

# Remove uneeded packages
apk del git make

#  Clean directories
cd /root
rm -rf /usr/share/man /tmp/* /var/cache/apk/*
