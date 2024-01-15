[org 0x0100]
mov al, [num1] ; move 10 to al
mov bl, [num2] ;move 10 to bl
sub al, bl ;sub al and bl
mov ax, 0x4c00
int 0x21
num1 db 10

num2 db 10