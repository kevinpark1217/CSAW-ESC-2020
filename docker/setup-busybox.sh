#!/bin/bash

cd riscv32-linux/busybox

CROSS_COMPILE=riscv32-buildroot-linux-gnu- make defconfig
CROSS_COMPILE=riscv32-buildroot-linux-gnu- make -j $(nproc)
