SYS_EXIT        EQU     1
SYS_WRITE       EQU     4
STDIN           EQU     0
STDOUT          EQU     1

section .text
  global _start

_start:
  mov   eax,    SYS_WRITE
  mov   ebx,    STDOUT
  mov   ecx,    pesan1
  mov   edx,    panjang_pesan1
  int   0x80

  mov   eax,    SYS_WRITE
  mov   ebx,    STDOUT
  mov   ecx,    pesan2
  mov   edx,    panjang_pesan2
  int   0x80

  mov   eax,    SYS_WRITE
  mov   ebx,    STDOUT
  mov   ecx,    pesan3  
  mov   edx,    panjang_pesan3
  int   0x80

  mov   eax, SYS_EXIT
  int   0x80

section .data
pesan1 db       'indonesia raya', 0xA, 0xD
panjang_pesan1 equ $ - pesan1

pesan2 db       'merdeka merdeka', 0xA, 0xD
panjang_pesan2 equ $ - pesan2

pesan3 db        'hiduplah indonesia raya'
panjang_pesan3 equ $ - pesan3