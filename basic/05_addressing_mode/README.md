# adressing mode

kebanyakan instruksi bahasa assembly membutuhkan operand untuk diproses. alamat operan menyediakan lokasi, di mana data yang akan diproses disimpan. Beberapa instruksi tidak memerlukan operan, sedangkan beberapa instruksi lain mungki memerlukan stau, dua atau tiga operan.

ketika sebuah instruksi membutuhkan dua operan, operan pertama ummumnya adalah tujuan,yang berisi data dalam register atau lokasi memori dan operan kedua adalah sumbernya.  sumber yang berisi data yang akan dikirim (pengelamatan langsung) atau alamat (dalam register atau memori) data. umumnya, data sumber tetap tidak berubah setelah operasi.

ada tiga mode dasar addressing mode adalah:

1. alamat register
2. pengelamatan langsung
3. pengelamatan memori

## daftar alamat

dalam mode pengelamatan ini, sebuah registerberisi operan. tergantung pada instruksinya, register dapat berupa operan pertama, operan kedua atau keduanya

sebagai contoh

```assembly
mov     DX, hitung_hasil        ; register pada operan pertama
mov     COUNT, CX               ; register pada operan kedua
mov     EAX, EBX                ; kedua operan dalam register
```
karena pemrosesan data antar register tidak melibatkan memori, ini menyediakan pemgrosesan data tercepat

## alamat langsung

operand langsung memiliki nilai konsisten atau ekspresi. ketika sebuah instruksi dengan dua memori, dan operan kedua adalah konstanta langsung. operand pertama mendefinisikan panjang data.

sebagai contoh
```assembly
BYTE_VALUE      DB  150     ; value byte yang sudah di buat
WORD_VALUE      DW  300     ; value huruf yang sudah di buat
ADD     BYTE_VALUE, 65      ; operan yang langsung ditambahkan 65
MOV             AX, 45      ; konstanta langsung 45H ditransfer ke AX
```

## direct addressing memori

ketika operan ditentukan dalam mode direct addressing memory, akses langsung ke memori utama, biasanya ke segmen data, diperlukan. cara adressing ini menghasilkan pemrosesan data yang lebih lambat. untuk menemukan lokasi yang tepat dari data dalam memori, kita memerlukan alamat awal segmen, yang biasanya ditemukan di register DS, dan nilai offset. nilai offset ini juga disebut alamat efektif (**effective adressing**)

dalam mode __direct addressing memmory__, nilai offset ditentukan secar alangsung sebagai bagian dari instruksi, biasanya ditunjukkan dengan nama variabel. assembler meghitung nilai offset dan memelihara tabel simbol, yang menyimpan nilai offset dari semua variabel yang digunakan dalam program.

dalam direct addressing memori, sala satu operan merujuk ke lokasi memori dan operan lainnya merujuk ke register.

sebagai contoh
```assembly
ADD     BYTE_VALUE, DL      ; menambahkan register ke dalam register memori
MOV     BX, WORD_VALUE      ; operan dari memori telah ditambahkan ke dalam register
```

## direct offset addressing

mode ini menggunakan operator aritmatika untuk megubah alamat. misalnya, lihat definisi berikut yang mendifinisikan tabel angka
```assembly
BYTE_TABLE      DB  14, 15, 22, 45          ; tabel dari byte
WORD_TABLE      DW  134, 345, 564, 123      ; tebel dari huruf
```

operasi berikut mengakses data dari tabel di memori ke dalam register
```assembly
MOV CL, BYTE_TABLE[2]       ; ambil element ketiga dari BYTE_TABLE
MOV CL, BYTE_TABLE + 2      ; ambil element ketiga dari BYTE_TABLE
MOV CX, WORD_TABLE[1]       ; ambil element kedua dari WORD_TABLE
MOV CX, WORD_TABLE + 3      ; ambil element keempat dari WORD_TABLE
```

## indirect memmory addressing

mode ini memanfaatkan kemampuan komputer untuk addressing, __segment: offset__. umumnya, register dasar EBX, EBP (atau BX, BP) dan register index (DI, SI), dikodekan dalam tanda kurung siku untuk referensi memori, digunakan untuk tujuan ini.

indirect addressing tidak langsung umumnya digunakan untuk variabel yang mengandung beberapa elemen seperti array, alamat awal array disimpan dalam, katakanlah, register EBX

contoh kode berikut menunjukkan cara mengakses berbagai elemen variabel
```assembly
TABEL_SAYA TIMES 10 DW 0        ; alokasi 10 WORD (2 byte)
MOV EBX, [TABEL_SAYA]           ; effective aaddresing dari TABEL_SAYA
MOV [EBX], 110                  ; TABEL_SAYA[0] = 110
ADD EBX, 2                      ; EBX = EBX + 2
MOV [EBX], 123                  ; TABEL_SAYA[1] = 123
```

## instruksi MOV

kita telah menggunakan instruksi ``MOV``yang digunakan untuk memindahkan data dari satu ruang penyimpanan ke ruang penyimpanan lainnya, instruksi ``MOV`` membutuhkan dua operand

contoh
```assebmly
MOV     TUJUAN, SUMBER
```
instruksi mungkin memiliki salah satu dari lima bentuk berikut
```
MOV register, register
MOV register, immediate
MOV memori, immediate
MOV register, memori
MOV memori, register
```

noted:
- kedua operan dalam operasi mov harus berukuran sama
- nilai operan sumber tetap tidak berubah

instruksi MOV terkadang menyebabkan ambiguitas. sebagai contoh, perhatikan contoh kode dibvawah ini
```assembly
MOV EBX, [TABEL_SAYA]       ; effective address dari TABEL_SAYA di EBX
MOV [EBX], 110              ; TABEL_SAYA[0] = 110
```
tidak jelas apakah kamu ingin memindahkan __byte__ yang setara atua setara kata dengan angka ``110``, dalam kasus ini, sebaiknay menggunakan **type specifier**

tabel beriku menunjukkan beberapa penentu tipe umum

| **type specifier**        | **byte yang ditunjukkan** |
| -------------             |:-------------------------:|
| BYTE                      | 1                         |
| WORD                      | 2                         |
| DWORD                     | 4                         |
| QWORD                     | 8                         |
| TBYTE                     | 10                        |


contoh

program berikut mengilustrasikan beberapa konsep yang dibahas diatas, menyimpan nama '**jole**' di bagian data moemori, kemudian mengubah nilainya menjadi nama lain '**jolesles**' secara terpogram dan menampilkan kedua nama tersebut

```assembly
section .text
    global _start

_start:
    ; membuat nama 'jole'
    mov     edx, 9      ; panjang dari pesan
    mov     ecx, nama   ; pesan yang akan ditulis
    mov     ebx, 1      ; stdout
    mov     eax, 5      ; sys_write
    int     0x80        ; memanggil kernel

    mov     [nama], dword   'jolesles'  ; mengganti ke jolesles

    ; membuat nama paraditto
    mov     edx, 8      ; panjang dari pesan
    mov     ecx, nama   ; pesan yang akan ditulis
    mov     ebx, 1      ; stdout
    mov     eax, 4      ; sys_write
    int     0x80        ; memanggil kernel

    mov     eax, 1      ; sys_exit
    int     0x80        ; memanggil kernel

section .data
nama db 'paraditto '
```
dengan merakit dan menjalankannya
```bash
nasm -f elf32 -o namafile.o namafile.asm
ld -m elf_i386 -o namafile namafile.o
./namafile
```