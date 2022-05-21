#!/bin/bash

echo Please enter the path to the backup drive
echo "i.e. /dev/sdb2"

read bak_path

# mount backup drive
sudo mount $bak_path /media/blair/Backup_drive



# rsync
#-------------------------------------------------------

# copy cronjobs
rsync -avzh /media/blair/Backup_drive/Blair_backup/cronjobs/ /home/blair/cronjobs

# copy Desktop
rsync -avzh /media/blair/Backup_drive/Blair_backup/Desktop/ /home/blair/Desktop

# copy Documents
rsync -avzh /media/blair/Backup_drive/Blair_backup/Documents/ /home/blair/Documents

# copy Projects
rsync -avzh /media/blair/Backup_drive/Blair_backup/Projects/ /home/blair/Projects

# copy Research
rsync -avzh /media/blair/Backup_drive/Blair_backup/Research/ /home/blair/Research


