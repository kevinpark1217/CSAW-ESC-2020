#!/bin/bash

# Build QEMU with the RISC-V target
cd qemu
git checkout v5.0.0
./configure --target-list=riscv32-softmmu
make -j $(nproc)
make install
cd ..

# Build Linux for the RISC-V target. First, checkout to a desired version
cd linux
git checkout v5.4.0
make ARCH=riscv CROSS_COMPILE=riscv32-unknown-linux-gnu- defconfig

# Then compile the kernel
make ARCH=riscv CROSS_COMPILE=riscv32-unknown-linux-gnu- -j $(nproc)
cd ..

# Build Busybox
cd busybox
CROSS_COMPILE=riscv{{bits}}-unknown-linux-gnu- make defconfig
CROSS_COMPILE=riscv{{bits}}-unknown-linux-gnu- make -j $(nproc)
cd ..
