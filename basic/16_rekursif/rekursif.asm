section .text
    global _start

_start:
    mov bx, 3
    call prosedur_faktorial
    add ax,30h
    mov [faktor], ax

    mov edx, len
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 1
    mov ecx, faktor
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80

prosedur_faktorial:
    cmp bl, 1
    jg kalkulasi
    mov ax, 1
    ret

kalkulasi:
    dec bl
    call prosedur_faktorial
    inc bl
    mul bl      ; ax = al * bl
    ret

section .data
msg db 'faktorial dari 3 adalah ', 0xa
len equ $ - msg

section .bss
faktor resb 1