#!/bin/bash

su -


# make swap file
dd if=/dev/zero of=/swapfile bs=1M count=2048 status=progress
chmod 600 /swapfile
mkswap /swapfile

# back up fstab
cp /etc/fstab /etc/fstab.bak

# add swap file to fstab
echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab

