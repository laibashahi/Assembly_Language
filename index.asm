
; a program to add ten numbers without a separate counter
 [org 0x0100]            
 mov  bx, 0              ; initialize array index to zero        
 mov  ax, 0              ; initialize sum to zero 
 
l1:           
add  ax, [num1+bx]      ; add number to ax            
   add  bx, 2              ; advance bx to next index             
   cmp  bx, 20             ; are we beyond the last index         
   jne  l1                 ; if not add next number 
 
              mov  [total], ax        ; write back sum in memory 
 
              mov  ax, 0x4c00         ; terminate program
			  int  0x21 
 
num1:         dw   10, 20, 30, 40, 50, 10, 20, 30, 40, 50
 total:       dw   0 006 