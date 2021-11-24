# Adressing Mode

Kebanyakan instruksi bahasa assembly membutuhkan operand untuk diproses. Alamat operand menyediakan lokasi, dimana data yang akan diproses disimpan. Beberapa instruksi tidak memerlukan operan, sedangkan beberapa instruksi lain mungkin memerlukan atau, dua, atau tiga operand.

Ketika sebuah instruksi membutuhkan dua operan, operand pertama ummumnya adalah tujuan, yang berisi data dalam register atau lokasi memori, dan operan kedua adalah sumbernya. Sumber yang berisi data yang akan dikirim (pengalamatan langsung), atau alamat (dalam register, atau memori) data. Umumnya, data sumber tetap tidak berubah setelah operasi.

Ada tiga mode dasar addressing mode adalah :

1. Alamat register
2. Pengelamatan langsung
3. Pengelamatan memori

## Daftar Alamat

Dalam mode pengelamatan ini, sebuah register berisi operan. Tergantung pada instruksinya, register dapat berupa operand pertama, operan kedua, atau keduanya.

Sebagai contoh :

```assembly
mov     DX, hitung_hasil        ; register pada operan pertama.
mov     COUNT, CX               ; register pada operan kedua.
mov     EAX, EBX                ; Kedua operan dalam register.
```
Karena pemrosesan data antar register tidak melibatkan memori, ini menyediakan pemrosesan data tercepat.

## Alamat Langsung

Operand langsung memiliki nilai konsisten atau ekspresi. Ketika sebuah instruksi dengan dua memori, dan operand kedua adalah konstanta langsung. Operand pertama mendefinisikan panjang data.

Sebagai contoh :

```assembly
BYTE_VALUE      DB  150     ; value byte yang sudah dibuat.
WORD_VALUE      DW  300     ; value huruf yang sudah dibuat.
ADD     BYTE_VALUE, 65      ; operan yang langsung ditambahkan 65.
MOV             AX, 45      ; konstanta langsung 45H ditransfer ke AX.
```

## Direct Addressing Memori

Ketika operand ditentukan dalam mode direct addressing memory, akses langsung ke memori utama, biasanya ke segmen data diperlukan. Cara addressing ini menghasilkan pemrosesan data yang lebih lambat. Untuk menemukan lokasi yang tepat dari data dalam memori, kita memerlukan alamat awal segmen, yang biasanya ditemukan di register DS, dan nilai offset. Nilai offset ini juga disebut alamat efektif (**effective adressing**).

Dalam mode __direct addressing memmory__, nilai offset ditentukan secara langsung sebagai bagian dari instruksi, biasanya ditunjukkan dengan nama variabel. Assembler menghitung nilai offset, dan memelihara tabel simbol, yang menyimpan nilai offset dari semua variabel yang digunakan dalam program.

Dalam direct addressing memori, salah satu operan merujuk ke lokasi memori, dan operan lainnya merujuk ke register.

Sebagai contoh :

```assembly
ADD     BYTE_VALUE, DL      ; Menambahkan register ke dalam register memori.
MOV     BX, WORD_VALUE      ; Operand dari memori telah ditambahkan ke dalam register.
```

## Direct Offset Addressing

Mode ini menggunakan operator aritmatika untuk megubah alamat. Misalnya, lihat definisi berikut yang mendifinisikan tabel angka : 

```assembly
BYTE_TABLE      DB  14, 15, 22, 45          ; Tabel dari byte.
WORD_TABLE      DW  134, 345, 564, 123      ; Tabel dari huruf.
```

Operasi berikut mengakses data dari tabel di memori ke dalam register :

```assembly
MOV CL, BYTE_TABLE[2]       ; Ambil element ketiga dari BYTE_TABLE.
MOV CL, BYTE_TABLE + 2      ; Ambil element ketiga dari BYTE_TABLE.
MOV CX, WORD_TABLE[1]       ; Ambil element kedua dari WORD_TABLE.
MOV CX, WORD_TABLE + 3      ; Ambil element keempat dari.WORD_TABLE
```

## Indirect Memmory Addressing

Mode ini memanfaatkan kemampuan komputer untuk addressing, __segment: offset__. Umumnya, register dasar EBX, EBP (atau BX, BP), dan register index (DI, SI), dikodekan dalam tanda kurung siku untuk referensi memori, digunakan untuk tujuan ini.

Indirect addressing tidak langsung umumnya digunakan untuk variabel yang mengandung beberapa elemen seperti array, alamat awal array yang disimpan, katakanlah, register EBX.

Contoh kode berikut menunjukkan cara mengakses berbagai elemen variabel :

```assembly
TABEL_SAYA TIMES 10 DW 0        ; Alokasi 10 WORD (2 byte).
MOV EBX, [TABEL_SAYA]           ; Effective addresing dari TABEL_SAYA.
MOV [EBX], 110                  ; TABEL_SAYA[0] = 110
ADD EBX, 2                      ; EBX = EBX + 2
MOV [EBX], 123                  ; TABEL_SAYA[1] = 123
```

## Instruksi MOV

Kita telah menggunakan instruksi ``MOV``yang digunakan untuk memindahkan data dari satu ruang penyimpanan ke ruang penyimpanan lainnya, instruksi ``MOV`` membutuhkan dua operand.
Contohnya :

```assebmly
MOV     TUJUAN, SUMBER
```

Instruksi mungkin memiliki salah satu dari lima bentuk berikut :

```
MOV register, register
MOV register, immediate
MOV memori, immediate
MOV register, memori
MOV memori, register
```

Noted:
- Kedua operan dalam operasi mov harus berukuran sama.
- Nilai operan sumber tetap tidak berubah.

Instruksi MOV terkadang menyebabkan ambiguitas. Sebagai contoh, perhatikan contoh kode dibawah ini :

```assembly
MOV EBX, [TABEL_SAYA]       ; Effective address dari TABEL_SAYA di EBX.
MOV [EBX], 110              ; TABEL_SAYA[0] = 110
```

Tidak jelas apakah kamu ingin memindahkan __byte__ yang setara atau setara kata dengan angka ``110``, dalam kasus ini, sebaiknya menggunakan **type specifier**.

Tabel berikut menunjukkan beberapa penentu tipe umum, yaitu :

| **type specifier**        | **byte yang ditunjukkan** |
| -------------             |:-------------------------:|
| BYTE                      | 1                         |
| WORD                      | 2                         |
| DWORD                     | 4                         |
| QWORD                     | 8                         |
| TBYTE                     | 10                        |


Contoh :
Program berikut mengilustrasikan beberapa konsep yang dibahas diatas, menyimpan nama '**jole**' di bagian data memori, kemudian mengubah nilainya menjadi nama lain '**jolesles**', secara terpogram, dan menampilkan kedua nama tersebut.

```assembly
section .text
    global _start

_start:
    ; Membuat nama 'jole'
    mov     edx, 9      ; Panjang dari pesan.
    mov     ecx, nama   ; Pesan yang akan ditulis.
    mov     ebx, 1      ; stdout.
    mov     eax, 5      ; sys_write.
    int     0x80        ; Memanggil kernel.

    mov     [nama], dword   'jolesles'  ; Mengganti ke jolesles.

    ; Membuat nama paraditto
    mov     edx, 8      ; Panjang dari pesan.
    mov     ecx, nama   ; Pesan yang akan ditulis.
    mov     ebx, 1      ; stdout.
    mov     eax, 4      ; sys_write.
    int     0x80        ; Memanggil kernel.

    mov     eax, 1      ; sys_exit.
    int     0x80        ; Memanggil kernel.

section .data
nama db 'paraditto '
```

Dengan merakit dan menjalankannya :

```bash
nasm -f elf32 -o namafile.o namafile.asm
ld -m elf_i386 -o namafile namafile.o
./namafile
```