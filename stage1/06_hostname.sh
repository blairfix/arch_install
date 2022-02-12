#!/bin/bash

# give computer a name
echo enter the name of this computer
read host

# set host name
hostnamectl set-hostname $host

# add hosts to /etc/hosts
echo "127.0.0.1 localhost" >> /etc/hosts
echo "127.0.1.1 $host" >> /etc/hosts

