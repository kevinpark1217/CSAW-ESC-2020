#!/bin/bash

#### Precompiled Toolchain ####
TYPE="riscv64-unknown-elf"
VERSION="$TYPE-gcc-8.3.0-2020.04.0-x86_64-linux-ubuntu14"


#### Prebuilt Toolchain - kevinpark1217 ####
curl https://static.dev.sifive.com/dev-tools/$VERSION.tar.gz \
        -L --progress-bar --output $TYPE.tar.gz
tar -xvf $TYPE.tar.gz
mv $VERSION /opt/riscv


#### Manual Compilation ####
# cd riscv64-linux/riscv-gnu-toolchain
# ./configure --prefix=/opt/riscv --with-arch=rv32gc --with-abi=ilp32d
# make -j4 linux
