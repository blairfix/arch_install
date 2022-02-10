
# android
#----------------------------------------------------------------------
# https://www.debugpoint.com/2016/03/how-to-access-android-devices-internal-storage-and-sd-card-in-ubuntu-linux-mint-using-media-transfer-protocol-mtp/
sudo apt-get install libmtp-common
sudo apt-get install libmtp-dev
sudo apt-get install go-mtpfs
sudo apt-get install libmtp-runtime
sudo apt install mtp-tools

#mtp-detect
#sudo gedit /etc/udev/rules.d/51-android.rules
#ATTR{idVendor}=="pid", ATTR{idProduct}=="2e82", MODE="0666"
#sudo service udev restart


