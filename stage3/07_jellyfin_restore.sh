#!/usr/bin/bash

# backup jellyfin metadata
rsync -avzh  /media/blair/Backup_drive/jellyfin_backup/ /var/lib/jellyfin 

# change file permissions
cd /var/lib/jellyfin
sudo chown -R jellyfin ./*
sudo chgrp -R jellyfin ./*

#sudo setfacl -m u:jellyfin:rx /home/blair/Multimedia/


# sudo usermod -a -G jellyfin blair

find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;
