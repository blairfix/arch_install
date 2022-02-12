#!/bin/bash


# start jellyfin and enable at boot
sudo systemctl start jellyfin
sudo systemctl enable jellyfin 

# setup rclone
echo '----------------------------------------------------'
echo Setting up rclone ...
echo ' '
echo '1. Please type: rclone config'
echo '2. Select new remote'
echo '3. The name of the remote is "remote"'
echo '4. Drobox should be option 11'

alacritty 

# setup firefox profile for selenium
echo '----------------------------------------------------'
echo ' '
echo Time to make a firefox profile for selenium
echo "1. Make a profile called 'scrape'"
echo "2. Download the subscriber csv and tell firefox to save it in downloads dir" 

firefox -p
firefox --new-tab https://wordpress.com/people/email-followers/economicsfromthetopdown.com







