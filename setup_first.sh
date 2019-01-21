#/bin/bash

# Define
source ./define.sh
PWD=`pwd`

# motd delete
cp /dev/null /etc/motd

####################################
# version up
####################################
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y install rpi-update
rpi-update

# move src directory
cd src

####################################
# vimrc setup
####################################
cp .vimrc ~/
cp .vimrc /etc/skel

####################################
# watch dog setup
####################################
bash ./setup_watch_dog.sh

####################################
# raspi-config
####################################
bash ./raspi_congih.sh

####################################
# ntpdate setup
####################################
bash ./setup_ntpdate.sh

####################################
# swap off
####################################
bash ./swap_off.sh

####################################
# log and tmp directory move ramdisk
####################################
bash ./move_directory_to_ramdisk.sh

#########################
# journal stop
#########################
umount /dev/mmcblk0p2
tune2fs -O ^has_journal /dev/mmcblk0p2

cd ${PWD}
echo "end to setup_first."

# reboot
restart