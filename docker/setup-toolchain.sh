#!/bin/bash

# cd riscv64-linux/riscv-gnu-toolchain

# ./configure --prefix=/opt/riscv --with-arch=rv32gc --with-abi=ilp32d
# make -j4 linux


RISCV_VERSION="riscv32-ilp32d--glibc--bleeding-edge-2020.02-2"
RISCV_SHORT="riscv32-ilp32d"
curl https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/$RISCV_VERSION.tar.bz2 \
        --progress-bar --output $RISCV_SHORT.tar.bz2
tar -xvf riscv32-ilp32d.tar.bz2 \
        --transform s/$RISCV_VERSION/$RISCV_SHORT/
mv $RISCV_SHORT /opt/riscv