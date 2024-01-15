[org 0x0100]
mov al, [num1] ; move 2 to al
mov bl, [num2] ;move 1 to bl
add al, bl ; 1+2= 3
mov [result],al ;3 is in binary is 111 so its bits is even in binary
so parity fleg set to 1
mov ax, 0x4c00
int 0x21
num1 db 2
num2 db 1
result db 0