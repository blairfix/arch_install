
# install programs

echo Installing programs from Ach User Repository

# install yay
#--------------------------------------------------
cd /opt
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R blair:users ./yay

cd yay
makepkg -si

# install software list
#--------------------------------------------------

# make pacman list
cd software_lists
./get_packages.sh aur

# pipe list to pacman
yay -S $(< sf_list)




