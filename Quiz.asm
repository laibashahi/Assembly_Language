[org 0x0100]

jmp start

num: dd 1200

num1: dd 1300

start:
   
   
 mov ax, word [num]
 add word [num1],ax
 mov ax , word [num+2]
 adc word [num1+2],ax
 
 mov ax,0x04c00
 int 0x21

  
  
 