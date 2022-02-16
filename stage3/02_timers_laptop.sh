#!/bin/bash

echo installing system timers for laptop

# clone dots git
cd ~
git clone https://github.com/blairfix/blair_dots.git

# install dropsync
cd ~/blair_dots/systemd/dropsync
./add_tm.sh




