FROM amd64/ubuntu:18.04

WORKDIR /chal

COPY setup-apt.sh .
RUN ./setup-apt.sh

# Download all the required sources
COPY setup-sources.sh . 
RUN ./setup-sources.sh

# Install a RISC-V toolchain
COPY setup-toolchain.sh . 
RUN ./setup-toolchain.sh
ENV PATH="${PATH}:/opt/riscv/bin"

# Build QEMU with the RISC-V target
COPY setup-qemu.sh . 
RUN ./setup-qemu.sh
ENV PATH="${PATH}:/opt/riscv-qemu/bin"

# Build Linux for the RISC-V target
# COPY setup-linux.sh . 
# RUN ./setup-linux.sh

# Build Busybox
# COPY setup-busybox.sh . 
# RUN ./setup-busybox.sh

RUN apt install -y netcat-traditional

COPY challenges/ ./
COPY start_* ./
RUN chmod +x start_*

EXPOSE 1234 4444
CMD ["./start_nc.sh"]
