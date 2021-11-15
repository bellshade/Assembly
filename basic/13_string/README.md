# string

kita telah menggunakan string len variabel dalam contoh kita sebelumnya string len variabel dapat memiliki karakter sebanyak yang diperlukan. mumnya, kami menentukan panjang string dengan salah satu dari dua cara

- secara eksplisit menyimpang panjang string
- menggunakan karakter sentinel

kita dapat menyimpan panjang string secara esplisit dengan menggunakan simbol penghitung lokasi $ yang mewakili nilai penghitung lokasi saat ini

```assembly
pesan db 'bellshade', 0xa
len equ $- pesan
```
$ menunjuk ke byte setelah karakter terakhir dari variabel string pesab . Oleh karena itu, __$- pesan__ memberikan panjang string. Kita juga bisa menulis

```assembly
pesan db 'bellshade'
len equ 13
```
Atau, Anda dapat menyimpan string dengan karakter penjaga tambahan untuk membatasi string alih-alih menyimpan panjang string secara eksplisit. Karakter penjaga harus berupa karakter khusus yang tidak muncul dalam string.

```assembly
pesan db 'bellshade assembly', 0
```

## instruksi string
setiap instruksi string mungkin memerlukan operan sumber, operan tujuan atau keduanya. Untuk segmen 32-bit, instruksi string menggunakan register ESI dan EDI untuk menunjuk ke operand sumber dan tujuan, masing-masing.

untuk segmen 16-bit, register SI dan DI digunakan masing-masing untuk menunjuk ke sumber dan tujuan.

- MOVS

    intruksi ini memindahkan 1 byte, word atau doubleword data dari lokasi memori ke lokasi lain

- LODS

    instrukis ini dimuat dari memori. jika operan satu byte, itu dimuat ke register AL, jika operan adalah satu kata, itu dimuat ke register Ax dan kata ganda dimuat ke register EAX

- STOS

    instruksi ini menyimpan data dari register (AL, AX atau EAX) ke memori.

- CMPS
    
    instruksi ini membanding dua item data dalam memori. data bisa berukuran byte, word atau doubleword

- SCAS

    instruksi ini membanding isi register (AL, AX, EAX) dengan isi item dalam memori

Setiap instruksi di atas memiliki versi byte, word, dan doubleword, dan instruksi string dapat diulang dengan menggunakan awalan pengulangan.

Instruksi ini menggunakan pasangan register ES:DI dan DS:SI, dimana register DI dan SI berisi alamat offset yang valid yang mengacu pada byte yang disimpan dalam memori. SI biasanya dikaitkan dengan DS (segmen data) dan DI selalu dikaitkan dengan ES (segmen ekstra).

Register DS:SI (atau ESI) dan ES:DI (atau EDI) masing-masing menunjuk ke operand sumber dan tujuan. Operand sumber diasumsikan pada DS:SI (atau ESI) dan operan tujuan pada ES:DI (atau EDI) dalam memori.

Untuk alamat 16-bit, register SI dan DI digunakan, dan untuk alamat 32-bit, register ESI dan EDI digunakan.


## awalan pengulangan

Awalan REP, ketika diatur sebelum instruksi string, misalnya - REP MOVSB, menyebabkan pengulangan instruksi berdasarkan penghitung yang ditempatkan di register CX. REP mengeksekusi instruksi, menurunkan CX sebesar 1, dan memeriksa apakah CX adalah nol. Ini mengulangi pemrosesan instruksi sampai CX adalah nol.