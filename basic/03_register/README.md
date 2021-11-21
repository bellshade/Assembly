# Register Assembly

Operasi prosesor sebagian besar melibatkan pemrosesan data. Data ini dapat disimpan dalam memori dan diakses dari sana. Namun, membaca data dari dan menyimpan data ke dalam memori memperlambat prosesor, karena melibatkan proses pengiriman permintaan data yang rumit melalui bus kontrol dan ke dalam unit penyimpanan memori dan mendapatkan data melalui saluran yang sama.

Untuk mempercepat operasi prosesor, prosesor menyertakan beberapa lokasi penyimpanan memori internal, yang disebut **register**.

Register menyimpan elemen data untuk diproses tanpa harus mengakses memori. Sejumlah register terbatas dibangun ke dalam chip prosesor.


## register processor

ada sepuluh register prosesor a32 bit dan enam 16 bit dalam arsitektur IA-32. register dikelompokkan menjadi tiga kategori

1. register umum
2. kontrol register
3. register segmen

register umum dibagi lagi menjadi kelompok-kelompok berikut

1. register data
2. register penunjuk
3. register indeks


## daftar data
empat register data 32 bit digunakan untuk operasi aritmatika, logika, dan lainnya, register 32 bit ini dapat digunakan dalam tiga cara

1. sebagai register data 32 bit lengkap: EAX, EBX, ECX, EDX
2. bagian bawah register 32 bit dapat digunakan sebagai empat register data 16 bit: AX, BX, CX, dan DX
3. bagian yang lebih rendah dan lebih tinggi dari empat register 16 bit yang disebutkan di atas dapat digunakan sebagi delapa register 8 bit: AH, AL, BH, BL, CH, CL, DH, dan DL


- **AX adalah akumulator utama**

  digunakan dalam input/output dan sebagai besar instruksi aritmatika. Misalnya, dalam operasi perkalian, satu operan disimpan di register EAX atau AX atau AL sesuai dengan ukuran operan.

- **BX dikenal sebagai register dasar**
  
  karena dapat digunakan dalam pengalamatan terindeks

- **CX dikenal sebagai register hitung**

  karena register ECX, CX menyimpan jumlah loop dalam oeprasi iteratif

- **DX dikenal sebagai register data**

  ini juga digunakan dalam operasi input/output. ini juga digunakan dengan register AX bersama dengan DX untuk operasi perkalian dan pembagian yang melibatkan nilai besar

## register penunjuk

register penunjuk adalah register EIP, ESP, EBP 32 bit dan bagian kanan 16 bit yang sesuai IP,SP, BP, ada tiga kategori register pointer

1. **instruksi pointer (IP)**

  register IP 16 bit menyimpan alamat offset dari isntruksi berikutnya yang akan dieksekusi. IP yang terkait dengan register CS (sebagai CS:IP) memberikan alamat lengkap  dari instruksi saat ini di segmen kode

2. **stack pointer (SP)**

  register SP 16 bit memberikan nilai offset dalam tumpukan program. SP dalam hubungannya dengan register SS (SS:SP) mengacu pada posisi data atau alamat saat ini dalam tumpukan program.

3. **Base pointer (BP)**
  
  register BP 16 bit terutama membantu dalam mereferensikan variabel parameter yang diterukan ke subrutin. Alamat di register SS digabungkan dengan offset di BP untuk mendapatkan lokasi parameter. BP juga dapat digabungkan dengan DI dan SI sebagai register dasar untuk pengalamatan khusus

## dafter indeks

register index 32 bit, ESI dan EDI, dan bagian paling kanan 16 bitnya, SI dan DI, digunakan untuk pengalamatan berindeks dan terkadang digunakan untuk penjumlahan dan pengurangan. ada dua set penunjuk indeks.

1. **source index (SI)** digunakan sebagai indeks sumber untuk operasi string.
2. **destination index (DI)** digunakan sebagi indeks tujuan untuk operasi string.

## kontrol Register

register pointer instruksi 32 bit dan register fla 32 bit digabungkan dianggap sebagi register kontrol.

banyak instruksi melibatkan perbandingan dan perhitungan matematis dan mengubah status flag dan beberapa instruksi bersyarat lainnya menguji nilai flah status ini untuk membawa aliran kontrol ke lokasi lain

bit flag yang umum adalah:

- **overflow flag (OF)**

  menunjukkan overflow dari bit orde tinggi (bit paling kiri) data setelah operasi arimatika yang ditandatangi

- **direction flag (DF)**

  menentukan arah kiri atau kanan untuk memindahkan atau membandingkan data string. ketika nilai DF adalah 0, operasi string mengambil arah kiri- ke kanan dan ketika nilai diatur ke 1, operasi string mengambil arah kana-ke-kiri.

- **interrupt flag (IF)**

  menentukan apakah interupsi eksternal seperti entri keyboard, dll., akan diabaikan atau diproses. Ini menonaktifkan interupsi eksternal saat nilainya 0 dan mengaktifkan interupsi saat disetel ke 1.


- **trap flag (TF)**

  memungkinkan pengaturan operasi processor dalam mode satu langkah. program DEBUG yang digunakan untuk menyetel flag trap, segingga dapat melangkah melaluieksekusi satu instruksi pada satu waktu.


- **sign flag (SF)**

  menujukkan tanda hasil operasi aritmatika. flag ini diatur sesuai dengan tanda item data setelah operasi aritmatika. Tanda tersebut ditunjukkan dengan orede tinggi dari bit paling kiri. hasil positif menghapus nilai SF ke 0 dan hasil negatif menetapkannya ke 1.

- **zero flag (ZF)**

  ini menunjukkan hasil dari operasi aritmatika atau perbandingan. hasil bukan nol menghapus bendera nol ke 0. dan hasil nol menetapkannya ke 1.

- **auxiliary carry flag (AF)**

  ini berisi carry dari 3 ke bit 4 setelah operasi aritmatika; digunakan untuk aritmatika khusus. AF diatur ketika operasi aritmatika 1-byte menyebabakan carry dari bit 3 ke bit 4.

- **Parity Flag(PF)**
  menunjukkan jumlah total 1-bit dalam hasil yang diperolah dari operasi aritmatika. jumlah 1 bit yang genap menghapus parity flag menjadi 0 dan jumlah 1 bit ganjil menetapkan bendera paritas menjadi 1.

- **carry flag(CF)**

  ini berisi carry 0 atau 1 dari bit orde tinggi (paling kiri) setelah operasi aritmatika. itu juga menyimpan isi bit terakhir dari operasi __shift__ atau __rotate__


## register segmen

segmen adalah area spesifik yang ditentukan dalam program untuk memuat data, kode dan tumpukan atau stack. ada tiga segmen utama

1. segmen kode

  berisi semua instruksi yang akan diekskusi. register segmen kode 16 bit atau register CS menyimpan alamat awal segmen kode.

2. segmen Data

  berisi data, kostanta, dan area kerja, register segmen data 16 bit atau register DS menyimpan alamat awal segmen data .

4. stack segmen

  iniberisi data dan alamat kembali dari prosedur atau subrutin. ini diimplementasikan dsebagai struktur data stack. register stack segment atau register SS menyimpan alamat awal stack.


selain register, DS, CS dan SS, ada register segmen tambahan lainnya, ES (segmen ekstra), FS dan GS yang menyediakan segmen tambahan untuk menyimpan data.

Dalam pemrograman perakitan, sebuah program perlu mengakses lokasi memori. Semua lokasi memori dalam segmen relatif terhadap alamat awal segmen. Segmen dimulai di alamat yang habis dibagi 16 atau 10 heksadesimal. Jadi, digit heksadesimal paling kanan di semua alamat memori tersebut adalah 0, yang umumnya tidak disimpan dalam register segmen.

Register segmen menyimpan alamat awal segmen. Untuk mendapatkan lokasi yang tepat dari data atau instruksi dalam segmen, nilai offset (atau perpindahan) diperlukan. Untuk mereferensikan setiap lokasi memori dalam suatu segmen, prosesor menggabungkan alamat segmen dalam register segmen dengan nilai offset lokasi tersebut.

Perhatikan program sederhana berikut ini untuk memahami penggunaan register dalam pemrograman assembly. Program ini menampilkan 9 bintang di layar bersama dengan pesan sederhana


```Assembly
section .text
  global _start

_start:
  mov   edx, len        ; panjang pesan
  mov   ecx, msg        ; pesan yang akan di write
  mov   ebx, 1          ; stdout
  mov   eax, 4          ; sys_write
  int   0x80            ; memanggil kernel

  mov   edx, 9          ; panjang dari pesan
  mov   ecx, s2         ; pesan yang akan di write
  mov   ebx, 1          ; stdout
  mov   eax, 4          ; sys_write
  int   0x80            ; memanggil kernel

  mov   eax, 1          ; memanggil kernel (exit)
  int 0x80              ; memanggil kernel

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
maka output yang dihasilkan adalah
```
menampilkan simbol ?
?????
```

[lanjut ke materi berikutnya (pemanggilan sistem)](../04_pemanggilan_sistem)