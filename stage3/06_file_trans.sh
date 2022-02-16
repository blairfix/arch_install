#!/bin/bash

echo Time to transfer your files
echo "Here's a list of your drives:"
echo '-----------------------------------'
echo ' '
echo ' '

sudo fdisk -l

echo Please enter the path to the backup drive
echo "i.e. /dev/sdb2"

read bak_path

# mount backup drive
sudo mount $bak_path /media/blair/Backup_drive

# copy Desktop
rsync -avzh /media/blair/Backup_drive/Desktop/ /home/blair/Desktop

# copy Projects
rsync -avzh /media/blair/Backup_drive/Projects/ /home/blair/Projects

# copy Research
rsync -avzh /media/blair/Backup_drive/Research/ /home/blair/Research

# copy Documents
rsync -avzh /media/blair/Backup_drive/Documents/ /home/blair/Documents



