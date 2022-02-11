#!/bin/bash

echo "installing blair's R packages"

# hmod
cd ~
git clone https://github.com/blairfix/hmod.git
cd ./hmod
./install

# hubbert
cd ~
git clone https://github.com/blairfix/hubbert.git
cd ./hubbert
./install.sh


# bfgg
cd ~
git clone https://github.com/blairfix/bfgg.git
cd ./bfgg
./install.sh

