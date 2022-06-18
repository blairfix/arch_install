#!/usr/bin/bash

# first stage of arch installing, run in root session
#--------------------------------------


# ask user the type of installion
echo What type of boot do you want? BIOS or UEFI?
read boot

# got to stage one scripts
cd ./stage1



# install core programs
#--------------------------------------
./01_core_programs.sh 


# check if any installs failed
echo 'Check for errors. Do you want to continue? (y/n)'
read cont

if [ $cont = 'n' ]
then
    echo ending script
    exit 1
fi


# convigure lvm
#--------------------------------------
if [ $boot == 'BIOS' ]
then
    # install bios version of lvm
    ./02_lvm_bios_config.sh 
else
    # install uefi version of lvm
    ./02_lvm_uefi_config.sh 
fi



# set language
./03_language.sh 

# make users
./04_users.sh 

# give computer a name
./06_hostname.sh 



# install and configure grub
#--------------------------------------
if [ $boot == 'BIOS' ]
then
    # install bios version of grub
    ./07_grub_bios_install.sh 
    ./08_grub_bios_config.sh 
else
    # install uefi version of grub
    ./07_grub_uefi_install.sh 
    ./08_grub_uefi_config.sh 
fi


# check if any installs failed
echo 'Check for errors. Do you want to continue? (y/n)'
read cont

if [ $cont = 'n' ]
then
    echo ending script
    exit 1
fi



# make swap file
#--------------------------------------
./09_swap.sh 


# move install file to home/blair
#--------------------------------------
./10_mv_installer.sh


