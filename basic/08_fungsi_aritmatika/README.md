# Fungsi Aritmatika

## Instruksi INC

Instruksi ``INC`` digunakan untuk menambah operand satu per satu. inc bekerja pada operand tunggal yang dapat berupa register, atau memori.

Contoh dari syntax :

```assembly
INC     dest
```
```assembly
INC     EBX         ; incr 32 bit register
INC     DL          ; incr 8 bit register
INC     [hitung]    ; incr variabel hitung
```

## Instruksi DEC

Instruksi ``DEC`` digunakan untuk mengurangi operand satu per-satu. Ia bekerja pada operand tunggal yang dapat berupa register, atau memori.

Contoh :

```assembly
segment .data
    count   dw  0
    value   db  15

segment .text
    inc     [jumlah]
    dec     [value]

    mov     ebx, jumlah
    inc     word    [ebx]

    mov     esi, value
    dec     byte    [esi]
```

## Instruksi ADD dan SUB

Instruksi ``ADD`` dan ``SUB`` digunakan untuk melakukan penjumlah pengurang sederhana dari data biner dalam ukuran byte, word dandouble word, yaitu untuk menambah, atau mengurangi operand 8 bit, 16 bit, atau 32 bit, masing-masing.

Contoh syntax :

```assembly
ADD/SUB     destination, source
```

Instruksi ``ADD/SUB`` dapat dilakukan, antara lain :
- __register__
- __memmory__ untuk __register__
- __register__ untuk __memmory__
- __register__ untuk __constant__
- __memmory__ untuk __constant__

Namun, seperti instruksi lainnya, operasi memori ke memori tidak dimungkinkan menggunakan instruksi ``add/sub``. Operasi ``add``, dan ``sub`` mengatur, atau menghapus flag overflow, dan carry.

Contoh :
Contoh berikut akan meminta dua digit dari pengguna, menyimpan digit masing-masing di register ``EAX``, dan ``EBX``, menambah nilai, menyimpan hasilnya di lokasi memori, ``res``, dan akhirnya menampilkan hasilnya.

```assembly
SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

segment .data
    pesan_input     db  'masukkan angka ', 0xA, 0xD
    panjang_pesan_input equ $- pesan_input

    pesan_input2    db  'masukkan angka kedua ', 0xA, 0xD
    panjang_pesan_input2 equ $- pesan_input2

    pesan_hasil    db  'hasilnya adalah '
    panjang_pesan_hasil   equ $- pesan_hasil

segment .bss

    angka1  resb    2
    angka2  resb    2
    res     resb    1

section .text
    global _start

_start:
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, pesan_input         
    mov edx, panjang_pesan_input
    int 0x80                

    mov eax, SYS_READ 
    mov ebx, STDIN  
    mov ecx, angka1 
    mov edx, 2
    int 0x80            

    mov eax, SYS_WRITE        
    mov ebx, STDOUT         
    mov ecx, pesan_input2          
    mov edx, panjang_pesan_input2 
    int 0x80

    mov eax, SYS_READ  
    mov ebx, STDIN  
    mov ecx, angka2 
    mov edx, 2
    int 0x80        

    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, pesan_hasil          
    mov edx, panjang_pesan_hasil  
    int 0x80

    ; pindah nomor pertama ke register EAX dan angka kedua ke EBX
    ; dan subtrak ascii '0' dan convert ke angka desimal

    mov     eax,    [angka1]
    sub     eax,    '0'

    mov     ebx,    [angka2]
    sub     ebx,    '0'
    
    ; tambah eax dan ebx
    add eax, ebx
    add eax, '0'

    mov [res], eax

    ; tampilkan hasil
    mov eax, SYS_WRITE        
    mov ebx, STDOUT
    mov ecx, res         
    mov edx, 1        
    int 0x80

exit:
    mov eax,    SYS_EXIT
    xor ebx,    ebx
    int 0x80
```

Contoh menambahkan 2 variabel

```assembly
section .text
    global _start

_start:
    mov     eax, '3'
    sub     eax, '0'
    
    mov     ebx, '7'
    sub     ebx, '0'
    add     eax, ebx
    add     eax, '0'
    

    mov     [hasil], eax
    mov     ecx, pesan
    mov     edx, panjang_pesan
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    mov     ecx, sum
    mov     edx, 1
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    mov     eax, 1
    int     0x80

section .data
    pesan db    'hasil dari 3 + 7 adalah'
    len equ     $ - pesan
    segment .bss
    sum resb    1
```

## Instruksi MUL/IMUL

Ada dua instruksi untuk mengalikan data biner. Instruksi MUL (multiply) mengambil data yang tidak ditandatangani dengan IMUL (integer multiply) menangani data yang ditandatangani. Kedua instruksi mempengaruhi flag carry, dan overflow.

sintaks
```assembly
MUL/IMUL  perkalian
```

MUL dalam kedua kasus akan berada di akumulator, tergantung pada ukuran multiplicand, multiplier, dan produk yang dihasilkan juga akan disimpan dalam dua register tergantung pada ukuran operand.

Contoh :

```assembly
MOV AL, 10
MOV DL, 25  
MUL DL
...
MOV DL, 0FFH
MOV AL, 0BEH
IMUL DL
```
Contoh berikut mengalikan 3 dengan 3, dan menampilkan :

```assembly
section	.text
   global _start
	
_start:        

   mov	al,'3'
   sub     al, '0'
	
   mov 	bl, '3'
   sub     bl, '0'
   mul 	bl
   add	al, '0'
	
   mov 	[res], al
   mov	ecx,msg	
   mov	edx, len
   mov	ebx,1	;file descriptor (stdout)
   mov	eax,4	;system call number (sys_write)
   int	0x80	;call kernel
	
   mov	ecx,res
   mov	edx, 1
   mov	ebx,1	
   mov	eax,4	
   int	0x80	
	
   mov	eax,1	
   int	0x80	

section .data
msg db "hasilnya adalah", 0xA,0xD 
len equ $- msg   
segment .bss
res resb 1
```