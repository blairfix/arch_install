#!/usr/bin/bash

cd ~/ipvanish

# clean old files
rm *.ovpn

# download config files
wget https://www.ipvanish.com/software/configs/configs.zip
unzip configs.zip

# fix keysize error
for f in *.ovpn
do
    sed -i '/keysize/d' "$f" 
done

