#!/bin/bash

#### Precompiled Toolchain ####
VERSION="v20200908"
TYPE="riscv64-glibc-nightly"

rm -rf riscv/

#### Prebuilt Toolchain - kevinpark1217 ####
curl https://github.com/kevinpark1217/riscv-gnu-toolchain/releases/download/$VERSION/$TYPE.zip \
        -L --progress-bar --output $TYPE.zip
unzip $TYPE.zip
tar -xvf riscv.tar.gz
rm riscv.tar.gz $TYPE.zip

# Setup symlinks
PREFIX="riscv64-unknown-linux-gnu-"
PREFIX_SIZE=${#PREFIX}
cd riscv/bin
for FILE in $PREFIX*; do
    FILE_WO_PREFIX=$(echo $FILE | cut -c$((PREFIX_SIZE+1))-);
    ln -s $FILE $FILE_WO_PREFIX;
done