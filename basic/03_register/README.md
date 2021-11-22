# Register Assembly

Operasi prosesor sebagian besar melibatkan pemrosesan data. Data ini dapat disimpan dalam memori dan diakses dari sana. Namun, membaca data dari dan menyimpan data ke dalam memori memperlambat prosesor, karena melibatkan proses pengiriman permintaan data yang rumit melalui bus kontrol dan ke dalam unit penyimpanan memori, dan mendapatkan data melalui saluran yang sama.

Untuk mempercepat operasi prosesor, prosesor menyertakan beberapa lokasi penyimpanan memori internal, yang disebut **register**.

Register menyimpan elemen data untuk diproses tanpa harus mengakses memori. Sejumlah register terbatas dibangun ke dalam chip prosesor.


## Register Processor

Ada sepuluh register prosesor a32 bit dan enam 16 bit dalam arsitektur IA-32. Register dikelompokkan menjadi tiga kategori, yaitu :

1. Register Umum
2. Kontrol register
3. Register segmen

Register umum dibagi lagi menjadi kelompok-kelompok berikut :

1. Register data
2. Register penunjuk
3. Register indeks


## Daftar Data

Empat register data 32 bit digunakan untuk operasi aritmatika, logika, dan lainnya, register 32 bit ini dapat digunakan dalam tiga cara, yaitu :

1. Sebagai register data 32 bit lengkap: EAX, EBX, ECX, EDX.
2. Bagian bawah register 32 bit dapat digunakan sebagai empat register data 16 bit: AX, BX, CX, dan DX.
3. Bagian yang lebih rendah dan lebih tinggi dari empat register 16 bit yang disebutkan di atas dapat digunakan sebagi.delapa register 8 bit: AH, AL, BH, BL, CH, CL, DH, dan DL.


- **AX adalah akumulator utama**

  Digunakan dalam input/output dan sebagai besar instruksi aritmatika. Misalnya, dalam operasi perkalian, satu operan disimpan di register EAX atau AX atau AL sesuai dengan ukuran operan.

- **BX dikenal sebagai register dasar**
  
  Karena dapat digunakan dalam pengalamatan terindeks.

- **CX dikenal sebagai register hitung**

  Karena register ECX, CX menyimpan jumlah loop dalam oeprasi iteratif.

- **DX dikenal sebagai register data**

  Ini juga digunakan dalam operasi input/output, dan juga digunakan dengan register AX bersama dengan DX untuk operasi perkalian, dan pembagian yang melibatkan nilai besar.

## Register Penunjuk

Register penunjuk adalah register EIP, ESP, EBP 32 bit, dan bagian kanan 16 bit yang sesuai IP,SP, BP. Ada tiga kategori register pointer, yaitu :

1. **Instruksi Pointer (IP)**

  Register IP 16 bit menyimpan alamat offset dari isntruksi berikutnya yang akan dieksekusi. IP yang terkait dengan register CS (sebagai CS:IP) memberikan alamat lengkap  dari instruksi saat ini di segmen kode.

2. **Stack Pointer (SP)**

  Register SP 16 bit memberikan nilai offset dalam tumpukan program. SP dalam hubungannya dengan register SS (SS:SP) mengacu pada posisi data atau alamat saat ini dalam tumpukan program.

3. **Base Pointer (BP)**
  
  Register BP 16 bit terutama membantu dalam mereferensikan variabel parameter yang diterukan ke subrutin. Alamat di register SS digabungkan dengan offset di BP untuk mendapatkan lokasi parameter. BP juga dapat digabungkan dengan DI, dan SI sebagai register dasar untuk pengalamatan khusus.

## Dafter Indeks

Register index 32 bit, ESI dan EDI, dan bagian paling kanan 16 bitnya, SI dan DI, digunakan untuk pengalamatan berindeks, dan terkadang digunakan untuk penjumlahan dan pengurangan. Ada dua set penunjuk indeks, yaitu :

1. **Source Index (SI)** digunakan sebagai indeks sumber untuk operasi string.
2. **Destination Index (DI)** digunakan sebagi indeks tujuan untuk operasi string.

## Kontrol Register

Register pointer instruksi 32 bit dan register fla 32 bit digabungkan dianggap sebagi register kontrol.
Banyak instruksi melibatkan perbandingan, perhitungan matematis, mengubah status flag, dan beberapa instruksi bersyarat lainnya menguji nilai flah status ini untuk membawa aliran kontrol ke lokasi lain.

Bit flag yang umum adalah :

- **Overflow flag (OF)**

  Menunjukkan overflow dari bit orde tinggi (bit paling kiri) data setelah operasi arimatika yang ditandatangi.

- **Direction Flag (DF)**

Menentukan arah kiri atau kanan untuk memindahkan atau membandingkan data string. ketika nilai DF adalah 0, operasi string mengambil arah kiri- ke kanan, dan ketika nilai diatur ke 1, maka, operasi string mengambil arah kanan-ke-kiri.

- **Interrupt Flag (IF)**

  Menentukan apakah interupsi eksternal seperti entri keyboard, dll., akan diabaikan, atau diproses. Ini menonaktifkan interupsi eksternal saat nilainya 0, dan mengaktifkan interupsi saat disetel ke 1.

- **Trap Flag (TF)**

  Memungkinkan pengaturan operasi processor dalam mode satu langkah. Program DEBUG yang digunakan untuk menyetel flag trap, sehingga dapat melangkah melaluieksekusi satu instruksi pada satu waktu.


- **Sign Flag (SF)**

  Menujukkan tanda hasil operasi aritmatika. Flag ini diatur sesuai dengan tanda item data setelah operasi aritmatika. Tanda tersebut ditunjukkan dengan orede tinggi dari bit paling kiri. Hasil positif menghapus nilai SF ke 0, dan hasil negatif menetapkannya ke 1.

- **Zero Flag (ZF)**

  Ini menunjukkan hasil dari operasi aritmatika, atau perbandingan. Hasil bukan nol menghapus bendera nol ke 0, dan hasil nol menetapkannya ke 1.

- **Auxiliary carry Flag (AF)**

  Ini berisi carry dari 3 ke bit 4 setelah operasi aritmatika, digunakan untuk aritmatika khusus. AF diatur ketika operasi aritmatika 1-byte menyebabakan carry dari bit 3 ke bit 4.

- **Parity Flag(PF)**
  Menunjukkan jumlah total 1-bit dalam hasil yang diperolah dari operasi aritmatika. Jumlah 1 bit yang genap menghapus parity flag menjadi 0 dan jumlah 1 bit ganjil menetapkan bendera paritas menjadi 1.

- **Carry Flag(CF)**

  Ini berisi carry 0, atau 1 dari bit orde tinggi (paling kiri) setelah operasi aritmatika. Itu juga menyimpan isi bit terakhir dari operasi __shift__ atau __rotate__.


## Register Segmen

Segmen adalah area spesifik yang ditentukan dalam program untuk memuat data, kode, dan tumpukan atau stack. Ada tiga segmen utama, yaitu :

1. Segmen Kode

  Berisi semua instruksi yang akan diekskusi. Register segmen kode 16 bit, atau register CS menyimpan alamat awal segmen kode.

2. Segmen Data

  Berisi data, kostanta, dan area kerja, register segmen data 16 bit atau register DS menyimpan alamat awal segmen data .

4. Stack Segmen

  Ini berisi data, dan alamat kembali dari prosedur atau subrutin. Ini diimplementasikan sebagai struktur data stack. Register stack segment atau register SS menyimpan alamat awal stack.


Selain register, DS, CS dan SS, ada register segmen tambahan lainnya, ES (segmen ekstra), FS, dan GS yang menyediakan segmen tambahan untuk menyimpan data.

Dalam pemrograman perakitan, sebuah program perlu mengakses lokasi memori. Semua lokasi memori dalam segmen relatif terhadap alamat awal segmen. Segmen dimulai di alamat yang habis dibagi 16, atau 10 heksadesimal. Jadi, digit heksadesimal paling kanan di semua alamat memori tersebut adalah 0, yang umumnya tidak disimpan dalam register segmen.

Register segmen menyimpan alamat awal segmen. Untuk mendapatkan lokasi yang tepat dari data atau instruksi dalam segmen, nilai offset (atau perpindahan) diperlukan. Untuk mereferensikan setiap lokasi memori dalam suatu segmen, prosesor menggabungkan alamat segmen dalam register segmen dengan nilai offset lokasi tersebut.

Perhatikan program sederhana berikut ini untuk memahami penggunaan register dalam pemrograman assembly. Program ini menampilkan 9 bintang di layar bersama dengan pesan sederhana


```Assembly
section .text
  global _start

_start:
  mov   edx, len        ; Panjang pesan.
  mov   ecx, msg        ; Pesan yang akan di write.
  mov   ebx, 1          ; stdout.
  mov   eax, 4          ; sys_write.
  int   0x80            ; Memanggil kernel.

  mov   edx, 9          ; Panjang dari pesan.
  mov   ecx, s2         ; Pesan yang akan di write.
  mov   ebx, 1          ; stdout.
  mov   eax, 4          ; sys_write.
  int   0x80            ; Memanggil kernel.

  mov   eax, 1          ; Memanggil kernel (exit).
  int 0x80              ; Memanggil kernel.

section .data
msg db 'menampilkan 5 simbol ?', 0xa
len equ $ - msg
s2 times 5 db '?'
```
compile file dengan cara
```bash
nasm elf namafile.asm
ld -m elf_i386 -s -o namafile namafile.o
./namafile
```
Maka, output yang dihasilkan adalah
```
menampilkan simbol ?
?????
```

[lanjut ke materi berikutnya (pemanggilan sistem)](../04_pemanggilan_sistem)
