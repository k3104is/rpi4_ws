#!/bin/bash

# Get the Kernel Sources
git clone --depth=1 https://github.com/raspberrypi/linux

# Build sources
cd linux
KERNEL=kernel8
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bcm2711_defconfig

# Build with Configs
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image modules dtbs

# install the kernel modules onto the SD card
sudo env PATH=$PATH make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- INSTALL_MOD_PATH=../ modules_install

#  copy the kernel and Device Tree blobs to ../boot
mkdir -p ../boot/overlays
sudo cp arch/arm64/boot/Image ../boot/$KERNEL.img
sudo cp arch/arm64/boot/dts/broadcom/*.dtb ../boot/
sudo cp arch/arm64/boot/dts/overlays/*.dtb* ../boot/overlays/
sudo cp arch/arm64/boot/dts/overlays/README ../boot/overlays/
