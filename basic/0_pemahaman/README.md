# sebelum memulai
## representasi kode mesin

bahasa rakitan menerjemahkan sebuah instruksu rakitan menjadi instruksi mesin, umumnya mekanisme penerjemahan ini bersifat 1-1, kerna dapat disebukan pula bahwa setiap instruksi dalam bahasa rakita merupakan representasi dari instruksi kode mesin.

sebagai contoh,berikut adalah instruksi yang digunakan pada prosessor x86 untuk memindahkan nilai 97 sebesar 8-bit ke dalam register prosesor AL. kode biner atas instruksi pemindahan adalah ``10110`` diikuti dengan 3-bit pengenal atas register yang akan digunakan. pengenal atas register AL dalam hal ini adalah ``000``. kemudian, nilai ``97`` dalam kode biner adalah ``01100001``, sehingga kode mesin yang digunakan untuk memindahkannya adalah dibawah ini
```
10110000 01100001
```

kode biner ini dapat diubah agar lebih mudah dibaca dengan manusia dengan mengkonversikannya ke dalam bilangan heksadesimal yaitu
```
B0 61
```

pada instruksi diatas, ``B0`` yaitu

pindahkan nilai berikut ke register AL dan ``61`` adalah representasi bilangan heksadesimal untuk nilai ``01100001`` atau 97 dalam bilangan desimal. bahasa rakitan untuk prosesor intel menyediakan simbol mnomonic MOV ( yang merupakan singkatan dari move ) untuk instruksi serupa seingga kode mesin sebelumnya dapat ditulis dealam bahasa rakitan sebagai berikut
```asm
MOV AL, 61h
```

## section assembly

dalam assembly ada 3 sektor dimana
- sektor **data**
- sektor **bss**
- sektor **text**

## sektor data
sektor **data** digunakan untuk mendklarasikan data atau kostanta yang diinisialisasi.data ini tidak berubah saat runtime. disini kita dapat mendklarasikan berbagai nama file, ukuran buffer, atau konstanta, dll. cara deklarasinya yaitu
```assembly
section.data
```

## sektor bss
dalam sektor **bss** dimana digunakan untuk mendklarasikan variabel. contoh deklarasinya yaitu
```
section.bss
```

# sektor text
sektor **text** digunakan untuk menyimpan real kode atau dimana fungsi kode sebenarnya. bagian ini arus dimulai dengan deklarasi ``global _start`` . dimana fungsi ini memberitahukan kernel dimana tempat esekusi program dimulai. contoh dari sektor **text** adalah
```assembly
section.text
    global _start
_start:
```

[komentar dan statement pada assembly](comment_dan_statement_asm.md)