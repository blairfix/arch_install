#!/bin/bash


# config lvm
#---------------------------------------------

# add lvm2 to mkinitcpio.conf
# got to hooks, add 'lvm2' between block and filesystems

# backup config file
cp /etc/mkinitcpio.conf mkinitcpio.conf.bak


# search and replace in config file
find_string="HOOKS=(base udev autodetect modconf block filesystems keyboard fsch)"
replace_string="HOOKS=(base udev autodetect modconf block lvm2 filesystems keyboard fsch)"

sed -i "s/$find_string/$replace_string/g" /etc/mkinitcpio.conf


# install config
mkinitcpio -p linux
mkinitcpio -p linux-lts



