#!/bin/bash 

echo install dot files

# download dot file repository from github
git clone git@github.com:blairfix/blair_dots.git

# run install script 
cd ./blair_dots
./install_dots.sh

# trash install file
cd ..
rm -r blair_dots
