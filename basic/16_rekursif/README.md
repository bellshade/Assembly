# Rekursif

Prosedur rekursif adalah prosedur yang memanggil dirinya sendiri. Ada dua jenis rekursi: langsung dan tidak langsung. Dalam rekursi langsung, prosedur memanggil dirinya sendiri dan dalam rekursi tidak langsung, prosedur pertama memanggil prosedur kedua, yang pada gilirannya memanggil prosedur pertama.
Rekursi dapat diamati dalam berbagai algoritma matematika. Misalnya, pertimbangkan kasus menghitung faktorial suatu bilangan. Faktorial suatu bilangan diberikan oleh persamaan.

Sebagai contoh: faktorial dari 5 adalah 1 x 2 x 3 x 4 x 5 = 5 x faktorial dari 4 dan ini bisa menjadi contoh yang baik untuk menunjukkan prosedur rekursif. Setiap algoritma rekursif harus memiliki kondisi akhir, yaitu, pemanggilan program secara rekursif harus dihentikan ketika kondisi terpenuhi. Dalam kasus algoritma faktorial, kondisi akhir tercapai ketika n adalah 0.

Program berikut menunjukkan bagaimana faktorial n diimplementasikan dalam bahasa assembly. Untuk menjaga agar program tetap sederhana, kita akan menghitung faktorial 3.

```assembly
section .text
    global _start

_start:
    mov bx, 3
    call prosedur_faktorial
    add ax,30h
    mov [faktor], ax

    mov edx, len
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 1
    mov ecx, faktor
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80

prosedur_faktorial:
    cmp bl, 1
    jg kalkulasi
    mov ax, 1
    ret

kalkulasi:
    dec bl
    call prosedur_faktorial
    inc bl
    mul bl      ; ax = al * bl
    ret

section .data
msg db 'faktorial dari 3 adalah ', 0xa
len equ $ - msg

section .bss
faktor resb 1
```
