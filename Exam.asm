;22p_9247
;section c
[org 0x0100]
jmp start
num1: dw 400
num2:  dw 300
result: dw 0


comparison_for_equality:
  push bp
  mov  bp,sp
  push ax 
  push bx
  mov ax ,[bp+4]
  mov bx, [bp+6]
  cmp ax,bx
  je result1 
  pop bx
  pop ax
  pop bp
  ret 4
  
  result1:
  mov [result], ax
  pop bx
  pop ax
  pop bp
  ret 4
 
  
  
greater_or_equal:
push bp
  mov  bp,sp
  push ax 
  push bx
  mov ax ,[bp+4]
  mov bx, [bp+6]
  cmp ax,bx
  jae no_swap
   xchg ax , bx 
  
  pop bx
  pop ax
  pop bp
  ret 4
  
  
  no_swap:
   pop bx
  pop ax
  pop bp
  
  
    ret 4
  
 
  
  
  less_or_equal:
  push bp
  mov  bp,sp
  push ax 
  push bx
  mov ax ,[bp+4]
  mov bx, [bp+6]
  cmp ax,bx
  jbe no_xchg
   xchg ax , bx 
  
  pop bx
  pop ax
  pop bp
  ret 4
  
  
  no_xchg:
   pop bx
  pop ax
  pop bp
  
  
    ret 4
 
  
start:
  mov ax , num1
  
  push ax
  
  mov ax, num2
  
  push ax 
  
 
  call comparison_for_equality
   mov ax , num1
  
  push ax
  
  mov ax, num2
  
  push ax 
  call greater_or_equal
   mov ax , num1
  
  push ax
  
  mov ax, num2
  
  push ax 
  call less_or_equal
    
	
	mov ax , 0x04c00
	int 0x21