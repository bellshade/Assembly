# Makro

menulis makro adalah cara lain untuk mamastikan pemograman modular dalam bahasa assembly

- makro adalah urutan instruksi, diberi nama dan dapat digunakan di mana saja dalam program.
- di NASM, makro didefinisikan dengan arahan ``%macro`` dan ``%endmacro``
- makro dimulai dengan direktif ``%macro`` dan diakhiri dengan direktif ``%endmacro``

contoh
```assembly
%macro nama_makro   jumlah_parameter
; isi dari makri
%endmacro
```

dimana __jumlah_parameter__ menentukan parameter angka, __nama_makro__ menentukan dari nama makro

Makro dipanggil dengan menggunakan nama makro bersama dengan parameter yang diperlukan. Saat Anda perlu menggunakan beberapa urutan instruksi berkali-kali dalam sebuah program, Anda dapat meletakkan instruksi tersebut di makro dan menggunakannya alih-alih menulis instruksi sepanjang waktu.

Misalnya, kebutuhan yang sangat umum untuk program adalah menulis string karakter di layar. Untuk menampilkan serangkaian karakter, Anda memerlukan urutan instruksi berikut

```assembly
mov edx, len
mov ecx, msg
mov ebx, 1
int 0x80
```
Dalam contoh di atas menampilkan string karakter, register EAX, EBX, ECX dan EDX telah digunakan oleh pemanggilan fungsi INT 80H. Jadi, setiap kali Anda perlu menampilkannya di layar, Anda perlu menyimpan register-register ini di stack, memanggil INT 80H dan kemudian mengembalikan nilai asli register dari stack. Jadi, akan berguna untuk menulis dua makro untuk menyimpan dan memulihkan data.

contoh berikut cara menggunakan makro pada assembly
```assembly
%macro tulis_string 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

section .text
    global _start

_start
    tulis_string pesan1, len1
    tulis_string pesan2, len2
    tilis_string pesan3, len3

    mov eax, 1
    int 0x80

section .data
pesan1 db 'assembly bellshade', 0xA, 0xD
len1 equ $ - pesan1

pesan2 db 'bellshade', 0xA, 0xD
len2 equ $ - pesan2

pesan3 db 'assembly bellshade', 0xA, 0xD
len3 equ $ - pesan3
```
mengeluarkan output berupa
```
assembly bellshade
bellshade
assembly bellshade
```
