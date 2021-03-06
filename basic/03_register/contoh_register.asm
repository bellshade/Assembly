; compile dengan cara
; nasm -f elf32 -o namafile.o namafile.asm
; ld -m elf_i386 -o namafile namafile.o
; ./namafile

section .text
  global _start

_start:
  mov   edx, len        ; panjang dari pesan
  mov   ecx, msg        ; pesan yang akan di write
  mov   ebx, 1          ; stdout
  mov   eax, 4          ; sys_write
  int   0x80               ; memanggil kernel

  mov   edx, 9          ; panjang pesan
  mov   ecx, s2         ; pesan yang akan di write
  mov   ebx, 1          ; stdout
  mov   eax, 4          ; sys_write
  int   0x80            ; memanggil kernel

  mov   eax, 1          ; sys_exit
  int   0x80            ; memanggil kernel


section .data
msg db 'menampilkan 5 simbol ??', 0xa
len equ $ - msg
s2 times 9 db '?'

