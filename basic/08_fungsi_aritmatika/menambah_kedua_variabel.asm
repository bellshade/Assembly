section .text
    global _start

_start:
    mov     eax, '3'
    sub     eax, '0'
    
    mov     ebx, '1'
    sub     ebx, '0'
    add     eax, ebx
    add     eax, '0'
    

    mov     [hasil], eax
    mov     ecx, pesan
    mov     edx, panjang_pesan
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    mov     ecx, hasil
    mov     edx, 1
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    mov     eax, 1
    int     0x80

section .data
    pesan db    'hasil dari 3 + 1 adalah', 0xA, 0xD
    panjang_pesan equ     $ - pesan
    segment .bss
    hasil resb 1