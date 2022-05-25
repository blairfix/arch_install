#!/bin/bash

# enable ssh
sudo systemctl start sshd
sudo systemctl enable sshd

# github key
ssh-keygen -t ed25519 -C "blairfix@gmail.com"
cat ~/.ssh/id_ed25519.pub |  xclip -selection clipboard

echo 'Paste key'
echo 'Either as blair_laptop'
echo 'or as blair_server'

firefox https://github.com/settings/keys
