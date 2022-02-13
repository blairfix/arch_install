#!/bin/bash

# first stage of arch installing, run in root session

# ask user the type of installion
echo What type of boot do you want? BIOS or UEFI?
read boot

# got to stage one scripts
cd ./stage1

# install core programs
./01_core_programs.sh 2>&1 | tee -a install.log

# convigure lvm
if [ $boot == 'BIOS' ]
then
    # install bios version of lvm
    ./02_lvm_bios_config.sh 2>&1 | tee -a install.log
else
    # install uefi version of lvm
    ./02_lvm_uefi_config.sh 2>&1 | tee -a install.log
fi


# set language
./03_language.sh 2>&1 | tee -a install.log

# make users
./04_users.sh 2>&1 | tee -a install.log

# set timezone
./05_timezone.sh 2>&1 | tee -a install.log

# give computer a name
./06_hostname.sh 2>&1 | tee -a install.log

# install and configure grub
if [ $boot == 'BIOS' ]
then
    # install bios version of grub
    ./07_grub_bios_install.sh 2>&1 | tee -a install.log
    ./08_grub_bios_config.sh 2>&1 | tee -a install.log
else
    # install uefi version of grub
    ./07_grub_uefi_install.sh 2>&1 | tee -a install.log
    ./08_grub_uefi_config.sh 2>&1 | tee -a install.log
fi

# make swap file
./09_swap.sh 2>&1 | tee -a install.log


# check for errors
cat install.log | grep -i error > error.log
