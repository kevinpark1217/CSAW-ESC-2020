#!/bin/bash

cd riscv32-linux/busybox
TOOLCHAIN_TYPE="riscv32-unknown-linux-gnu"

# Setup & Compile busybox
CROSS_COMPILE=$TOOLCHAIN_TYPE- make defconfig
CROSS_COMPILE=$TOOLCHAIN_TYPE- make -j $(nproc)
