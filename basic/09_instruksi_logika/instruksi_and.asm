section .text
    global _start

_start:
    mov ax, 8h
    and ax, 1
    jz  evnn
    mov eax, 4
    mov ebx, 1
    mov ecx, odd_msg
    mov edx, len2
    int 0x80
    jmp outprog

evnn:
    mov ah, 09h
    mov eax, 4
    mov ebx, 1
    mov ecx, even_msg
    mov edx, len1
    int 0x80

outprog:
    mov eax, 1
    int 0x80

section .data
even_msg db 'bilangan genap'
len1 equ $ - even_msg

odd_msg db 'bilangan ganjil'
len2 equ $ - odd_msg