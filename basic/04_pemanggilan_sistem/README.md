# Pemanggilan Sistem

Panggilan sistem adalah API untuk antarmuka antara ruang pengguna dan ruang kernal. Kita telah menggunakan panggilan sistem. ``sys_write``, dan ``sys_exit`` , masing-masing untuk menulis ke layar, dan keluar dari program.

## Panggilan Sistem Linux

Kamu dapat menggunakan panggilan sistem linux di program assembly. Kamu perlu mengambil langkah-langkah berikut untuk menggunakan panggilan sistem linux di program anda.

- Masukkan nomor panggilan sistem ke dalam register EAX.
- Simpan arguman ke panggilan sistem di register EBX, ECX, dll.
- Panggil interupsi yang relevan.
- Hasilnya biasanya dikembalikan dalam register EAX.

Ada enam register yang menyimpan argumen dari system call yang digunakan. Ini adalah EVX, ECX, EDX, ESI, EDI, dan EBP. Register ini mengambil argumen berurutan, dimulai dengan register EBX, jika kamu lebih dari enam argumen pertama disimpan dalam register EBX.

Contoh penggunaan dari ``sys_exit`` :

```assembly
mov     eax, 1      ; Memanggil sys_exit.
int0x80             ; Memanggil kernel.
```

Contoh penggunaan dari ``sys_write`` :

```assembly
mov     edx, 4      ; Panjang dari pesan.
mov     ecx, pesan  ; Pesan yang akan ditulis.
mov     eax, 1      ; stdout.
mov     eax, 4      ; sys_write.
int0x80             ; Memanggil kernel.
```


## Contoh membaca nomor dari keyboard dan menampilkan pada layar

```assembly
section .data
    userInput   db  'Masukkan angka: '
    lenUserInput    equ $-userInput         ; Panjang dari sebuah pesan input.
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

    ; Kemudian baca, dan tampilakan hasil input.
    mov eax, 3
    mov ebx, 2
    mov ecx, num
    mov edx, 5      ; 5 byte (numeric, 1 untuk identitas angka)
    int 80h

    ; Kemudian tampilkan pesan 'Angka kamu: '
    mov eax, 4
    mov ebx, 1
    mov ecx, displayPesan
    mov edx, lenDisplayPesan
    int 80h

    ; Membuat output dari nomor yang sudah di outputkan.
    mov eax, 4
    mov ebx, 1
    mov ecx, num
    mov edx, 5
    int 80h

    ; Exit dari program.
    mov eax, 1
    mov ebx, 0
    int 80h
```

Maka hasil outputnya adalah
```
Masukkan angka:
27162
Angka kamu: 27162
```

