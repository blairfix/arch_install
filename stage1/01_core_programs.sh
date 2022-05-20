#!/bin/bash

echo installing core packages

# make pacman list
cd software_list
./get_packages.sh core_soft

# pipe list to pacman
pacman --verbose -S $(< sf_list)


# enable network manager
systemctl enable NetworkManager


