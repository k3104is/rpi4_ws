#!/bin/bash

#xz ubuntu-22.04.1-preinstalled-server-arm64+raspi.img.xz
# attach image to loopback device
sudo losetup -rP loop50 ubuntu-22.04.1-preinstalled-server-arm64+raspi.img

# mount loopback device
sudo mount -o ro /dev/loop50p2 /mnt

# to tarball
sudo tar acfp rootfs_rpi4_server.tar.gz -C /mnt .

# umount
sudo umount /mnt

# detach from loopback device
sudo losetup -d /dev/loop50
