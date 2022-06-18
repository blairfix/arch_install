#!/usr/bin/bash


# config lvm
#---------------------------------------------
echo configuring lvm

# add lvm2 to mkinitcpio.conf
# got to hooks, add 'lvm2' between block and filesystems

# backup config file
cp /etc/mkinitcpio.conf /etc/mkinitcpio.conf.bak


# search and replace in config file
find_string='modconf block filesystems'
replace_string='modconf block lvm2 filesystems'
sed -i "s|$find_string|$replace_string|g" /etc/mkinitcpio.conf


# install config
mkinitcpio -p linux
mkinitcpio -p linux-lts



