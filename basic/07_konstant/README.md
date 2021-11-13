# konstant

Ada beberapa arahan yang disediakan oleah NASM yang mendefinisikan kostanta. kita telah menggunakan directive EQU di tutorial sebelumnya. kita seara khusus akan membahas tiga arahan

- EQU
- %assign
- %define

## EQU directive

EQU digunakan untuk mendifinisikan kostanta. sintaks dari directif EQU adalah sebagai berikut

```
NAMA_CONSTANT EQU expression
```

sebagai contoh
```assembly
JUMLAH_KOMPUTER EQU 20
```

kita juga bisa menggunakan nilai konstan di dalam kode seperti
```assembly
mov     ecx,    JUMLAH_KOMPUTER
cmp     eax,    JUMLAH_KOMPUTER
```
operand dari pernyataan EQU dapat berupa expression
```assembly
PANJANG         EQU 20
LEBAR           EQU 10
LUAS_AREA       EQU PANJANG * LEBAR
```
kode diatas mendifinisikan LUAS_AREA sebagai 200 karena hasil dari perkalan antara 20 * 100

contoh berikut dari penggunaan EQU

```assembly
SYS_EXIT        EQU     1
SYS_WRITE       EQU     4
STDIN           EQU     0
STDOUT          EQU     1

section .text
  global _start

_start:
  mov   eax,    SYS_WRITE
  mov   ebx,    STDOUT
  mov   ecx,    pesan1
  mov   edx,    panjang_pesan1
  int0x80

  mov   eax,    SYS_WRITE
  mov   ebx,    STDOUT
  mov   ecx,    pesan2
  mov   edx,    panjang_pesan2
  int0x80

  mov   eax,    SYS_WRITE
  mov   ebx,    STDOUT
  mov   ecx,    pesan3  
  mov   edx,    panjang_pesan3
  int0x80

  mov   eax, SYS_EXIT
  int0x80

section .data
pesan1 db       'indonesia raya', 0xA, 0xD
panjang_pesan1 equ $ - pesan1

pesan2 db       'merdeka merdeka', 0xA, 0xD
panjang_pesan2 equ $ - pesan2

pesan3 db        'hiduplah indonesia raya'
panjang_pesan3 equ $ - pesan3
```

## %assign directive

the %assign directive dapat digunakan untuk mendifinisikan konstanta numerik sperti directive EQU. ini memungkinkan redefinisi. misalnya, dapat mendifinisikan konstanta total sebagai

```
%assign         TOTAL 10
```

## %define directive

%define directive memungkinkan mendefinisikan kedua konstanta numerik. arah ini mirip dengan ``#defina`` pada C. misalnya, dapat mendifinisikan kostanta sebagai

```
%define         PTR [EBP + 4]
```

kode diatas menggantikan PTR dengan [EBP + 4]

