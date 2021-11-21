# hello world

contoh sederhana dari hello world pada assembly

[source code](helloworld.asm)
```assembly
section .text
    global _start       ; wajib deklarasi untuk linker atau ld


_start:                 ; memberi info dari titik masuk linker
    mov    edx, len     ; deklarasi panjang dari message atau pesan
    mov    ecx, msg     ; deklarasi register pesan yang akan di tulis
    mov    ebx, 1       ; deklarasi stdout
    mov    eax, 4       ; sistem dari sys_write untuk iniliasi perintah atau biasa disebut nomor panggilan sistem
    int    0x80         ; memanggil kernel untuk melakukan perintah diatas

    mov    eax, 1       ; sistem dari sys_swrite untuk iniliasi perintah atau biasa disebut nomor panggilan sistem
    int    0x80         ; memanggil kernel untuk melakukan perintah diatas

section .data
msg     db      'bellshade',    0xa     ; pesan yang akan di print
len     equ     $ -msg      ; membaca panjang dari string 'bellsahde'
```

## compile dan linking menggunakan NASM

pastikan anda sudah menginstall NASM yang sebelumnya sudah diberitahukan dan lakukan perintah dibawah ini untuk kompilasi program diatas dan menampilkannya

- pastikan kamu sudah save filenya dengan ekstensi ``.asm``
- untuk satukan program lakukan perintah
    ```
    nasm -f elf namafile.asm
    ```
- maka file ``.o`` akan di create sesuai dengan nama file
- untuk link file object menjadi file yang bisa di eseskusi, gunakan linker yaitu dengan menggunakan perintah
    ```bash
    ld -m elf_i386 -s -o namafile namafile.o
    ```
- setelah berhasil maka panggil file terseubut dengan perintah
    ```
    ./namafile
    ```
maka output yang tertampil adalah

```
bellshade
```

[lanjut ke materi berikutnya (segmentasi memori))](../02_memory_segment)
