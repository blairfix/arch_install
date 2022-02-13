#!/bin/bash

echo installing core packages

# pipe software list to pacman
pacman -S $(< core_soft)


# enable network manager
systemctl enable NetworkManager


