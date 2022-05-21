#!/bin/bash

echo installing stage 3

cd stage3/

# login to dropbox and firefox
./01_logins.sh 

# install dropsync
./02_timers_laptop.sh 

# transfer files from backup drive
./03_file_trans.sh 


# server specific scripts
#---------------------------------------

echo "Is this a server install? (yes/no)"
read server


# if this is a server,  run these scripts
if [ $server == "yes" ]
then

    # installing jellyfin
    yay -S jellyfin-bin

    # add server timers
    ./04_timers_server.sh 

    # add external drives to sftab
    sudo ./05_fstab.sh 


    # configure rclone and selenium, start jellyfin
    ./06_config_server.sh 

fi


