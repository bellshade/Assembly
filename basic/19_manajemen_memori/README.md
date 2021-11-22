# manajemen memori

sistem ``sys_brk()`` disediakan oleh kernel untuk mengalokasikan memori. panggilan ini mengalokasikan memori tepat dibelakang gambar aplikasi dalam memori. fungsi sistem ini memungkinkan untuk mengatur alamat tertinggi yang terseia di bagian data

panggilan sistem ini mengambil satu parameter yang merupakan alamat memori tertinggi yang perlu ditetapkan. nilai ini disimpan dalam register EBX.

jika terjadi kesalahan ``sys_brk()`` mengembalikan -1 atau mengembalikan kode kesalahan negatif itu sendiri.

contoh
```assembly
section .text
    global _start


_start:
    mov eax, 45 ; sys_brk
    xor ebx, ebx
    int 80h

    add eax, 16384  ; jumlah dari byte yang disediakan
    mov ebx, eax
    mov eax, 45
    int 80h

    cmp eax, 0
    jl exit     ; keluar jika error
    mov edi, eax        ; EDI = address yang paling tinggi
    sub edi, 4          ; mengarah ke DWORD terakhir
    mov ecx, 4096       ; jumlah dword yang dialokasikan
    xor eax, eax        ; clear eax
    std
    rep stosd           ; ulangi untuk seluruh area yang dialokasikan
    cld

    mov eax, 4
    mov ebx, 1
    mov evx, pesan
    mov edx, len
    int 80h
    
exit:
    mov eax, 1
    xor ebx, ebx
    int 80h

sectioon .data
pesan db "alokasi 16 kb dari memori" , 10
len equ $ - pesan
```
ketika kode diatas dikompilasi dan dijalankan maka menghasilkan
```
alokasi  16 kb dari memmori
```
