<p align="center">
    <img src="https://c.tenor.com/3bTxZ4HdrysAAAAC/pixels-neon.gif">
</p>

# assembly :abacus:
bahasa assembly atau bahasa rakitan adalah bahasa pemograman tingkat rendah yang digunakan dalam pemograman komputer, mikroprosesor, pengendali mikro, dan perangkat lainnya yang dapat diprogram.

ada beberapa dasar alasan menggunakan bahasa rakita dari sudut pandang penggunaanya:
- bahasa rakitan dibandingkan dengan bahasa mesin

    basa rakitan merupakan representasi atas bahasa mesin yang dirancang agar lebih mudah dipahami oleh manusia. dengan menggunakan bahasa rakitan, seorang programmer dapat lebih mudah mengingat instruksi-instruksi dengan menggunakan simbol yag lebih dimengerti dibandingkan bila menggunakan simbol kode mesin secara langsung

- bahasa rakitan dibandingkan dengan bahasa tingkat tinggi

    bahasa rakitan memungkinkan programmer untuk mengontrol serta memanfaatkan secara penuh kapabilitas yang terdapat pada suatu perangkat keras, berbeda halnya dengan bahasa pemograman tingkat tinggi yang memiliki banyak keterbatasan dalam pemanfaatan secara penuh suatu perangkat keras. bahasa rakitan menjanjika tingkat unuk kerja yang maksimum kaerna sifatnya yang menerjemahkan secara langsung instruksi rakita menjadi instruksi mesin, berbeda halnya dengan bahasa pemograman tingkat tinggi yang biasanya menerjemahkan sebuah instruksi menjadi sejumlah kode mesin

dalam pemograman komputer bahasa assembly kadang-kadang disingkat asm, adalah bahasa pemograman tingkat rendah dimana ada korespondensi yang sangat kuat antara instruksi dalam bahasa dan instruksi kode mesin arsitektur. bahasa assembly biasanya memliki suatu pernyataan per instruksi mesin, teatpi konstant, komentar, arahan, assembler, label simbolis dari lokasi program dan memori, dan makro umumnya juga didukung.

kode perakitan diubah menjadi kode mesin yang dapat dieksekusi oleh program utilitas yang disebut dengan assembler.kata __assembler__ ini umumnya dikaitkan dengan willkes, wheller dan gill dalam buku tahun 1951 ciptaan mereka dalam __persiapan program untuk komputer digital elektronik__, yang bagaimanapun, menggunakan istilah berarti "sebuah program yang merakit program lain yang terdiri dari beberapa bagiuan menjadi satu program".

## sejarah dari bahasa assembly :date:

bahasa rakitan diperkenalkan ``kathleen booth`` berdasarkan karya teoritis yang dia mulai pada tahun 1947, saat bekerja di ARC2 di Birkbeck, university of london.

pada akhir 1948, eletronic delay storage automatic calculator memiliki assembler bernama **initial order** yang terintergrasi ke dalam program bootstrapnya. ini menggunakan mnemonik satu huruf yang dikembangkan oleh david wheeler, yang dikreditkan oleh IEEE computer society sebagai pencipta "*perakit*" pertama.

laporan tentang EDSAC memperkenalkan istilah "assembler" untuk menggabungkan bidang menjadi kata instruksi. SOAP ( **symbolic optimal assebmly**) adalah bahasa rakitan untuk komputer **IBM 650** ditulis oleh stan poly pada tahun 1955.

bahasa rakitan menghilangkan banyak pemograman generasi pertama yang rawan kesalahan, dan memakan waktu yang dibutuhkan dengan komputer paling awal, membaskan programmer dari kebosana sperti mengingat kode numerik dan menghitung alamat.

bahasa assembly pernah banyak digunakan untuk semua jenis pemograman. namun, pada 1980-an (1990 an pada mikrokomputer), penggunaanya sebagian besar telah digantikan oleh bahasa tingkat tinggi, dalam mencari peningkatan produktivitas pemograman. saat ini, bahasa rakitan masih digunakan untuk manipulasi perangkat keras langsung, akses ke instruksi prosesor khusus, atau untuk mengatasi masalah kinerja yang kritis. pengunaan yang umum adalah driver perangkat, sistem tertanam tingkat rendah dan sistem waktu nyata.

secara historis, banyak program telah ditulis seluruhnya dalam bahasa assembly. **the burroghs mcp (1961)** adalahh komputer pertama  yang sistem operasi tidak dikembangkan sepenuhnya dalam bahasa assembly.

## aplikasi umum dan penggunaan saat ini :computer:

- bahasa assembly biasanya digunakan dalam kode boot sistem, kode tingkat rendah yang menginisialiasi dan menguji perangkat keras sistem sebelum mem-boot sistem operasi dan sering disimpan ke dalam *ROM* (**BIOS** pada sistem pc yang kompatibel dengan IBM dan CP/M adalah contohnya).
- bahasa assembly sering digunakan untuk kode tingkat rendah, misalnya untuk **kernel sistem operasi**, yang tidak dapat mengandalkan ketersediaan panggilan sistem yang sudah ada sebelumnya dan memang harus mengimplementasikannya untuk arsitektur prosesor tertentu di mana sistem akan berjalan.
- beberapa kompiler untuk bahasa tingkat yang relatif rendah, seperti pascal atau c, memungkinkan program untuk menyematkan bahasa assembly secara langsung dalam kode sumber tersebut ( disebut **inline assembly**). program yang menggunakan fasilitas tersebut kemudian dapat membangun abstraksi menggunakan bahasa rakitan yang berbeda pada setiap platform perangkat keras. kode portable sistem kemudian dapat menggunakan komponen khusus prosesor ini melalui antarmuka yang seragam.
- bahasa assembly berguna dalam **reverse egineering**. banyak program hanya didistrubiskan dalam bentuk kode mesin yang mudah diterjemahkan ke dalam bahasa rakitan oleh disassembler, tetapi lebih sulit untuk diterjemahkan ke bahasa tingkat yang lebih tinggi melalui dekompiler. alat ini seperti **interactive disassembler** memanfaatkan pembongkaran secara ekstensif untuk tujuan seperti itu. teknik ini digunakan oleh peretas untuk memeachkan perangkat lunak komersial, dan pesaing untuk menghasilkan perangkat lunak dengan hasil serupa dari perusahaan asing.
- bahasa assembly digunakan untuk meningkatkan kecepatan eksekusi, terutama pada komputer pribade awal dengan daya pemrosesan dan RAM yang terbatas.
- assembler dapat dgunakan untuk menghasilan blok data, tanpa overhead bahasa tingkat tinggi, dari kode sumber yang diformat dan dikomentari, untuk digunakan oleh kode lain.

selalu ada perdebatan tentang kegunaan dan kinerja bahasa rakitan relatif terhadap bahasa tingkat tinggi. meskipun bahasa rakitan memiliki kegunaan khusus di tempat yang penting.

[pembahasan berikutnya](00_pemahaman)