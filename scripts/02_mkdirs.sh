#!/bin/bash

# make home directories
echo making home directories

su -

cd ~
mkdir cronjobs Desktop Documents Downloads Dropbox Multimedia ipvanish Projects Research

# directory for backup drive
mkdir -p /media/blair/Backup_drive
