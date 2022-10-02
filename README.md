# Assembly :abacus:

<p align="center">
    <img src="https://64.media.tumblr.com/0b59866d4f23e8ab39804c5a7968725a/f1bfad800d8ac6c6-2c/s1280x1920/46ea723ba1703102f52abc356bc55f8c33ed0e48.gifv" width="600" height="400">
</p>

[![discord](https://img.shields.io/discord/722002048643497994?logo=discord&logoColor=white&style=for-the-badge)](http://discord.gg/S4rrXQU)
[![lisensi](https://img.shields.io/github/license/bellshade/Assembly?style=for-the-badge)](LICENSE)
![testing assembly](https://img.shields.io/github/workflow/status/bellshade/Assembly/assembly%20testing%20file?label=testing%20assembly&style=for-the-badge)

Repositori ini berisi kumpulan source code serta tutorial dari bahasa [**assembly**](basic/README.md). Sebelum itu, bacalah terlebih dahulu [peraturan dan pedomannya](CONTRIBUTING.md) yang dapat ditemukan pada ``COTRIBUTING.md``.

| Langkah |              Topik               |                                  Target Pembelajaran                                  |            Materi Rujukan                    |
| :-----: | :------------------------------: | :-----------------------------------------------------------------------------------: | :----------------------------------:         |
|   01    | pemahaman dari bahasa assembly   | Memahami konsep dasar dari pemograman assembly sebelum masuk ke langkah berikutnya    |  [Materi](basic/00_pemahaman)                |
|   02    |            hello world!          |                              Hello world !                                            |     [Materi](basic/01_hello_world)           |
|   03    |          semegmentasi memori     |                 Memahami konsep dasar segmentasi memori                               |      [Materi](basic/02_memory_segment)      |
|   04    |             register             |                      Memahami konsep dari register pada assembly                      |      [Materi](basic/03_register)             |
|   05    |         pemanggilan sistem       |                         Memahami konsep dasar pemanggilan sistem assembly             |       [Materi](basic/04_pemanggilan_sistem)  |
|   06    |         mode adressing           |                        Memahami dari mode adressing assembly                          |    [Materi](basic/05_addressing_mode)        |
|   07    |          variabel                |                     Memahami konsep dasar dari variabel pada assembly                 | [Materi](basic/06_variabel)                  |
|   08    |            konstant              |            Memahami konsep dari konstant dari assembly                                |     [Materi](basic/07_konstant)              |
|   09    |         fungsi aritmatika        |                   Memahami konsep dasar aritmatika assembly                           |       [Materi](basic/08_fungsi_aritmatika)   |
|   10    |          instruksi logika        |                    Memahami konsep dasar logika assembly                              |    [Materi](basic/09_instruksi_logika)       |
|   11    |         instruksi kondisi        |                       Memahami instruksi kondisi pada assembly                        | [Materi](basic/10_instruksi_kondisi)         |
|   12    |            perulangan            |                         Memahami konsep dasar perulangan pada assembly                |     [Materi](basic/11_perulangan)            |
|   13    |          data_angka              |                         Memahami tentang data angka pada assembly                     |      [Materi](basic/12_data_angka)           |
|   14    |              string              |                         Memahami tentang string pada assembly                         |      [Materi](basic/13_string)               |
|   15    |              array               |                         Memahami tentang basic array pada assembly                    |      [Materi](basic/14_array)                |
|   16    |           prosedur               |                      Memahami tentang basic prosedur pada assembly                    |      [Materi](basic/15_prosedur)             |
|   17    |           rekursif               |                      Memahami tentang basic rekursif pada assembly                    |      [Materi](basic/16_rekursif)             |
|   18    |             makro                |                      Memahami tentang basic makro                                     |      [Materi](basic/17_makro)                |
|   19    |           manejemen file         |                      Memahami tentang basic tentang manajemen file                    |   [Materi](basic/18_manejemen_file)          |
|   20    |           manajemen memori       |                      Memahami tentang basic manajemen memori                          |   [Materi](basic/19_manajemen_memori)        |


## installasi :desktop_computer:
-  ![linux_badge](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

    - debian based (deb)
        install melalui terminal dengan perintah
        ```bash
        sudo apt-get install nasm
        ```
        cek versi dari nasm 
        ```
        nasm --version
        ```

    - rpm (arch, fedora)
        instal melalui perintah dari ``dnf`` atau ``yum`` dengan install ``nasm.repo`` di ``etc/yum/yum.repos.d``
        file ``nasm.repo``
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
- ![macOs](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=apple&logoColor=white)

    lakukan perintah pada teriminal dengan perintah brew (untuk membuka terminal dilakukan dengan cara tombol ``command + spasi``)
    ```bash
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 2> /dev/null
    ```
    kemudian jalankan perintah
    ```bash
    brew install nasm
    ```

- ![windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)

    installasi pada windows support pada arsitektur 64bit dengan file donwload dibawah ini
    [NASM windows installer](https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/win64/)
    
    sebelumnya install terlebih dahulu codeblocks [disini](https://www.codeblocks.org/downloads/)

    untuk tutorial lebih lanjut bisa diliat [disini](https://www.wikihow.com/Run-NASM-on-Windows)

# :star_struck: Ayo ikut kami dan berkontribusi :star_struck:

Bantuan kalian diperlukan agar berllshade dapat lebih jauh lagi membantu anak-anak indonesia belajar _programming_,

> "Dengan bellshade, aku jadi bisa _ngoding_! Terima kasih Bellshade!"

Kami sangat senang bila kalian ingin melakukan kontribusi pada repositori **assembly** ini. Tapi, sebelum itu, silahkan baca terlebih dahulu [peraturan dan pedomannya](CONTRIBUTING.md) yang telah kami siapkan. Terima kasih.

Untuk informasi lebih lanjut, mari gabung dalam komunitas [Discord Channel WPU](http://discord.gg/S4rrXQU)

