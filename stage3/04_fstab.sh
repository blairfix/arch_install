#!/bin/bash

# clone blair dots git
cd ~
git clone https://github.com/blairfix/blair_dots.git

# install fstab
cd ~/blair_dots/fstab/
./fs_append.sh

