#!/bin/bash

# install linux kernel
pacman -S linux linux-headers linux-lts linux-lts-headers

# base developer packages
pacman -S base-devel

# networking
pacman -S networkmanager wpa_supplicant wireless_tools netctl

# network manager
pacman -S dialog

# enable network manager
systemctl enable NetworkManager

# add lvm support
pacman -S lvm2

# vim
pacman -S vim

