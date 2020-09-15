#!/bin/bash

cd riscv32-linux/qemu

apt-get install -y libglib2.0-dev libpixman-1-dev

# git checkout v5.0.0
./configure --target-list=riscv32-softmmu
make -j $(nproc)
make install