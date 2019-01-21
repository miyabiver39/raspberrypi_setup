#!/bin/bash

# https://qiita.com/mt08/items/d27085ac469a34526f72

sudo raspi-config nonint do_expand_rootfs
# gpu memory is small
sudo raspi-config nonint do_memory_split 16
# camera disabled
sudo raspi-config nonint do_camera 1
# timezone
sudo raspi-config nonint do_change_timezone Asia/Tokyo
