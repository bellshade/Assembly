%macro tulis_string 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

section .text
    global _start

_start
    tulis_string pesan1, len1
    tulis_string pesan2, len2
    tilis_string pesan3, len3

    mov eax, 1
    int 0x80

section .data
pesan1 db 'assembly bellshade', 0xA, 0xD
len1 equ $ - pesan1

pesan2 db 'bellshade', 0xA, 0xD
len2 equ $ - pesan2

pesan3 db 'assembly bellshade', 0xA, 0xD
len3 equ $ - pesan3