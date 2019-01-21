#!/bin/bash

# https://azriton.github.io/2017/03/16/Raspbian-Jessie-Lite%E3%81%AESD%E3%82%AB%E3%83%BC%E3%83%89%E5%BB%B6%E5%91%BD%E5%8C%96/

swapoff --all
apt-get purge -y --auto-remove dphys-swapfile
rm -fr /var/swap
