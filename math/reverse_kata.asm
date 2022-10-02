org 100h


.data 
take db "Masukkan kata ","$"
give db 0dh,0ah,"Hasil : ","$" 
counter db 0
s1 db 0
s2 db 0
s3 db 0
s4 db 0
s5 db 0

str1 db 20 dup("$")
str2 db 20 dup("$")
str3 db 20 dup("$")
str4 db 20 dup("$")
str5 db 20 dup("$")

.code

    mov ax,@data
    mov ds,ax
    
    mov ah,9
    mov dx,offset take
    int 21h 
    xor cx,cx
string:
    mov bx,0 
   
    mov ah,1
    int 21h
    cmp al,32
    je store1
    cmp al,0dh
    je store5
    
    push ax
    inc cx
    jmp string

Store1:
    cmp s1,0
    jnz Store2

Store11: 
    inc s1
    pop ax
    mov str1[bx],al 
    inc bx

    loop Store11
    jmp string
    
Store2:

    cmp s2,0
    jnz Store3

Store22: 
    
    inc s2
    pop ax
    mov str2[bx],al 
    inc bx

    loop Store22       
    jmp string            
                
Store3:

    cmp s3,0
    jnz Store4

Store33: 
    
    inc s3
    pop ax
    mov str3[bx],al 
    inc bx

    loop Store33                
    jmp string   
       
       
Store4:

    cmp s4,0
    jnz Store5

Store44: 
    
    inc s4
    pop ax
    mov str4[bx],al 
    inc bx

    loop Store44
    jmp string
    
   

Store5: 
    
    inc s5
    pop ax
    mov str5[bx],al 
    inc bx

    loop Store5           
       
Print:
  
    mov ah,9
    mov dx,offset give
    int 21h

    cmp s1,0
    je d2   
    mov ah,9  
    mov dx,offset str1
    int 21h
    
    mov ah,2
    mov dl,32
    int 21h

d2:    
    cmp s2,0
    je d3
    mov ah,9  
    mov dx,offset str2
    int 21h

d3:
    cmp s3,0
    je d4
    mov ah,2
    mov dl,32
    int 21h
    mov ah,9  
    mov dx,offset str3
    int 21h

d4:
    cmp s4,0
    je d5 
    mov ah,2
    mov dl,32
    int 21h
    mov ah,9 
    mov dx,offset str4
    int 21h

d5:
    cmp s5,0
    je exit
    mov ah,2
    mov dl,32
    int 21h  
    mov ah,9
    mov dx,offset str5
    int 21h

exit:
    ret 