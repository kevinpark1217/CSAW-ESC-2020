#!/bin/bash

qemu-system-riscv32 -s -nographic -machine sifive_e -kernel qual-esc2020.elf
