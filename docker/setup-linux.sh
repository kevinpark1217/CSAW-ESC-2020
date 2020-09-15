#!/bin/bash

cd riscv32-linux/linux

# Build Linux for the RISC-V targe
# git checkout v5.4.0
make ARCH=riscv CROSS_COMPILE=riscv32-buildroot-linux-gnu- defconfig

# compile the kernel
make ARCH=riscv CROSS_COMPILE=riscv32-buildroot-linux-gnu- -j $(nproc)