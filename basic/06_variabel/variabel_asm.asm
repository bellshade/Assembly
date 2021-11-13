; contoh penerapan variabel dari assembly
; compile dengan cara
; nasm -f elf32 -o namafile.o namafile.asm
; ld -m elf_i386 -o namafile namafile.o
; ./namafile

section .text
    global _start

_start:
    mov     edx, 1              ; panjang dari pesan
    mov     ecx, huruf          ; pesan yang akan ditulis
    mov     ebx, 1              ; stdout
    mov     eax, 4              ; sys_write
    int     0x80                ; memanggil kernel

    mov     eax,1               ; sys_exit
    int     0x80                ; memanggil kernel

section .data
huruf DB 'a'