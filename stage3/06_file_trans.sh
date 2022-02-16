#!/bin/bash

echo Transfering files to new Arch install.
echo Make sure your backup device is connected.
echo If it is, press any key to continue.

read var

# mount backup drive
sudo mount /dev/sdb2/ /media/blair/Backup_drive

# copy Desktop
rsync -avzh /media/blair/Backup_drive/Desktop/ /home/blair/Desktop

# copy Projects
rsync -avzh /media/blair/Backup_drive/Projects/ /home/blair/Projects

# copy Research
rsync -avzh /media/blair/Backup_drive/Research/ /home/blair/Research

# copy Documents
rsync -avzh /media/blair/Backup_drive/Documents/ /home/blair/Documents



