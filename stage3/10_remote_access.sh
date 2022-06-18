#!/usr/bin/bash

# get hostname
host=$(hostname)


# generate key
ssh-keygen -t rsa

# send key to server

echo 'On the other computer:'
echo 'run ssh_no_pw'
echo 'type GO when finished'
read go

if [ $host == 'blair-server' ]
then
    cat ~/.ssh/id_rsa.pub  | ssh -p 1497 blair@100.91.80.50 'cat >> .ssh/authorized_keys'
fi


# send to laptop
if [ $host == 'blair-laptop' ]
then
    cat ~/.ssh/id_rsa.pub  | ssh -p 1497 blair@100.73.13.66 'cat >> .ssh/authorized_keys'
fi

