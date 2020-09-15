#!/bin/bash

#### Precompiled Toolchain ####
VERSION="v20200908"
TYPE="riscv32-glibc-nightly"

apt install -y unzip


#### Prebuilt Toolchain - kevinpark1217 ####
curl https://github.com/kevinpark1217/riscv-gnu-toolchain/releases/download/$VERSION/$TYPE.zip \
        -L --progress-bar --output $TYPE.zip
unzip $TYPE.zip
tar -xvf riscv.tar.gz
mv riscv /opt/riscv


#### Manual Compilation ####
# cd riscv64-linux/riscv-gnu-toolchain
# ./configure --prefix=/opt/riscv --with-arch=rv32gc --with-abi=ilp32d
# make -j4 linux