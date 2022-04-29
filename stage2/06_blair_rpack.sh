#!/bin/bash

echo "installing blair's R packages"

# hmod
cd ~
git clone https://github.com/blairfix/hmod.git
cd ./hmod
./install.sh

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

# bfread
cd ~
git clone https://github.com/blairfix/bfread.git
cd ./bfread
./install.sh

# bfstr
cd ~
git clone https://github.com/blairfix/bfstr.git
cd ./bfstr
./install.sh

# bfstat
cd ~
git clone https://github.com/blairfix/bfstat.git
cd ./bfstat
./install.sh


# cleanup
echo cleaning up 
cd ~
sudo rm -r hmod hubbert bfgg bfread bfstr bfstat
