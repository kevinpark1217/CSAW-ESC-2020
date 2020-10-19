#!/bin/bash

apt-get install -y libglib2.0-dev libpixman-1-dev

#### Prebuilt QEMU ####
TYPE="riscv-qemu"
VERSION="$TYPE-4.2.0-2020.04.0-x86_64-linux-ubuntu14"

curl https://static.dev.sifive.com/dev-tools/$VERSION.tar.gz \
        -L --progress-bar --output $TYPE.tar.gz
tar -xvf $TYPE.tar.gz
mv $VERSION /opt/riscv-qemu

#### Manual Compilation ####
# cd riscv32-linux/qemu

# # git checkout v5.0.0
# ./configure --target-list=riscv32-softmmu
# make -j $(nproc)
# make install