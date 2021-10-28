section .text
    global _start

_start:
    ; membuat nama 'jole'
    mov     edx, 9      ; panjang dari pesan
    mov     ecx, nama   ; pesan yang akan ditulis
    mov     ebx, 1      ; stdout
    mov     eax, 5      ; sys_write
    int     0x80        ; memanggil kernel

    mov     [nama], dword   'jolesles'  ; mengganti ke jolesles

    ; membuat nama paraditto
    mov     edx, 8      ; panjang dari pesan
    mov     ecx, nama   ; pesan yang akan ditulis
    mov     ebx, 1      ; stdout
    mov     eax, 4      ; sys_write
    int     0x80        ; memanggil kernel

    mov     eax, 1      ; sys_exit
    int     0x80        ; memanggil kernel

section .data
nama db 'paraditto '