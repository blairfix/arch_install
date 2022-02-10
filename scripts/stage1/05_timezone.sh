#!/bin/bash

echo setting time zone to Toronto 

# timedatectl list-timezones
timedatectl set-timezone America/Toronto


# enable time synchronization with systemmd
systemctl enbable systemd-timesyncd


