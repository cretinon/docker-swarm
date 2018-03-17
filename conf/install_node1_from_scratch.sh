#!/bin/sh

S_HOSTNAME=$(hostname -f)
myip=$(dig +short myip.opendns.com @resolver1.opendns.com)
myhostname=$(dig -x $(dig +short myip.opendns.com @resolver1.opendns.com) | grep PTR | grep -v \; | awk '{print $5}' | cut -d. -f1-3)


if [ a"$myhostname" = a"$S_HOSTNAME" ]; then
  echo ok
  echo a"$myhostname" a"$S_HOSTNAME"
else
  echo "change /etc/hosts and /etc/resolv.conf in order to match $myhostname"
  if [ a"$1" = "a-f" ]; then
    echo "force change"
    echo $myhostname | cut -d. -f1 > /etc/hostname
    DOMAIN=$(echo $myhostname | cut -d. -f2-3)
     
  else
    exit 1
  fi
fi



