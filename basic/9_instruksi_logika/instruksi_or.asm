section .text
   global _start           
	
_start:                     
   mov    al, 5            
   mov    bl, 3            
   or     al, bl             
   add    al, byte '0'      
	
   mov    [result],  al
   mov    eax, 4
   mov    ebx, 1
   mov    ecx, result
   mov    edx, 1 
   int    0x80
    
outprog:
   mov    eax,1             
   int    0x80              
	
section    .bss
result resb 1