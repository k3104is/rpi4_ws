#!/bin/bash

# Install Required Dependencies and Toolchain
sudo apt install git bc bison flex libssl-dev make libc6-dev libncurses5-dev

# Install the 64-bit Toolchain for a 64-bit Kernel
sudo apt install crossbuild-essential-arm64
