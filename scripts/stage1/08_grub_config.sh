#!/bin/bash

echo configuring grub to save your choice of kernal 

# backup grub defaults
cp /etc/default/grub /etc/default/grub.bak

# config grub to remember choice of kernal


# changed grub default to saved
#sfind='GRUB_DEFAULT=1'
#sreplace='GRUB_DEFAULT=saved'
#sed -i "s|$sfind|$sreplace|g" /etc/default/grub

# uncomment save default
#sfind='#GRUB_SAVEDEFAULT'
#sreplace='GRUB_SAVEDEFAULT'
#sed -i "s|$sfind|$sreplace|g" /etc/default/grub

# uncomment disable submenu
sfind='#GRUB_DISABLE_SUBMENU'
sreplace='GRUB_DISABLE_SUBMENU'
sed -i "s|$sfind|$sreplace|g" /etc/default/grub


# generate grub config file
grub-mkconfig -o /boot/grub/grub.cfg

