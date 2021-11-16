# Array

sebelumnya telah membahas bahwa arahan definisi data ke assembler digunakan untuk mengalokasikan penyimpanan untuk variabel. Variabel juga dapat diinisialisasi dengan beberapa nilai tertentu. Nilai yang diinisialisasi dapat ditentukan dalam bentuk heksadesimal, desimal atau biner.

Misalnya, kita dapat mendefinisikan variabel kata 'bulan' dengan salah satu cara berikut
```assembly
BULAN DW 12
BULAN DW 0CH
BULAN DW 0110B
```

arahan definisi data juga dapat digunakan untuk mendifinisikan array satu dimensi.
```assembly
ANGKA DW 34, 45 ,56, 67, 75M 88
```
dengan ini kita mengaloksikan 2x16 = 12 byte ruang memori berurutan. Alamat simbolis dari nomor pertama adalah ANGKA dan nomor kedua adalah ANGKA + 2 dan seterusnya.

Mari kita ambil contoh lain. Anda dapat mendefinisikan sebuah array bernama inventory ukuran 8, dan menginisialisasi semua nilai dengan nol, sebagai

```assembly
INVENTORY   DW  0
            DW  0
            DW  0
            DW  0
            DW  0
            DW  0
            DW  0
            DW  0
```

yang bisa juga disingkat dan diserdehanakan berupa
```assembly
INVENTORY   DW  0, 0 , 0 , 0 , 0 , 0 , 0 , 0
```

Arahan TIMES juga dapat digunakan untuk beberapa inisialisasi ke nilai yang sama. Menggunakan TIMES, array INVENTORY dapat didefinisikan sebagai:

```assembly
INVENTORY TIMES 8 DW 0
```

contoh menunjukkan konsep dengan mendifinisikan array 3 elemen x yang menyimpn 3 nilai, 2 ,3 dan 4 ini menambahkn nilai dalam array dan menampilkan jumlah 9

```assembly
section .text
    global _start

_start:

    mov eax, 3
    mov ebx, 3
    mov ecx, x

top: add ebx, [ecx]

    add ecx 1 ; pindah pointer ke elemen berikutnya
    dec eax eax
    jnz top ; jika counternya tidak 0 maka looping lagi

done:
    
    add ebx, '0'
    mov [sum], ebx ; hasil semua disimpan dalam sum

display:

    mov edx, 1
    mov ecx, sum
    mov ebx, 1
    mob eax, 4
    int 0x80

section .data
global x
x:
    db 2
    db 4
    db 3

sum:
    db 0
```
