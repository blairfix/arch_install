#!/bin/bash

echo installing core packages

# make pacman list
cd software_lists
./get_packages.sh core_soft

# pipe list to pacman
pacman -S $(< sf_list)


# enable network manager
systemctl enable NetworkManager


