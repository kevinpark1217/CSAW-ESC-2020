#!/bin/bash

cd riscv32-linux/linux
TOOLCHAIN_TYPE="riscv32-unknown-linux-gnu"

# Build Linux for the RISC-V target
# git checkout v5.4.0
make ARCH=riscv CROSS_COMPILE=$TOOLCHAIN_TYPE- defconfig

# compile the kernel
make ARCH=riscv CROSS_COMPILE=$TOOLCHAIN_TYPE- -j $(nproc)