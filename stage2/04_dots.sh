#!/usr/bin/bash 

echo install dot files
cd ~

# download dot file repository from github
git clone https://github.com/blairfix/blair_dots.git

# run install script 
cd ./blair_dots
./install_dots.sh

# trash install file
cd ..
sudo rm -r blair_dots
