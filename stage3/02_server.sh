#!/bin/bash


# start jellyfin and enable at boot
sudo systemctl start jellyfin
sudo systemctl enable jellyfin 

# setup rclone
echo Setting up rclone ...
echo 'Please type: rclone config'
echo Select new remote
echo The name of the remote is remote
alacritty 

# setup firefox profile for selenium
echo Time to make a firefox profile for selenium
echo "1. Make a profile called 'scrape'"
echo "2. Download the subscriber csv and tell firefox to save it in downloads dir" 

firefox -p
firefox --new-tab https://wordpress.com/people/email-followers/economicsfromthetopdown.com







