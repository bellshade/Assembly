# hello world

Contoh sederhana dari hello world pada assembly

[source code](helloworld.asm)
```assembly
section .text
    global _start       ; Wajib deklarasi untuk linker atau ld.

_start:                 ; Memberi info dari titik masuk linker.
    mov    edx, len     ; Deklarasi panjang dari message atau pesan.
    mov    ecx, msg     ; Deklarasi register pesan yang akan di tulis.
    mov    ebx, 1       ; Deklarasi stdout.
    mov    eax, 4       ; Sistem dari sys_write untuk iniliasi perintah, atau biasa disebut nomor panggilan sistem.
    int    0x80         ; Memanggil kernel untuk melakukan perintah diatas.
    mov    eax, 1       ; Sistem dari sys_swrite untuk iniliasi perintah atau biasa disebut nomor panggilan sistem.
    int    0x80         ; Memanggil kernel untuk melakukan perintah diatas.

section .data
msg     db      'bellshade',    0xa     ; Pesan yang akan di print.
len     equ     $ -msg                  ; Membaca panjang dari string 'bellsahde'.
```

## compile dan linking menggunakan NASM

Pastikan anda sudah menginstall NASM yang sebelumnya sudah diberitahukan, dan lakukan perintah dibawah ini untuk kompilasi program diatas, serta menampilkannya.

- Pastikan kamu sudah save filenya dengan ekstensi `.asm`.
- Untuk satukan program lakukan perintah :
    ```
    nasm -f elf namafile.asm
    ```
- Maka, file `.o` akan di create sesuai dengan nama file.
- Untuk link file object menjadi file yang bisa di eseskusi, gunakan linker yaitu dengan menggunakan perintah : 
    ```bash
    ld -m elf_i386 -s -o namafile namafile.o
    ```
- Setelah berhasil maka panggil file tersebut dengan perintah :
    ```
    ./namafile
    ```
Maka output yang tertampil adalah

```
bellshade
```

[lanjut ke materi berikutnya (segmentasi memori)](../02_memory_segment)
