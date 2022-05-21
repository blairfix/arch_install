#/bin/bash

cd ./stage2

# make directories for user
./01_mkdirs.sh 

# install pacman programs
#--------------------------------------
sudo ./02_pacman.sh


# check if any installs failed
echo 'Look for errors ... do you want to continue? (y/n)'
read cont

if [ $cont = 'n' ]
then
    echo ending script
    exit 1
fi



# install programs from Arch User Repository
#--------------------------------------
./03_aur.sh  


# check if any installs failed
echo 'Look for errors ... do you want to continue? (y/n)'
read cont

if [ $cont = 'n' ]
then
    echo ending script
    exit 1
fi


# install config files
./04_dots.sh 

# install r packages
Rscript 05_r_packages.R 

# install blair's r packages
./06_blair_rpack.sh 

# install python libraries
./07_python.sh 

# get ipvanish servers
./08_ipvanish.sh 

# set time
sudo ./09_timezone.sh


# check for errors
cat install.log | grep -i error > error.log
