#/bin/bash

# disable pc speaker
sudo echo "blacklist pcspkr" | sudo tee /etc/modprobe.d/nobeep.conf


# internet for laptop

#--------------------------------------
echo 'Is this a laptop? (y/n)'
read laptop


if [ $laptop = 'y' ]
then

    # connect to internet
    echo "Enter wifi password for postcarbon"
    read pw

    # connect to wifi
    wpa_passphrase postcarbon_5g "$pw" | sudo tee -a /etc/wpa_supplicant.conf
    sudo wpa_supplicant -B -c /etc/wpa_supplicant.conf -i wlp3s0
    sudo dhcpcd wlp3s0

fi

ping -c 5 google.com


echo 'Do you have an internet connection? (y/n)'
read cont


if [ $cont = 'n' ]
then
    echo ending script
    exit 1
fi



# continue install

cd ./stage2

# make directories for user
./01_mkdirs.sh 


# install pacman programs
#--------------------------------------
sudo ./02_pacman.sh


# check if any installs failed
echo 'Look for errors ... do you want to continue? (y/n)'
read cont

if [ $cont = 'n' ]
then
    echo ending script
    exit 1
fi



# install programs from Arch User Repository
#--------------------------------------
./03_aur.sh  


# check if any installs failed
echo 'Look for errors ... do you want to continue? (y/n)'
read cont

if [ $cont = 'n' ]
then
    echo ending script
    exit 1
fi


# install config files
./04_dots.sh 

# install r packages
Rscript 05_r_packages.R 

# install blair's r packages
./06_blair_rpack.sh 

# install python libraries
./07_python.sh 

# get ipvanish servers
./08_ipvanish.sh 

# set time
sudo ./09_timezone.sh


