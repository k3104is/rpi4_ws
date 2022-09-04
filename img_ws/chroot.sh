#!/bin/bash

# ref:https://qiita.com/autch/items/c8c9cdc7b8e5821e81a4

#sudo apt install qemu-user-static

if [ $# != 1 ]; then
    echo set chroot path to arg1
    return
fi

PATH_CHROOT=$1
PATH_NOW=`pwd`

cd $1
sudo cp /usr/libexec/qemu-binfmt/arm-binfmt-P ./usr/bin/

sudo chroot ./ /bin/bash

cd $PATH_NOW
