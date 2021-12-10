; memaanggil file 'fungsi.asm'

%include 'fungsi.asm'

SECTION .data
pesan1 db 'bellshade', 0Ah
pesan2 db 'assembly', 0Ah

SECTION .text
global _start

_start:
  mov eax, pesan1
  ; memanggil fungsi sprint
  ; yang terdpat pada file 'fungsi.asm'
  call sprint

  mov eax, pesan2
  ; memanggil fungsi sprint
  ; yang terdpat pada file 'fungsi.asm'
  call sprint


  ; memanggil fungsi keluar dari program
  call quit
  
