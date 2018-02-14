#!/usr/bin/env bash

# Installing needed packages

apt update
apt install -y build-essential cmake openssl libssl-dev wget

# Preparing Hybrid installation

mkdir /opt/hybrid

cd ~ && wget http://prdownloads.sourceforge.net/ircd-hybrid/ircd-hybrid-8.2.8.tgz

tar -xzf ircd-hybrid-8.2.8.tgz && rm ircd-hybrid-8.2.8.tgz

cd ircd-hybrid-8.2.8

./configure --prefix=/opt/hybrid
make && make install

# Preparing Anope Services installation

cd ~ && wget https://github.com/anope/anope/releases/download/2.0.2/anope-2.0.2-source.tar.gz

tar -xzf anope-2.0.2-source.tar.gz && rm anope-2.0.2-source.tar.gz

cp /tmp/anope-config.cache anope-2.0.2-source/config.cache

cd anope-2.0.2-source

./Config -quick && cd build
make && make install