; contoh program perpangkat dengan assembly 8086

power macro n,p 
    push p 
    cmp p,01h
    je display
    cmp p,00h
    je display
    mov ax,n 
    dec p 
    mov cx,p
multi:
    mul n    
loop multi 
    mov result,ax
    jmp display
 
power endm

org 100h

.data
TakeN db 13,10,"Masukkan angka : ","$"  
TakeP db 13,10,"Masukkan perpangkatan : ","$"
arrow db 13,10,13,10,"==> ","$"
Last  db " Perpangkatan ","$"
Lastis db " adalah ","$"   
num dw ?
pow dw ? 
result dw ? 
pro dw 10

.code    
main proc
    mov ah,9
    lea dx, TakeN
    int 21h
    
    mov ah,1
    int 21h 
    
inputN:
    cmp al,13
    je input12
    and al,0fh
    push ax    
    
    mov ax,num
    mul pro     
    mov num, ax  
    pop dx     
    mov dh, 0
    add num, dx
    
    mov ah,1
    int 21h
    jmp inputN    
 
input12:    
    mov ah,9
    lea dx, TakeP
    int 21h
    
    mov ah,1
    int 21h  
inputP:
    cmp al,13
    je calc
    and al,0fh
    push ax    
    
    mov ax,pow
    mul pro   
    mov pow, ax  
    pop dx     
    mov dh, 0
    add pow, dx
    
    mov ah,1
    int 21h
    jmp inputP  

calc:    
    power num,pow  

display:    
    mov ah,9
    lea dx, arrow  
    int 21h
    
    
    mov ax,num
    mov bx,10
    xor cx,cx 
         
againN:  
    xor dx,dx      
    div bx 
    push dx
    inc cx
    cmp ax,0
    jne againN
             
    mov ah,2
     
printN:
    pop dx
    or dl,30h
    int 21h
loop printN 
    
    mov ah,9
    lea dx, Last
    int 21h
    
    pop pow
    mov ax,pow
    mov bx,10 
         
againP:  
    xor dx,dx      
    div bx 
    push dx
    inc cx
    cmp ax,0
    jne againP
             
    mov ah,2
     
printP:
    pop dx
    or dl,30h
    int 21h
loop printP 
    
    mov ah,9
    lea dx, Lastis
    int 21h
    
    cmp pow,1
    je print1
    cmp pow,0
    je print0
    
    mov ax,result
    mov bx,10 
         
again:  
    xor dx,dx      
    div bx 
    push dx
    inc cx
    cmp ax,0
    jne again
             
    mov ah,2
     
print:
    pop dx
    or dl,30h
    int 21h
loop print 
    mov ax,result
ret

print1: 
    add num,30h
    mov ah,2
    mov dx,num
    int 21h
    mov ax,num 
ret         

print0:
    mov ah,2
    mov dx,'1'
    int 21h    
    mov ax,1
ret    
main endp