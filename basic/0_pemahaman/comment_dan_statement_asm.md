## komentar

pada assembly komentar dimulai dengan menggunakan titik koma (semicolon) ``;`` dimana block ini tidak akan di esekusi
```assembly
; ini adalah contoh penggunaan dari komentar
```

## statement assembly
bahasa assembly terdiri dari tiga jenis pernyataan:

- instruksi  atau instruksi yang dapat diesekusi
- arahan assembler atau pseudo-ops
- makro (macros)

instruksi yang dapat diesekusi atau instruksi sederhana memberi tahu prosesor apa yang harus dilakukan. setiap instruksi terdiri dari sebuah kode operasi. setiap instruksi yang dapat dieksekusi meghasilkan satu instruksi bahasa mesin.

arahan assembler atau pseudo-ops memberitahu assembler tentang berbagai aspek dari proses perakitan. ini tidak dapat dieksekusi dan tidak menghasilkan instruksi bahasa mesin.

macros atau makro pada dasarnya adalah mekanisme subtitusi teks.

## sintaks dari statement assembly

pernyataan bahasa assembly dimasukkan satu pernyataan perbaris. setiap pernyataan mengikuti format berikut

```
[label] mnmonic [operator] [; komentar]
```
kolom dalam tanda kurung siku adalah opsional. sebuah instruksi dasar memiliki dua bagian, yang pertama adalah nama instruksi (``mnemonic``), yang akan dieksekusi, da yang kedua adalah operator atau parameter dari perintah

contoh perintah
```assembly
INC HITUNG  ; interasi memori dari variabel HITUNG

MOV HASIL, 90   ; transfer nilai 48 di variabel memori HASIL

ADD AH, BH ; menambahkan isi register BH ke register AH

AND ANGKASAYA, 128 ; lakukan operasi AND pada variabel ANGKA SAYA dan 128

AND CONTOH, 10 ; menambahkan 10p pada variabel CONTOH

MOV AL , 10 ; trasnsfer 10 ke register AL
```