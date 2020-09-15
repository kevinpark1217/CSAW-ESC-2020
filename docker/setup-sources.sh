#!/bin/bash

# create a working directory, where we’ll download and build all the sources
mkdir riscv32-linux
cd riscv32-linux

apt install -y git

# Download all the required sources
GIT_OPTIONS="--progress --verbose --depth 1"
QEMU_TAG="v5.0.0"
LINUX_TAG="v5.4"

git clone $GIT_OPTIONS --branch $QEMU_TAG https://github.com/qemu/qemu

#### NOT NEEDED ####
# git clone $GIT_OPTIONS --branch $LINUX_TAG https://github.com/torvalds/linux
# git clone $GIT_OPTIONS https://git.busybox.net/busybox

#### USE PRECOMPIPLED TOOLCHAIN ####
# git clone $GIT_OPTIONS https://github.com/riscv/riscv-gnu-toolchain
# cd riscv-gnu-toolchain
# git submodule update --init --recursive --progress --recommend-shallow
