# pemanggilan sistem

Panggilan sistem adalah API untuk antarmuka antara ruang pengguna dan ruang kernal. kita telah menggunakan panggilan sistem. ``sys_write`` dan ``sys_exit`` , masing-masing untuk menulis ke layar dan keluar dari program

## panggilan sistem linux

kamu dapat menggunakan panggilan sistem linux di program assembly. kamu perlu mengambil langkah-langkah berikut untuk menggunakan panggilan sistem linux di program anda

- masukkan nomor panggilan sistem ke dalam register EAX.
- simpan arguman ke panggilan sistem di register EBX, ECX, dll.
- panggil interupsi yang relevan.
- hasilnya biasanya dikembalikan dalam register EAX.

ada enam register yang menyimpan argumen dari system call yang digunakan. Ini adalah EVX, ECX, EDX, ESI, EDI dan EBP. Register ini mengambil argumen berurutan, dimulai dengan register EBX, jika kamu lebih dari enam argumen pertama disimpan dalam register EBX.

contoh penggunaan dari ``sys_exit``

```assembly
mov     eax, 1      ; memanggil sys_exit
int0x80             ; memanggil kernel
```

contoh penggunaan dari ``sys_write``

```assembly
mov     edx, 4      ; panjang dari pesan 
mov     ecx, pesan  ; pesan yang akan ditulis
mov     eax, 1      ; stdout
mov     eax, 4      ; sys_write
int0x80             ; memanggil kernel
```


## contoh membaca nomor dari keyboard dan menampilkan pada layar

```assembly
section .data
    userInput   db  'Masukkan angka: '
    lenUserInput    equ $-userInput         ; panjang dari sebuah pesan input
    displayPesan    db 'Angka kamu : '
    lenDisplayPesan equ $-displayPesan

section .bss
    num resb    5

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, userInput
    mov edx, lenUserInput
    int 80h

    ; kemudian baca dan tampilakan hasil input
    mov eax, 3
    mov ebx, 2
    mov ecx, num
    mov edx, 5      ; 5 byte (numeric, 1 untuk identitas angka)
    int 80h

    ; kemudian tampilkan pesan 'Angka kamu: '
    mov eax, 4
    mov ebx, 1
    mov ecx, displayPesan
    mov edx, lenDisplayPesan
    int 80h

    ; membuat output dari nomor yang sudah di outputkan
    mov eax, 4
    mov ebx, 1
    mov ecx, num
    mov edx, 5
    int 80h

    ; exit dari program
    mov eax, 1
    mov ebx, 0
    int 80h
```

maka hasil outputnya adalah
```
Masukkan angka:
27162
Angka kamu: 27162
```

