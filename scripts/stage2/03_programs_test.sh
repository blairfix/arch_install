
# install programs
echo installing core programs


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
pacman -S $(< sf_list)



