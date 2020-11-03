#include <stdio.h>

typedef unsigned int uint;
typedef unsigned char byte;

uint getCrc(byte *ptr, int val)
{
    byte *new_ptr;
    int iVar1;
    uint uVar2;

    new_ptr = ptr + val;
    uVar2 = 0xffffffff;
    while (new_ptr != ptr)
    {
        uVar2 = uVar2 ^ *ptr;
        iVar1 = 8;
        do
        {
            iVar1 = iVar1 + -1;
            uVar2 = -(uVar2 & 1) & 0xedb88320 ^ uVar2 >> 1;
        } while (iVar1 != 0);
        ptr = ptr + 1;
    }
    return ~uVar2;
}

int main()
{
    const uint len = 0xd + 45;
    const byte c13 = '#';
    byte buf[len+1];

    // Initialize
    int i;
    for (i=0; i<len; i++) {
        buf[i] = '#';
    }
    buf[i] = 0;

    buf[0xd] = c13;

    buf[0x1a] = '*';
    buf[0x27] = '0';
    buf[0x28] = '2';
    buf[0x29] = '0';
    buf[0x2a] = '0';

    printf("%s\n", buf);

    byte* ptr = (byte*)buf + 0xd;
    uint res = getCrc(ptr, buf[0xd]);

    printf("getCrc: %c -> %d\n", c13, res);
    
    byte* next = buf + c13;
    for (int i=0; i!=0x20; i+=8)
    {
        byte desired = (res >> (c13 & 0x3f) & 0x3f) + 0x2e;
        printf("Current: %c\n", next[0xd]);
        printf("Desired: %c\n", desired);
        
        next[0xd] = desired;
        next = next + 1;
    }

    printf("%s\n", buf);

    return 0;
}
