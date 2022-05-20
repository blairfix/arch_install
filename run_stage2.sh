#/bin/bash

cd ./stage2

# make directories for user
./01_mkdirs.sh 2>&1 | tee -a install.log

# install pacman programs
#--------------------------------------
sudo ./02_pacman.sh 2>&1 | tee -a install.log


# check if any installs failed
echo 'Do you want to continue? (y/n)'
read cont

if [ $cont = 'n' ]
then
    echo ending script
    exit 1
fi



# install programs from Arch User Repository
#--------------------------------------
./03_aur.sh 2>&1 | tee -a install.log 


# check if any installs failed
echo 'Do you want to continue? (y/n)'
read cont

if [ $cont = 'n' ]
then
    echo ending script
    exit 1
fi


# install config files
./04_dots.sh 2>&1 | tee -a install.log

# install r packages
Rscript 05_r_packages.R 2>&1 | tee -a install.log

# install blair's r packages
./06_blair_rpack.sh 2>&1 | tee -a install.log

# install python libraries
./07_python.sh 2>&1 | tee -a install.log

# get ipvanish servers
./08_ipvanish.sh 2>&1 | tee -a install.log


# check for errors
cat install.log | grep -i error > error.log
