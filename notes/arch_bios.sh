# install notes for BIOS
#-----------------------

# guides
https://www.youtube.com/watch?v=DPLnBPM4DhI
https://www.learnlinux.tv/arch-linux-full-installation-guide/


# connect to wifi
#---------------------------------------------

iwctl
device list

# list networks
station wlan0 get-networks
station wlon0 connect postcarbon_5g

# test connection
quit
ping -c 3 google.com



# format disk
#---------------------------------------------


# list disk partitions
fdisk -l

# make new partition (check actual device)
# assuming partition is /dev/sda
fdisk /dev/sda



# make lvm partition
#---------------------------------------------

# make new partition table
o

# new partition
n

# accept defaults
enter
enter
enter

# set type of partition 
t

# LVM partition code
8e

# activate partition
a

# write
w



# create the file system
#---------------------------------------------

# make an lvm partition
pvcreate --dataalignment 1m /dev/sda1

    # make volumes
    #---------------------------------------------

    # make volume group 0
    vgcreate volgroup0 /dev/sda1

    # make root file system (choose size appropiately)
    lvcreate -L 60GB volgroup0 -n lv_root 

    # make home file system
    lvcreate -l 100%FREE volgroup0 -n lv_home

    # activate volumes
    modprobe dm_mod
    vgscan
    vgchange -ay


    # format volumes
    #---------------------------------------------

    # format root filesystem
    mkfs.ext4 /dev/volgroup0/lv_root

    # format home filesystem  
    mkfs.ext4 /dev/volgroup0/lv_home  


    # mount root filesystem
    mount /dev/volgroup0/lv_root /mnt

    # mount home filesystem
    mkdir /mnt/home
    mount /dev/volgroup0/lv_home /mnt/home


    # make fstab file
    #---------------------------------------------
    mkdir /mnt/etc
    genfstab -U -p /mnt >> /mnt/etc/fstab



# install arch
#---------------------------------------------

# base packages
pacstrap -i /mnt base

# change root to /mnt 
arch-chroot /mnt

# install git
pacman -S git

# switch to home directory and clone arch install
cd home
git clone https://github.com/blairfix/arch_install.git



# run stage 1
#---------------------------------------------
cd arch_install
./run_stage1.sh

# uncomment wheel (on prompt)
# %wheel ALL=(ALL) ALL


# exit chroot and reboot
#---------------------------------------------
exit
umount -a
reboot



# run stage 2
#---------------------------------------------
cd /home/blair/arch_install
./run_stage2.sh


# run stage 3
#---------------------------------------------

# plug in external drive
startx
cd /home/blair/arch_install
./run_stage3.sh







