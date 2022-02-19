#!/bin/bash

echo installing stage 3

cd stage3/

# login to dropbox and firefox
./01_logins.sh 2>&1 | tee -a install.log

# install dropsync
./02_timers_laptop.sh 2>&1 | tee -a install.log

# transfer files from backup drive
./03_file_trans.sh 2>&1 | tee -a install.log


# server specific scripts
#---------------------------------------

echo "Is this a server install? (yes/no)"
read server


# if this is a server,  run these scripts
if [ $server == "yes" ]
then

    # add server timers
    ./04_timers_server.sh 2>&1 | tee -a install.log

    # add external drives to sftab
    sudo ./05_fstab.sh 2>&1 | tee -a install.log


    # configure rclone and selenium, start jellyfin
    ./06_config_server.sh 2>&1 | tee -a install.log

fi


