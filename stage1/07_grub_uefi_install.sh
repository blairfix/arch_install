#!/usr/bin/bash

# install boot loader
#---------------------------------------------

echo installing boot loader

# grub and dependencies
pacman -S grub efibootmgr dosfstools os-prober mtools


# efi boot loader
mkdir /boot/EFI
mount /dev/sda1 /boot/EFI

grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck 


# grub directory
mkdir /boot/grub/locale

# copy locale file to grub directory
cp /usr/share/locale/en_US/LC_MESSAGES/mit-krb5.mo /boot/grub/locale/en.mo

# generate grub config file
grub-mkconfig -o /boot/grub/grub.cfg

