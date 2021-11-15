; compile dengan cara
; nasm -f elf32 -o namafile.o namafile.asm
; ld -m elf_i386 -o namafile namafile.o
; ./namafile

section .text
    global _start       ; wajib deklarasi untuk linker atau ld


_start:                 ; memberi info dari titik masuk linker
    mov    edx, len     ; deklarasi panjang dari message atau pesan
    mov    ecx, msg     ; deklarasi register pesan yang akan di tulis
    mov    ebx, 1       ; deklarasi stdout
    mov    eax, 4       ; sistem dari sys_write untuk iniliasi perintah atau biasa disebut nomor panggilan sistem
    int    0x80         ; memanggil kernel untuk melakukan perintah diatas

    mov    eax, 1       ; sistem dari sys_swrite untuk iniliasi perintah atau biasa disebut nomor panggilan sistem
    int    0x80         ; memanggil kernel untuk melakukan perintah diatas

section .data
msg     db      'bellshade',    0xa     ; pesan yang akan di print
len     equ     ls$ -msg      ; membaca panjang dari string 'bellsahde'