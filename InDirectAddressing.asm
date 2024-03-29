
; a program to add three numbers using indirect addressing 
            [org 0x100]          
             mov  bx, num1           ; point bx to first number   
            mov  ax, [bx]           ; load first number in ax    
			add  bx, 2              ; advance bx to second number 
			   add  ax, [bx]           ; add second number to ax
               add  bx, 2              ; advance bx to third number  
			   add  ax, [bx]           ; add third number to ax      
			   add  bx, 2              ; advance bx to result          
			   mov  [bx], ax           ; store sum at num1+6           
			   mov  ax, 0x4c00         ; terminate program             
			   int  0x21 
 
num1:         dw   5, 10, 15, 0 