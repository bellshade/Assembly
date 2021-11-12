# perulangan

instruksi ``jmp`` dapat digunakan untuk mengimplementasikan loop, misalnya contoh kode berikut untuk mengeksekusi looping sebanyak 10 kali

```assembly
MOV     CL, 10

L1:
    ; bagian yang akan di looping

DEC     CL
JNZ     L1
```
set instruksi prosesor, bagaimanapun, termasuk sekelompok instruksi loop untuk mengimplementasikan iterasi. instruksi ``loop`` dasar memiliki sintkas berikut
```assembly
LOOP        label
```
dimana, label adalah __label__ target yang mendingidentifikasi intstruksi target seperti pada instruksi lompat. instruksi lopp mengasumsikan bahwa register ecx berisi jumlah loop. ketika instruksi loop dekseskusi, register ecx dikurangi dan kontrol melompak ke label target, sampai nilai register ecx, yaitu penghitung mencapai nilai nol

cuplikan kode diatas dapat ditulis sebagai
```assembly
MOV     ECX, 10
L1:
    ; bagian yang akan di looping
loop L1
```

berikut adalah contoh untuk mencetak angka 1 sampai 9
```assembly
section .text
    global _start

_start:
    mov     ecx, 10
    mov     eax, '1'
    
l1:
    mov [angka], eax
    mov eax, 4
    mov ebx, 1
    push ecx
    
    mov ecx, num
    mov edx, 1
    int 0x80

    mov eax, [angka]
    sub eax, '0'
    inc eax, '0'
    pop ecx
    loop l1

    mov eax, 1
    int 0x80

section .bss
num resb 1
```