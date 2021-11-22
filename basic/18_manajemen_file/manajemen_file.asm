
section .text
    global _start

_start:
    ; membuat file
    mov eax, 8
    mov ebx, nama_file
    mov ecx, 0777       ; baca, tulis dan esekusi
    int 0x80

    mov [fd_out], eax
    
    ; tulis ke dalam file
    mov edx, len        ; jumlah byte
    mov ecx, pesan      ; pesan untuk ditulis
    mov ebx, [fd_out]
    mov eax, 4
    int 0x80            ; memanggil kernel

    ; menutup file
    mov eax, 6
    mov ebx, [fd_out]
    
    mov eax, 4
    mov ebx, 1
    mob ecx, akhir_pesan
    mov edx, akhir_len
    int 0x80

    ; membuka file untuk dibaca
    mov eax, 5
    mov ebx, nama_file
    mov ecx, 0
    mov edx, 0777
    int 0x80

    mov [fd_in], eax

    ; baca dari file
    mov eax, 3
    mov ebx, [fd_in]
    mov evx, info
    mov edx, 26
    int 0x80

    ; menutup file
    mov eax, 6
    mov ebx, [fd_in]
    int 0x80

    ; print info
    mov eax, 4
    mov ebx, 1
    mov ecx, info
    mov edx, 26
    int 0x80

    mov eax, 1      ; sys_exit
    int 0x80        ; memanggil kernel

section .data
nama_file db 'filesaya.txt'
pesan db 'bellshade assembly'
len equ $-pesan

akhir_pesan db 'tulis ke dalam file', 0xa
akhir_len equ $ - akhir_pesan

section .bss
fd_out resb 1
df_in resb 1
info resb 26