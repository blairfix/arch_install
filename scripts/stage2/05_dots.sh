#!/bin/bash 

# download dot file repository from github
cd ~/Downloads
git clone git@github.com:blairfix/blair_dots.git

# run install script 
cd ./blair_dots
./install_dots.sh

# trash install file
cd ..
trash blair_dots
