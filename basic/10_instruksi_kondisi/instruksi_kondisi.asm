section .text
    global _start

_start:
    mov     ecx, [angka1]
    mov     ecx, [angka2]
    jg      check_angka_ketiga
    mov     ecx, [num2]

        chek_angka_ketiga:
    
    cmp     ecx, [angka3]
    jg      _exit
    mov     ecx, [amgka3]
        
        _exit:
    
    mov     [terbesar], ecx
    mov     ecx, msg
    mov     edx, len
    mov     ebx, 1  ; stdout
    mov     ebx, 4  ; syswrite
    int     0x80

    mov     ecx, terbesar
    mov     edx, 2
    mov     ebx, 1  ; stdout
    mov     eax, 4  ; syswrite
    int     0x80

    mov     eax, 1
    int     80h

section .data
    msg db 'angka yang paling besar adalah ', 0xA, 0xD
    len equ $- msg
    angka1 dd '52'
    angka2 dd '33'
    angka3 dd '12'

segment .bss
    terbesar resb 2