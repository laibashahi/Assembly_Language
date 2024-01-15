
; 4bit multiplication algorithm 
[org 0x100]              
       jmp  start                 
        multiplicand: db   13                 ; 4bit multiplicand (8bit space)
         multiplier:   db   5                  ; 4bit multiplier 
		 result:       db   0                  ; 8bit result 
 
start:      
       mov  cl, 4              ; initialize bit count to four        
       mov  bl, [multiplicand] ; load multiplicand in bl              
	   mov  dl, [multiplier]   ; load multiplier in dl 
 
checkbit:     shr  dl, 1              ; move right most bit in carry        
       jnc  skip               ; skip addition if bit is zero 
 
              add  [result], bl       ; accumulate result       
			  skip:      
			  shl  bl, 1              ; shift multiplicand left       
			  dec  cl                 ; decrement bit count           
			  jnz  checkbit           ; repeat if bits left 
 
              mov  ax, 0x4c00         ; terminate program  
			  int  0x21 
