#!/bin/bash

echo Installing programs from Ach User Repository


# install yay
#--------------------------------------------------
cd /opt
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R blair:users ./yay

cd yay
makepkg -si


# install packages from AUR
#--------------------------------------------------
yay -S proselint	    # writing linter
yay -S ssmtp		    # email
yay -S ttf-ms-fonts	    # microsoft fonts


yay -S armadillo
