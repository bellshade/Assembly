# Assembly

<p align="center">
    <img src="https://64.media.tumblr.com/0b59866d4f23e8ab39804c5a7968725a/f1bfad800d8ac6c6-2c/s1280x1920/46ea723ba1703102f52abc356bc55f8c33ed0e48.gifv" width="600" height="400">
</p>

[![discord](https://img.shields.io/discord/722002048643497994?logo=discord&logoColor=white&style=for-the-badge)](http://discord.gg/S4rrXQU)
[![lisensi](https://img.shields.io/github/license/bellshade/Assembly?style=for-the-badge)](LICENSE)
![testing assembly](https://img.shields.io/github/workflow/status/bellshade/Assembly/assembly%20testing%20file?label=testing%20assembly&style=for-the-badge)

Repositori ini berisi kumpulan source code serta tutorial dari bahasa **assembly**. Sebelum itu, bacalah terlebih dahulu [peraturan dan pedomannya](CONTRIBUTING.md) yang dapat ditemukan pada ``COTRIBUTING.md``.

## installasi
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
    kemudian jalan berintah
    ```bash
    brew install nasm
    ```

- ![windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)

    installasi pada windows support pada arsitektur 64bit dengan file donwload dibawah ini
    [NASM windows installer](https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/win64/)
    
    sebelumnya install terlebih dahulu codeblocks [disini](https://www.codeblocks.org/downloads/)

    untuk tutorial lebih lanjut bisa diliat [disini](https://www.wikihow.com/Run-NASM-on-Windows)
    
