# install notes for BIOS
#-----------------------

# guides
https://www.youtube.com/watch?v=DPLnBPM4DhI
https://www.learnlinux.tv/arch-linux-full-installation-guide/

# get disk partitions
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
    lvcreate -L 25GB volgroup0 -n lv_root 

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



# user priviledges
#---------------------------------------------

# set root password
passwd

# add user
useradd -m -g users -G wheel blair 
passwd blair

# edit sudo priviledges
visudo

# uncomment
%wheel ALL=(ALL) ALL



# install boot loader
#---------------------------------------------

# grub and dependencies
pacman -S grub dosfstools os-prober mtools

# install grub
grub-install --target=i386-pc --recheck /dev/sda

# grub directory
mkdir /boot/grub/locale

# copy locale file to grub directory
cp /usr/share/locale/en_US/LC_MESSAGES/mit-krb5.mo /boot/grub/locale/en.mo

# generate grub config file
grub-mkconfig -o /boot/grub/grub.cfg




# exit chroot and reboot
#---------------------------------------------
exit
umount -a
reboot


# set time zone
#---------------------------------------------
timedatectl list-timezones
timedatectl set-timezone America/Detroit


# enable time synchronization with systemmd
systemctl enbable systemd-timesyncd


# name of computer
#---------------------------------------------

# set host name
hostnamectl set-hostname myhostname

# edit /etc/hosts
127.0.0.1 localhost
127.0.1.1 myhostname

