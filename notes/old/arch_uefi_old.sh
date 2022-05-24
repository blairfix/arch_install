# install notes for UEFI
#---------------------------------------------

# guide:
https://www.youtube.com/watch?v=DPLnBPM4DhI
https://www.learnlinux.tv/arch-linux-full-installation-guide/

# get disk partitions
fdisk -l

# assuming partition is /dev/sda
fdisk /dev/sda

# make new GPT partion table
g



# make EFI partition
#---------------------------------------------

# new partition 
n

# Partition number 1 (use default)
# first sector (use default)
# last sector
+500M

# set type of partition
t

# set partition type
1



# make linux partition
#---------------------------------------------

# new partition
n

# Partition number 2 (use default)
# first sector (use default)
# last sector (use default, which fills rest of hard drive)

# set type of partition
t

# partition number 
2

# partition type
30 # Linux LVM

# write changes
w



# format file systems
#---------------------------------------------

    # make EFI partition
    mkfs.fat -F32 /dev/sda1

    # lvm 
    pvcreate --dataalignment 1m /dev/sda2

    # volume group
    vgcreate volgroup0 /dev/sda2

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


    #---------------------------------------------
    # make fstab file
    mkdir /mnt/etc
    genfstab -U -p /mnt >> /mnt/etc/fstab



# install arch
#---------------------------------------------

# base packages
pacstrap -i /mnt base

# change root to /mnt 
arch-chroot /mnt

# install linux kernel
pacman -S linux linux-headers linux-lts linux-lts-header # accept default providers



# base developer packages
pacman -S base-devel

# networking
pacman -S networkmanager wpa_supplicant wireless_tools netctl

# network manager
pacman -S dialog

# enable network manager
systemctl enable NetworkManager

# add lvm support
pacman -S lvm2
pacman -S vim

# add lvm2 to mkinitcpio.conf
# got to hooks, add 'lvm2' between block and filesystems
vim /etc/mkinitcpio.conf
HOOKS=(base udev autodetect modconf block lvm2 filesystems keyboard fsch)

mkinitcpio -p linux
mkinitcpio -p linux-lts


# set language
vim /etc/locale.gen
locale-gen

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

# grub
pacman -S grub efibootmgr dosfstools os-prober mtools

# efi boot loader
mkdir /boot/EFI
mount /dev/sda1 /boot/EFI

grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck





# exit chroot and reboot
#---------------------------------------------
exit
umount -a
reboot


# make swap file
dd if=/dev/zero of=/swapfile bs=1M count=2048 status=progress
chmod 600 /swapfile
mkswap /swapfile

# back up fstab
cp /etc/fstab /etc/fstab.bak

# add swap file to fstab
echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab



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

