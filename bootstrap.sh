#!/bin/sh

# Installing pre-requisites

apt-get update
apt-get install -y build-essential cmake openssl libssl-dev wget
apt-get autoclean

# Installing Hybrid (IRC Network Server)

mkdir /opt/hybrid

cd ~ && wget http://prdownloads.sourceforge.net/ircd-hybrid/ircd-hybrid-8.2.8.tgz

tar -xzf ircd-hybrid-8.2.8.tgz && rm ircd-hybrid-8.2.8.tgz

cd ircd-hybrid-8.2.8
./configure --prefix=/opt/hybrid
make && make install
cd .. && rm -rf ircd-hybrid-8.2.8

# Installing Anope Services

#cd ~ && wget https://github.com/anope/anope/releases/download/2.0.2/anope-2.0.2-source.tar.gz
#
#tar -xzf anope-2.0.2-source.tar.gz && rm anope-2.0.2-source.tar.gz
#
#cp /tmp/anope-config.cache anope-2.0.2-source/config.cache
#
#cd anope-2.0.2-source
#./Config -quick && cd build
#make && make install
#cd .. && rm -rf anope-2.0.2-source


# Configuring pre-requisites

adduser irc-admin --system --no-create-home
usermod -a -G sudo irc-admin

chown -R irc-admin /opt/hybrid
#chown -R irc-admin /opt/anope


# Configuring and starting Hybrid

cp /tmp/hybrid-ircd.conf /opt/hybrid/etc/ircd.conf

cd /opt/hybrid/bin
runuser -u irc-admin ./ircd


# Configuring and starting Anope Services

#cp /tmp/anope-services.conf /opt/anope/conf/services.conf
#
#cd /opt/anope/bin
#runuser -u irc-admin ./anoperc start