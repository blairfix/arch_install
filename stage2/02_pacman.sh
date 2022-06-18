#!/usr/bin/bash

# install programs
echo installing pacman programs

# sync pacman mirrors
pacman -Syy

# microcode
#--------------------------------------------------
echo "Which version of microcode do you want? (amd, intel)"
read micro

if [ $micro == "amd" ] 
then
    # amd microcode
    pacman -S amd-ucode	    
else
    # intel microcode
    pacman -S intel-ucode	   
fi

# install software list
#--------------------------------------------------

# make pacman list
cd software_lists
./get_packages.sh pacman

# pipe list to pacman
pacman --verbose -S $(< sf_list)

# make light executable
sudo chmod +s /usr/bin/light


