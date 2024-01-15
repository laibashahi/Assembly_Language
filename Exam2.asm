[org 0x0100]

jmp start

data_1: dw 16, 15, 14
data_2:	dw 10, 09, 08
data_3: dw 02, 04, 06
output: dw 0


addFunction_1:
	
	
	
	push ax
	push bx
	push dx
	push bp
	mov bp, sp
	
	mov ax, [bp + 2]
	add ax, [bp + 4]
	add ax, [bp + 6]
	
	mov [output], ax 
	
	
	
	
	pop bp
	pop dx
	pop bx
	pop ax
	
	
	ret




	
	
	
start:

	;FOR DATA SET ONE data_1
	
	mov ax, [data_1]
	
	mov bx, [data_1 + 2]
	
	mov dx, [data_1 + 4]
	
	call addFunction_1
	mov cx, [output]
	
	
	;FOR DATA SET TWO data_2
	
	mov ax, [data_2]
	
	mov bx, [data_2 + 2]
	
	mov dx, [data_2 + 4]
	
	call addFunction_1
	mov si, [output]
	
	;FOR DATA SET THREE data_3
	
	mov ax, [data_3]
	
	mov bx, [data_3 + 2]
	
	mov dx, [data_3 + 4]
	
	
	call addFunction_1
	mov di, [output]
	
	
	mov ax, cx
	mov bx, si
	mov cx, di
	
	;AX holds the Result of Data Set One data_1
	;BX holds the Resukt of Data Set Two data_2
	;CX holds the Result of Data Set Three data_3
	
	
	
	
	mov ax, 0x4c00
	int 0x21
	