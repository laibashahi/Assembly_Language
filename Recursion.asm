[org 0x0100]
jmp start

base : dw  2
power : dw 4
result :dw 0




find:      
push bp    
mov bp , sp     
mov ax , [bp+6]
mov cx , [bp+4]
mov bx , ax


multi:
 
 
  mul bx 
  add [result] , ax 
  
  sub cx ,1
  jnz multi 
  pop bp
  
ret 4 


start:
mov ax , [base]
push ax
mov ax ,[power]
push ax
call find

 mov ax, 0x4c00 ; terminate program 
 int 0x21 