 
; bubble sort subroutine taking parameters from stack
 [org 0x0100]                                    
 jmp start 
 
data:         dw   60, 55, 45, 50, 40, 35, 25, 30, 10, 0
data2:        dw   328, 329, 898, 8923, 8293, 2345, 10, 877, 355, 98     
              dw   888, 533, 2000, 1020, 30, 200, 761, 167, 90, 5 
swapflag:       db   0 
 
bubblesort:   push bp                 ; save old value of bp   
            mov  bp, sp             ; make bp our reference point         
			push ax                 ; save old value of ax             
			push bx                 ; save old value of bx             
			push cx                 ; save old value of cx              
			push si                 ; save old value of si 
 
              mov  bx, [bp+6]         ; load start of array in bx           
			  mov  cx, [bp+4]         ; load count of elements in cx        
			  dec  cx                 ; last element not compared               
			  shl  cx, 1              ; turn into byte count 
 
mainloop:     mov  si, 0              ; initialize array index to zero        
              mov  byte [swapflag], 0 ; reset swap flag to no swaps 
 
innerloop:  
             mov  ax, [bx+si]        ; load number in ax   
            cmp  ax, [bx+si+2]      ; compare with next number 
			jbe  noswap             ; no swap if already in order 
 
              xchg ax, [bx+si+2]      ; exchange ax with second number          
			  mov  [bx+si], ax        ; store second number in first              
			  mov  byte [swapflag], 1 ; flag that a swap has been done 
 
noswap:      
            add  si, 2              ; advance si to next index      
         cmp  si, cx             ; are we at last index             
		 jne  innerloop          ; if not compare next two    

            cmp  byte [swapflag], 1 ; check if a swap has been done        
			je   mainloop           ; if yes make another pass  
 
              pop  si                 ; restore old value of si           
			  pop  cx                 ; restore old value of cx         
			  pop  bx                 ; restore old value of bx          
			  pop  ax                 ; restore old value of ax           
			  pop  bp                 ; restore old value of bp            
			  ret  4                  ; go back and remove two params 
 
start:        mov  ax, data              
  push ax                 ; place start of array on stack    
  mov  ax, 10             
  push ax                 ; place element count on stack        
  call bubblesort         ; call our subroutine 
 
              mov  ax, data2           
			  push ax                 ; place start of array on stack    
			  mov  ax, 20          
			  push ax                 ; place element count on stack  
			  call bubblesort         ; call our subroutine again 
 
              mov  ax, 0x4c00         ; terminate program             
			  int  0x21 
		 