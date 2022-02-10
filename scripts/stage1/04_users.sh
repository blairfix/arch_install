#!/bin/bash

echo installing users

# set root password
passwd

# add user
useradd -m -g users -G wheel blair 
passwd blair

# edit sudo priviledges
echo 'running visudo ... kindly uncomment  %wheel ALL=(ALL) ALL'
echo to give the new user sudo access
echo press a key to continue
read k

visudo

# uncomment
# %wheel ALL=(ALL) ALL

