org 0x0100

jmp start

; Define an array of 10 words
original_array: dw 7, 14, 21, 28, 35, 42, 49, 6, 13, 20
even_numbers: dw 0  ; Array to store even numbers
odd_numbers: dw 0   ; Array to store odd numbers

start:
    mov cx, 10             ; Number of elements in the array
    mov si, original_array ; Source index for the original array
    mov di, even_numbers   ; Destination index for the even numbers array
    mov bx, odd_numbers    ; Destination index for the odd numbers array

detect_even_odd_loop:
    mov ax, [si] ; Load the current element from the original array
    test ax, 1   ; Check if the number is odd (least significant bit is set)
    jz is_even   ; Jump to is_even if the number is even

is_odd:
    ; Odd number - store in the odd numbers array
    mov [bx], ax
    add bx, 2
    jmp next_iteration

is_even:
    ; Even number - store in the even numbers array
    mov [di], ax
    add di, 2

next_iteration:
    add si, 2     ; Move to the next element in the original array

    dec cx ; Decrement the counter
    jnz detect_even_odd_loop ; Loop until all elements are processed

    ; Your even and odd numbers arrays are now populated

    ; Exit the program  
    mov ax, 0x4c00
    int 0x21
