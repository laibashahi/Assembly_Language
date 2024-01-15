;progarm fo calculating squrare of 20
[org 0x0100]

jmp start        ; Jump to the start label

data: dw 20      ; Define a word variable named data with an initial value of 20

start:
    mov ax, 0     ; Initialize ax register to 0
    mov cx, 20    ; Initialize cx register to 20

loop:
    add ax, [data] ; Add the value at the memory location data to ax
    sub cx, 1      ; Decrement cx by 1
    jnz loop       ; Jump to loop if cx is not zero

    mov ax, 0x4c00 ; Set ax to the exit code
    int 0x21       ; Make an interrupt call to exit the program
