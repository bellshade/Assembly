# Sebelum Memulai

## Representasi kode mesin

Bahasa rakitan menerjemahkan sebuah instruksu rakitan menjadi instruksi mesin, umumnya mekanisme penerjemahan ini bersifat 1-1, karena dapat disebukan pula bahwa setiap instruksi dalam bahasa rakitan merupakan representasi dari instruksi kode mesin.

Sebagai contoh, berikut adalah instruksi yang digunakan pada prosessor x86 untuk memindahkan nilai 97 sebesar 8-bit ke dalam register prosesor AL. Kode biner atas instruksi pemindahan adalah ``10110`` diikuti dengan 3-bit pengenal atas register yang akan digunakan. Pengenal atas register AL dalam hal ini adalah ``000``. kemudian, nilai ``97`` dalam kode biner adalah ``01100001``, sehingga kode mesin yang digunakan untuk memindahkannya adalah dibawah ini :
```
10110000 01100001
```

Kode biner ini dapat diubah agar lebih mudah dibaca oleh manusia dengan mengkonversikannya kedalam bilangan heksadesimal, yaitu :
```
B0 61
```

Pada instruksi diatas, ``B0`` yaitu :

Pindahkan nilai berikut ke register AL dan ``61`` adalah representasi bilangan heksadesimal untuk nilai ``01100001``, atau 97 dalam bilangan desimal. Bahasa rakitan untuk prosesor intel menyediakan simbol mnomonic MOV ( yang merupakan singkatan dari move ) untuk instruksi serupa sehingga kode mesin sebelumnya dapat ditulis dealam bahasa rakitan sebagai berikut :

```asm
MOV AL, 61h
```

## Section Assembly

Dalam assembly ada 3 sektor, yaitu :
- sektor **data**
- sektor **bss**
- sektor **text**

## Sektor Data (section data)

Sektor **data** digunakan untuk mendeklarasikan data, atau kostanta yang diinisialisasi. Data ini tidak berubah saat runtime. Disini kita dapat mendklarasikan berbagai nama file, ukuran buffer, atau konstanta, dll. Cara deklarasinya yaitu :

```assembly
section.data
```

## Sektor Bss (section bss)

Dalam sektor **bss** dimana digunakan untuk mendklarasikan variabel. Contoh deklarasinya yaitu :

```
section.bss
```

## Sektor Text (section text)
Dalam sektor **text** digunakan untuk menyimpan real kode atau dimana fungsi kode sebenarnya. Bagian ini arus dimulai dengan deklarasi ``global _start`` . dimana fungsi ini memberitahukan kernel dimana tempat esekusi program dimulai. Contoh dari sektor **text**, yaitu :

```assembly
section.text
    global _start
_start:
```

[lanjut ke materi berikutnya (hello world)](../01_hello_world)