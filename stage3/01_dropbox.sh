#!/bin/bash

# start firefox to login
echo Please login to firefox
firefox &


# start dropbox
dropbox &

echo "Is this computer a server? (yes/no)"
read server

if [ server == 'yes' ]
then

    # start jellyfin and enable at boot
    sudo systemctl start jellyfin
    sudo systemctl enable jellyfin 

    # install crons
    

fi

