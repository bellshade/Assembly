# variabel

NASM menyediakan berbagai arahan definisi untuk memesan ruang penyimpanan untuk variabel. arahan define assembler digunakan untuk alokasi ruang penyimpanan. hal ini dapat digunakan untuk cadangan serta menginisiliasasi satu atau lebih byte.

## mengalokasikan ruang penyimpanan untuk data yang diinisialisasi

sintaks untuk pernyataan alokasi penyimpanan untuk data yang diinisialisasi adalah

```
[nama-variabel] define-directive    value       [, value]
```
di mana, __nama-variabel__ adalah pegindentifikasi untuk setipa ruang penyimpanan. assembler mengaitkan nilai offset untuk setiap nama variabel yang ditentukan dalam segmen data.

ada lima bentuk dasar direktif define

- ``DB``
    menentukan byte dengan mengalokasikan ruang penyimpanan 1 byte

- ``DW``
    mendefinisikan kata dengan mengalokasikan ruang penyimpanan 2 byte

- ``DD``
    mendefinisikan kata ganda dengan mengalokasikan ruang penyimpanan 4 byte

- ``DQ``
    medefinisikan __quadword__ dengan mengalokasikan ruang penyimpanan 8 byte

- ``DT``
    menentukan 10 bytes dengan alokasi penyimpanan 10 byte


berikut contoh penggunaan define directive
```assembly
CHOICE           DB  'a'
angka            DW  21345689
negatif          DW -1234521
angka_besar      DQ  1235612741
pecahan          DD  3.14
pecahan2         DA  3.25131
```

note:

- setiap byte karakter disimpan sebagai nilai **ASCII** dalam __heksadesimal__
- setiap nilai desimal secara otomatis dikonversi ke setara biner 16-bit dan disimpan sebagai angka __heksadesimal__
- processor menggunakan urutan byte __littel-endian__
- bilangan negatif diubah menjadi representasi komplemen 2-nya
- angka floating point pendek dan panjang diwakili masing-masing menggunakan 32 atau 6 bit

contoh program yang menggunakan directive define 

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
kompilasi dengan cara
```bash
nasm -f elf32 -o namafile.o namafile.asm
ld -m elf_i386 -o namafile namafile.o
./namafile
```