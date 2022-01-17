# Instruksi logika

Set instruksi prosesor menyediakan instruksi logika ``AND``, ``OR``, ``XOR``, ``TEST``, dan ``NOT`, yang menguji, mengatur dan menghapus bit sesuai dengan kebutuhan program.

## Instruksi AND

Instruksi and digunakan untuk mendukung ekspresi logika dengan melakukan operasi AND bitwise, oeprasi AND bitwise mengembalikan 1, jika bit yang cocok dari kedua operan adalah 1,jika tidak maka akan mengembalikan 0.

```
operan1: 0101
operan2: 0011

AND -> Operan1: 0001
```

Operasi AND dapat digunakan untuk membersihkan satu atau lebih bit. Misalnya katakanlah register BL berisi 0011 1010. Jika perlu menghapus bit orde tinggi ke nol, AND dengan 0FH

```
AND     AL, 01H
JZ      angka_genap
```

Contoh dari program :

```assembly
section .text
    global _start

_start:
    mov ax, 8h
    and ax, 1
    jz  evnn
    mov eax, 4
    mov ebx, 1
    mov ecx, odd_msg
    mov edx, len2
    int 0x80
    jmp outprog

evnn:
    mov ah, 09h
    mov eax, 4
    mov ebx, 1
    mov ecx, even_msg
    mov edx, len1
    int 0x80

outprog:
    mov eax, 1
    int 0x80

section .data
even_msg db 'bilangan genap'
len1 equ $ - even_msg

odd_msg db 'bilangan ganjil'
len2 equ $ - odd_msg
```
output akan menghasilkan
```
bilangan genap
```

jika ingin merubah kebilangan ganjil maka merubah
```assembly
mov ax, 9h
```
maka output yang dihasilkan adalah
```
bilangan ganjil
```


## Instruksi OR

Instruksi OR digunakan untuk mendukung ekspresi logika dengan melakukan operasi bitwise or, operator bitwise or mengembalikan 1, jika bit yang cocok dari salah satu atau kedua operan adalah satu. Ini mengembalikan 0, jika kedua bitnya nol.

Sebagai contoh : 
```
operan1: 0101
operan2: 0011

or -> operan1: 0111
```

Operasi or dapat digunakan untuk menyetel satu atau lebih bit. Sebagai contoh, mari kita asumsikan register AL berisi 001 0101, kita perlu mengatur empat bit orde rendah, kita dapat nilai OR dengan nilai 0000 1111 yaitu FH

```assembly
OR BL, 0FH
```

Contoh berikut menunjukkan instruksi OR, kita menyimpan nilai 5 dan 3 masing - masing di register AL dan BL, kemudian instruksinya,
```assembly
OR AL, BL
```
```assembly
section .text
   global _start           
	
_start:                     
   mov    al, 5            
   mov    bl, 3            
   or     al, bl             
   add    al, byte '0'      
	
   mov    [result],  al
   mov    eax, 4
   mov    ebx, 1
   mov    ecx, result
   mov    edx, 1 
   int    0x80
    
outprog:
   mov    eax,1             
   int    0x80              
	
section    .bss
result resb 1
```
ketika di kompilasi dan di eseskusi mengasilkan otuput
```
7
```

## Instruksi xor

Instruksi XOR mengimplementasikan operasi XOR bitwise. Operasi XOR menetapkan bit yang dihasilkan ke 1, jika dan hanya jika bit dari operan berbeda. Jika bit dari operan sama (keduanya 0 atau keduanya 1), bit yang dihasilkan dihapus ke 0.
```assembly
XOR EAX, EAX
```

## Instruksi TEST

Instruksi TEST bekerja sama dengan operasi AND, tetapi tidak seperti instruksi AND, instruksi ini tidak mengubah operan pertama. Jadi, jika kita perlu memeriksa apakah suatu bilangan dalam register genap atau ganjil, kita juga dapat melakukannya dengan menggunakan instruksi TEST tanpa mengubah bilangan aslinya.
```assembly
TEST AL, 01h
JZ   angka_genap
```

## instruksi NOT

Instruksi NOT mengimplementasikan operasi NOT bitwise. Operasi NOT membalikkan bit dalam operand. Operand dapat berupa register atau memori.
