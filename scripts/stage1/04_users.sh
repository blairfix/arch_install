#!/bin/bash

echo installing users

# set root password
echo enter password for root
passwd

# add user
echo enter name of non-root user
read usr
useradd -m -g users -G wheel $usr
passwd $usr

# edit sudo priviledges
echo 'running visudo ... kindly uncomment  %wheel ALL=(ALL) ALL'
echo to give the new user sudo access
echo press a key to continue
read k

visudo

# uncomment
# %wheel ALL=(ALL) ALL

