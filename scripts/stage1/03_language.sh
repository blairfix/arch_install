#!/bin/bash

# backup dictionary
cp /etc/locale.gen /etc/locale.gen.bak

# uncomment US dictionary
find_string="#en_US.UTF-8 UTF-8"
replace_string="en_US.UTF-8 UTF-8"
sed i "s/$find_string/$replace_string/g" /etc/locale.gen

# install
locale-gen

