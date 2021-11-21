# memory segment
Kita telah membahas tiga bagian dari program perakitan. Bagian ini mewakili berbagai segmen memori juga.


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

## memory segment
Model memori tersegmentasi membagi memori sistem ke dalam kelompok segmen independen yang dirujuk oleh pointer yang terletak di register segmen. Setiap segmen digunakan untuk memuat tipe data tertentu. Satu segmen digunakan untuk memuat kode instruksi, segmen lain menyimpan elemen data, dan segmen ketiga menyimpan tumpukan program.

Mengingat penjelasan di atas, kita dapat menentukan berbagai segmen memori sebagai:

- **data segement**

    Diwakili oleh bagian ``.data`` dan ``.bss``. Bagian ``.data`` digunakan untuk mendeklarasikan wilayah memori, tempat elemen data disimpan untuk program. Bagian ini tidak dapat diperluas setelah elemen data dideklarasikan, dan tetap statis sepanjang program.

    Bagian ``.bss`` juga merupakan bagian memori statis yang berisi buffer untuk data yang akan dideklarasikan nanti dalam program. Memori buffer ini terisi nol.

- **segmen kode**

    Diwakili oleh bagian ``.text``. Ini mendefinisikan area dalam memori yang menyimpan kode instruksi. Ini juga merupakan area tetap.

- **stack**

    Segmen ini berisi nilai data yang diteruskan ke fungsi dan prosedur dalam program.

[lanjut ke materi berikutnya (register)](../03_register)