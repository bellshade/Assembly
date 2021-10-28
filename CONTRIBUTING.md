# *Contributing*

***Contributor***

Kami sangat senang anda telah ikut berkontribusi dalam tutorial
dari assembly! (dengan arsitektur cpu x86),

- Hasil pekerjaan kamu adalah buatan kamu sendiri dan tidak ada hak cipta dari orang lain. Jika kami menemukan kesamaan, maka tidak kami *merge*.
- Hasil kerja kamu akan berlisensi [MIT](LICENSE) ketika *pull request* kamu sudah di-*merge*.
- Hasil kerja kamu wajib mengikuti standar dan *style* koding dari kami.
- Hanya menerima *file* dengan ekstensi ``*.asm`` dan ``makefile`, selain itu dibuat pengecualian dengan menjelaskan secara detail.

## installasi
kami menggunakan [NASM](https://www.nasm.us/) dengan cara
- debian (deb)
    ```bash
    sudo apt-get install nasm
    ```
    kemudian cek versi dari nasm dengan cara
    ```bash
    nasm --version
    ```
- arch (rpm)
    untuk user rpm bisa install dengan menggunakan perintah ``dnf`` atau ``yum`` dengan install ``nasm.repo`` di ``/etc/yum/yum.repos.d``
    **nasm.repo`**
    ```
    [nasm]
    name=The Netwide Assembler
    baseurl=http://www.nasm.us/pub/nasm/stable/linux/
    enabled=1
    gpgcheck=0

    [nasm-testing]
    name=The Netwide Assembler (release candidate builds)
    baseurl=http://www.nasm.us/pub/nasm/testing/linux/
    enabled=0
    gpgcheck=0

    [nasm-snapshot]
    name=The Netwide Assembler (daily snapshot builds)
    baseurl=http://www.nasm.us/pub/nasm/snapshots/latest/linux/
    enabled=0
    gpgcheck=0
    ```
- MacOs
    lakukan printah dengan menekan ``command + spasi`` untuk membuka terminal kemudian lakukan perintah install homebrew
    ```bash
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 2> /dev/null
    ```
    kemudian jalan berintah
    ```bash
    brew install nasm
    ```

**Jalankan file asm**
kamu bisa mencompile dan running dengan cara
```
nasm -f elf32 -o namafile.o namafile.asm
ld -m elf_i386 -o namafile namafile.o
./namafile
```
```
nasm -f elf namafile.o
nasm -m elf_i386 -s -o namafile namafile.o
```

## panduan kontribusi
- setiap perubahan dari kamu harus menghasil output yang sesuai dari
- menggunakan ``snake_case`` untuk penaamaan file 
- tiap satu tutorial atau implementasi harus di dalam satu folder sebagai contoh
```
hitung_variabel
├── README.md (penjelasan)
├── hitungVariabel.asm
```


## *Pull Request*

***Pull request* yang baik**

Informasi: gunakan [*issue*](https://github.com/bellshade/Assembly/issues) apabila ingin menambahkan kode atau implementasi tutorial, dll (*basic*) agar tidak ada konflik dengan *pull request* lainnya.

- Lakukan penjelasan deskripsi perubahan yang anda lakukan pada repositori kami dengan membuat penjelasan di [*issue*](https://github.com/bellshade/Assembly/issues).
- Setelah menjelaskan perubahan anda di [*issue*](https://github.com/bellshade/Assembly/issues) kemudian lakukan *fork* pada repositori kami.
- Setelah melakukan *fork*, anda dibebaskan untuk mengubah atau menambah tutorial.
- Setelah merubah-rubah atau menambahkan algoritma serta melakukan tes lokal kode kamu, usahakan kamu membuat *local branch* baru:
  ```bash
  git checkout -b <branch_name>
  git add . # atau git add nama_perubahan_kamu.py
  git commit -m "feat: menambahkan tutorial terbaru"
  ```
- Lakukan *push* ke *branch* kamu dan kemudian *open pull request*.


**Saran pesan commit**

- `feat:` untuk menambah algoritma atau tambahan lainnya;
- `fix:` untuk mengubah algoritma yang sudah ada atau memperbaiki;
- `docs:` untuk mengubah atau membuat dokumentasi;
- `add:` untuk menambah algoritma atau tambahan lainnya (opsional); 

Catatan: pesan commit harus menjelaskan perubahan secara singkat.

Contoh: 
- &#9746; feat: test_x.py
- &#9745; feat: tambah unittest untuk algoritma x

Lebih lengkapnya bisa dilihat di:
- [EN](https://www.conventionalcommits.org/en/v1.0.0/)
- [ID](https://www.conventionalcommits.org/id/v1.0.0/)

Pull request akan di-*merge* jika:

- mengikuti standar dan arahan dari `CONTRIBUTING.md`;
- lulus tes dan cek dari beberapa tes yang sudah kami siapkan.

**Tambahan**:

- Jika ada kendala atau masalah dalam *pull request*, kamu bisa laporkan masalahnya dalam [issue](https://github.com/bellshade/Assembly/issues).
- Jika ada tes yang tidak lewat atau gagal, kami akan cek kembali perubahan anda.

Untuk *pull request*, disarankan untuk menjelaskan secara detail yang kamu ubah atau tambahkan, dan bersikap sopan serta selalu berterima kasih. Itu salah satu bentuk tata krama yang baik terhadap sesama *contributor* dan *programmer* lainnya.
