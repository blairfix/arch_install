#!/bin/bash

echo installing users

# set root password
passwd

# add user
useradd -m -g users -G wheel blair 
passwd blair

# edit sudo priviledges
visudo

# uncomment
# %wheel ALL=(ALL) ALL

