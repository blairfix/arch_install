#!/bin/bash

# install boot loader
#---------------------------------------------

echo installing boot loader

# grub and dependencies
pacman -S grub dosfstools os-prober mtools

# install grub
grub-install --target=i386-pc --recheck /dev/sda

# grub directory
mkdir /boot/grub/locale

# copy locale file to grub directory
cp /usr/share/locale/en_US/LC_MESSAGES/mit-krb5.mo /boot/grub/locale/en.mo

# generate grub config file
grub-mkconfig -o /boot/grub/grub.cfg

