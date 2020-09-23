FROM amd64/ubuntu:20.04

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

# Build ANGR python library
arg BRANCH=master
run apt-get update &&									\
	apt-get install -y virtualenvwrapper python3-dev python3-pip build-essential libxml2-dev libxslt1-dev git libffi-dev cmake libreadline-dev libtool debootstrap debian-archive-keyring libglib2.0-dev libpixman-1-dev qtdeclarative5-dev binutils-multiarch nasm libc6:i386 libgcc1:i386 libstdc++6:i386 libtinfo5:i386 zlib1g:i386 vim libssl-dev openjdk-8-jdk

run useradd -s /bin/bash -m angr

run su - angr -c "git clone https://github.com/angr/angr-dev -b $BRANCH && cd angr-dev && ./setup.sh -w -e angr && ./setup.sh -w -p angr-pypy"
run su - angr -c "echo 'source /usr/share/virtualenvwrapper/virtualenvwrapper.sh' >> /home/angr/.bashrc && echo 'workon angr' >> /home/angr/.bashrc"
cmd su - angr


# Build Linux for the RISC-V target
# COPY setup-linux.sh . 
# RUN ./setup-linux.sh

# Build Busybox
# COPY setup-busybox.sh . 
# RUN ./setup-busybox.sh

COPY qual-esc2020.elf ./
COPY start_* ./
RUN chmod +x start_*
RUN apt install -y netcat-traditional

EXPOSE 1234 4444
CMD ["./start_nc.sh"]
