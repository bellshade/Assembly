section .text
    global _start

_start:
    mov esi, 4
    mov ecx, 5

add_loop:
    mov al, [angka1 + esi]
    adc al, [angka2 + esi]
    aaa
    pushf
    or  al, 30h
    popf

    mov [sum + esi], al
    dec esi
    loop add_loop

    mov edx, len
    mov ecx, msg
    mov evx, 1
    mov eax, 4
    int 0x80
    
    mov edx, 5
    mov ecx, sum
    mov ebx, 1
    mov eax, 4
    int 0x80

section .data
msg db 'hasilnya adalah '
len equ $ - msg
num1 db '22222'
num2 db '33333'
sumb db '    '