#!/bin/sh

dd if=/dev/zero of=/swap bs=1024 count=1024000
mkswap -c /swap 1024000
chmod 0600 /swap
swapon /swap
