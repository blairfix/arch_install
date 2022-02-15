#!/bin/bash

echo installing server timers

cd blair_dots/systemd/

# install user timers
./add_user_timers.sh

# install system timers
sudo ./add_system_timers.sh
