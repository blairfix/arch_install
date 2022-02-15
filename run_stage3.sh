#!/bin/bash

echo installing stage 3

echo "Is this a server install? (yes/no)"
read server

cd stage3/

# login to dropbox and firefox
./01_logins.sh 2>&1 | tee -a install.log

# install dropsync
./02_timers_laptop.sh 2>&1 | tee -a install.log

# if this is a server,  run these scripts
if [ $server == "yes" ]
then

       # add server timers
   ./03_timers_server.sh 2>&1 | tee -a install.log

    # add external drives to sftab
   ./04_fstab.sh 2>&1 | tee -a install.log


    # configure rclone and selenium, start jellyfin
    ./05_config_server.sh 2>&1 | tee -a install.log

fi


# transfer files from backup drive
./06_file_trans.sh 2>&1 | tee -a install.log



























if [ $boot == 'BIOS' ]
then
    # install bios version of lvm
    ./02_lvm_bios_config.sh 2>&1 | tee -a install.log
else
    # install uefi version of lvm
    ./02_lvm_uefi_config.sh 2>&1 | tee -a install.log
fi


















cat install.log | grep -i error > error.log

