# Manajemen file

sistem memanggap setiap input atau output data sebagai aliran byte. ada tiga aliran file standar

- masukan standar (stdin)
- keluaran standar (stdout)
- kesalahan standar (stderr)


## deskriptor bekas

sebuah file descriptor adalah bilangan bulat 16 bit ditukaskan ke file sebagai id berkas. ketika file baru dibuat atau file yang ada dibuka. deskriptor file digunakan untuk mengakses file.
diskriptor file dari aliran file standar - ``stdin``, ``stdout`` dan ``stderr`` masing-masing adalah 0, 1 dan 2.

langkah-langkah yang diperlukan untuk menggunakan panggilan sistem sama
- masukkan nomor panggilan ke dalam register EAX
- simpan argumen ke panggilan sistem di register EBX, ECX, dan lain-lain
- panggil interupsi yang relevan
- hasilnya biasanya dikembalikan dalam register EAX

## membuat dan membuka file

untuk membuat dan membuka file yaitu
- masukkan panggilan ke sistem ``sys_create()`` di register EAX
- masukkan nama file ke dalam register EBX
- masukkan izin file ke dalam register ECX

panggilan sistem mengembalikan deskriptor file dari file yang dibuat ke register eax,jika terjadi kesalahan, kode kesalahan ada di register EAX

## membuka file yang sudah ada

untuk membuka file yang sudah ada yaitu
- masukkan panggilan sistem ``sys_open()`` di register EAX
- masukkan nama file ke dalamr egister EBX
- masukkan mode akses file ke dalam register ECX
- letakkan hak akses file di register EDX

panggilan sistem mengembalikan deskriptor file dari file yang dibuat di register EAX, jika terjadi kesalahan, kode kesalahan ada di register EAX

## menulis ke file

untuk menulis file yaitu dengan cara
- masukkan panggilan ke sistem ``sys_write()`` di register EAX
- masukkan deskriptor file ke dalam register ebx
- letakkan pointer ke buffer output di register ecx
- masukkan ukuran buffer, yaitu jumlah byte yang akan ditulis ke dalam register EDX

panggilan sistem mengembalikan jumlah byte sebenarnya yang ditulis ke dalam register EAX

## menutup file 

untuk menutuo file yaitu
- masukkan panggilan sistem ``sys_close()`` di register EAX
- masukkan diskriptor file ke dalam register EBX

panggilan sistem mengembalikan, jika terjadi kesalahan, kode kesalahan dalam register EAX

## memperbarui file

untuk memperbarui file yaitu
- masukkan panggilan ke ``sys_lseek()`` di register EAX
- masukkan deskriptor file ke dalam register EBX
- masukkan nilai offster ke dalam register ECX
- letakkan posisi referensi untuk offset di regsiter EDX

posisi referensi dapat berupa
- awala file = nilai 0
- posisi saat ini = nilai 1
- akhir file = nilai 2

panggilan sistem mengembalikan, jika terjadi kesalahan kode kesalahan dalam register EAX

program berikut membat dan membuka file bernama ``filesaya.txt`` dan menulis teks __bellshade assembly__.

```assembly
section .text
    global _start

_start:
    ; membuat file
    mov eax, 8
    mov ebx, nama_file
    mov ecx, 0777       ; baca, tulis dan esekusi
    int 0x80

    mov [fd_out], eax
    
    ; tulis ke dalam file
    mov edx, len        ; jumlah byte
    mov ecx, pesan      ; pesan untuk ditulis
    mov ebx, [fd_out]
    mov eax, 4
    int 0x80            ; memanggil kernel

    ; menutup file
    mov eax, 6
    mov ebx, [fd_out]
    
    mov eax, 4
    mov ebx, 1
    mob ecx, akhir_pesan
    mov edx, akhir_len
    int 0x80

    ; membuka file untuk dibaca
    mov eax, 5
    mov ebx, nama_file
    mov ecx, 0
    mov edx, 0777
    int 0x80

    mov [fd_in], eax

    ; baca dari file
    mov eax, 3
    mov ebx, [fd_in]
    mov evx, info
    mov edx, 26
    int 0x80

    ; menutup file
    mov eax, 6
    mov ebx, [fd_in]
    int 0x80

    ; print info
    mov eax, 4
    mov ebx, 1
    mov ecx, info
    mov edx, 26
    int 0x80

    mov eax, 1      ; sys_exit
    int 0x80        ; memanggil kernel

section .data
nama_file db 'filesaya.txt'
pesan db 'bellshade assembly'
len equ $-pesan

akhir_pesan db 'tulis ke dalam file', 0xa
akhir_len equ $ - akhir_pesan

section .bss
fd_out resb 1
df_in resb 1
info resb 26
```

ketika kode diatas dikompilasi diseskusi maka menghasilkan
```
tulis ke dalam file
bellshade assembly
```
