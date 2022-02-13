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
echo '5. Choose default blank string for client id'
echo '6. Choose default blank string for client secret'
echo '7. No advanced config'
echo '8. Choose autoconfig'
echo '9. Yes this is OK'
echo '10. quit'

alacritty 



# setup firefox profile for selenium
echo '----------------------------------------------------'
echo Time to make a firefox profile for selenium
echo ' '
echo '1. Select "Create Profile"'
echo '2. Make a profile called "scrape"'
echo '3. Close firefox'
echo '4. Login to wordpress and download subscriber csv'
echo '5. Select "Do this automatically for files ...'
echo '6. Close firefox'
echo '7. Log back in as default-release'
echo '8. Select "Use selected profile ...'


firefox -p
firefox --new-tab https://wordpress.com/people/email-followers/economicsfromthetopdown.com
firefox -p


# install systemd timers



