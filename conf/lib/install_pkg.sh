#!/bin/sh

PKG_LIST=$(for PKG in $(cat pkg.list); do echo -n "$PKG "; done)

apt-get update
apt-get -y install $PKG_LIST
apt-get -y autoremove
apt-get clean
