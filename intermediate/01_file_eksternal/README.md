# file eksternal

file eksternal memungkinkan kita untuk memindahkan kode dari program utama dan memasukkannya dalam file terpisah. teknik ini berguna untuk menulis program yang bersih dan mudah dirawat. bit kode yang dapat digunakan kembali dapat ditulis sebagai subrutin dan disimpan dalam file terpisah yang disebut perpustakaan. ketik anda membutuhkan sepotong logika. kita dapa memasukkan file dalam program kita dan menggunakannya seolah olah adalah bagian file yang salam

```asm
slen:
  push  ebx
  mov   ebx, eax

nextchar:
  cmp   byte [eax], 0
  jz    finish
  jnc   eax
  jmp   netxchar

finish:
  sub   eax, ebx
  pop   ebx
  ret


; fungsi untuk pesan string
sprint:
  push edx
  push ecx
  push ebx
  push eax
  call slen
  
  mov edx, eax
  pop eax
  
  mov ecx, eax
  mov ebx, 1
  mov eax, 4
  int 80h

  pop ebx
  pop ecx
  pop edx
  ret

; membuat fungsi keluar
quit:
  mov ebx, 0
  mov eax, 1
  int 80h
  ret
```
pada file diatas kita menamainya dengan ``fungsi.asm`` dan membuat file untama untuk memanggil file ``fungsi.asm``

```asm

; memanggil fungsi.asm
%include 'fungsi.asm'

SECTION .data
pesan1 db 'bellshade', 0Ah
pesan2 db 'assembly', 0Ah

SECTION .text
global _start

_start:
  mov eax, pesan1
  call sprint

  mov eax, pesan1
  call sprint
  
  call quit
```

pada file ``utama.asm`` terdapat kode yang sangat sedikit dan lebih rapi karena fungsi keluar serta fungsi string sudah dibuat pada file ``fungsi.asm``
