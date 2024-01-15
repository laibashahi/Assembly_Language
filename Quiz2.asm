[org 0x0100]
mov bx, num1 
mov cx, 8
mov ax, 0 
l1: add ax, [bx] 
add bx, 2  
sub cx, 1 
jnz l1 
mov [laiba_47], ax 
mov ax, 0x4c00 
int 0x21
num1: dw 2,4,6,8,10,12,14,16
laiba_47 : dw 0