#!/usr/bin/bash

echo installing core packages


# install reflector and update mirrors
pacman -S reflector rsync curl
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector --country 'Canada,United States' --latest 40 --protocol https --sort rate --save /etc/pacman.d/mirrorlist


# make pacman list
cd software_list
./get_packages.sh core_soft

# pipe list to pacman
pacman --verbose -S $(< sf_list)


# enable network manager
systemctl enable NetworkManager


