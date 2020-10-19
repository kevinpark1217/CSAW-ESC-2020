#!/bin/bash

ELF_FILE=qual-esc2020.elf
# ELF_FILE=finals/setA/amnesia.elf

qemu-system-riscv32 -gdb tcp::1234 -nographic -machine sifive_e -kernel $ELF_FILE
