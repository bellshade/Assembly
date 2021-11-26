# Variabel

NASM menyediakan berbagai arahan definisi untuk memesan ruang penyimpanan untuk variabel. Arahan define assembler digunakan untuk alokasi ruang penyimpanan. Hal ini dapat digunakan untuk cadangan serta menginisiliasasi satu, atau lebih byte.

## Mengalokasikan ruang penyimpanan untuk data yang diinisialisasi

Syntax untuk pernyataan alokasi penyimpanan untuk data yang diinisialisasi adalah :

```
[nama-variabel] define-directive    value       [, value]
```
Di mana, __nama-variabel__ adalah pengindentifikasi untuk setiap ruang penyimpanan. Assembler mengaitkan nilai offset untuk setiap nama variabel yang ditentukan dalam segmen data.

Ada lima bentuk dasar direktif define, yaitu :

- ``DB``
    Menentukan byte dengan mengalokasikan ruang penyimpanan 1 byte.

- ``DW``
    Mendefinisikan kata dengan mengalokasikan ruang penyimpanan 2 byte.

- ``DD``
    Mendefinisikan kata ganda dengan mengalokasikan ruang penyimpanan 4 byte.

- ``DQ``
    Medefinisikan __quadword__ dengan mengalokasikan ruang penyimpanan 8 byte.

- ``DT``
    Menentukan 10 bytes dengan alokasi penyimpanan 10 byte.


Berikut contoh penggunaan define directive :

```assembly
CHOICE           DB  'a'
angka            DW  21345689
negatif          DW -1234521
angka_besar      DQ  1235612741
pecahan          DD  3.14
pecahan2         DA  3.25131
```

note:

- Setiap byte karakter disimpan sebagai nilai **ASCII** dalam __heksadesimal__.
- Setiap nilai desimal secara otomatis dikonversi ke setara biner 16-bit dan disimpan sebagai angka __heksadesimal__.
- Processor menggunakan urutan byte __littel-endian__.
- Bilangan negatif diubah menjadi representasi komplemen 2-nya.
- Angka floating point pendek, dan panjang diwakili masing-masing menggunakan 32, atau 6 bit.

Contoh program yang menggunakan directive define :

```assembly
section .text
    global _start

_start:
    mov     edx, 1              ; panjang dari pesan
    mov     ecx, huruf          ; pesan yang akan ditulis
    mov     ebx, 1              ; stdout
    mov     eax, 4              ; sys_write
    int0x80                     ; memanggil kernel
    mov     eax,1               ; sys_exit
    int0x80                     ; memanggil kernel

section .data
huruf DB 'a'
```
Kompilasi dengan cara :
```bash
nasm -f elf32 -o namafile.o namafile.asm
ld -m elf_i386 -o namafile namafile.o
./namafile
```