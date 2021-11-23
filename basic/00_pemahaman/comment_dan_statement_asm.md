## Komentar

Pada assembly komentar dimulai dengan menggunakan titik koma (semicolon) ``;`` dimana block ini tidak akan di eksekusi
```assembly
; Ini adalah contoh penggunaan dari komentar.
```

## Statement Assembly
Bahasa Assembly terdiri dari tiga jenis pernyataan:

- Instruksi  atau instruksi yang dapat diesekusi.
- Arahan assembler atau pseudo-ops.
- makro (macros)

Instruksi yang dapat dieksekusi, atau instruksi sederhana memberi tahu prosesor apa yang harus dilakukan. Setiap instruksi terdiri dari sebuah kode operasi. Setiap instruksi yang dapat dieksekusi meghasilkan satu instruksi bahasa mesin.

Arahan assembler, atau pseudo-ops memberitahu assembler tentang berbagai aspek dari proses perakitan. Ini tidak dapat dieksekusi dan tidak menghasilkan instruksi bahasa mesin.

macros, atau makro pada dasarnya adalah mekanisme subtitusi teks.

## Syntax dari statement Assembly

Pernyataan bahasa Assembly dimasukkan satu pernyataan perbaris. Setiap pernyataan mengikuti format berikut :

```
[label] mnmonic [operator] [; komentar]
```
Kolom dalam tanda kurung siku adalah opsional. Sebuah instruksi dasar memiliki dua bagian, yang pertama adalah nama instruksi (``mnemonic``), yang akan dieksekusi, dan yang kedua adalah operator atau parameter dari perintah.

contoh perintah :

```assembly
INC HITUNG  ; Iterasi memori dari variabel HITUNG.

MOV HASIL, 90   ; Transfer nilai 48 di variabel memori HASIL.

ADD AH, BH ; Menambahkan isi register BH ke register AH.

AND ANGKASAYA, 128 ; Lakukan operasi AND pada variabel ANGKA SAYA, dan 128.

AND CONTOH, 10 ; Menambahkan 10p pada variabel CONTOH.

MOV AL , 10 ; Trasnsfer 10 ke register AL.
```