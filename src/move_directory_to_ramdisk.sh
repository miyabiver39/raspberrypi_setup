#!/bin/bash

# fstab
fstab_file='/etc/fstab'
cp -a fstab_file{,.`date '+%Y%m%d'`}

# edit
sed -i '$a tmpfs        /tmp            tmpfs   defaults,size=256m   0       0' fstab_file
sed -i '$a tmpfs        /var/tmp        tmpfs   defaults,size=16m    0       0' fstab_file
sed -i '$a tmpfs        /var/log        tmpfs   defaults,size=16m    0       0' fstab_file

# script install
cp ./make_log_directory.sh /usr/local/sbin/make_log_directory.sh
chmod 700 /usr/local/sbin/make_log_directory.sh

# service install
cp ./make_log_directory.service /etc/systemd/system/make_log_directory.service
chmod 700 /etc/systemd/system/make_log_directory.service

# servic enable
systemctl enable make_log_directory.service
