#  CSAW-ESC-Quals-2020

**Team [B]**  

Members:
- Kevin Park
- Lisa Nute
- Akshat Sistla
- Parker Harris

## Docker Environment Setup Instruction
Make sure you have docker installed on your machine.  
[Get Docker](https://docs.docker.com/get-docker/)

### Build the Docker Image
This may take 10-20 minutes.
```bash
$ sudo docker build -t k0vicine/csaw-esc docker/
```

### Run the Docker Image
```bash
$ sudo docker run --rm -d -p 1234:1234 -p 4444:4444 k0vicine/csaw-esc
```
#### Interfacing with the Challenge
Interface with the challenge using netcat on port `4444`.
```bash
$ nc localhost 4444
```
Interface with the challenge `gdbserver` over port `1234`.
```bash
$ gdb ./docker/qual-esc2020.elf
(gdb) target remote localhost:1234

```

#### Stopping the Docker Image
```bash
$ sudo docker stop $(sudo docker ps | grep csaw-esc | awk '{print $1}')
```