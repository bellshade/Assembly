# data numerik

data numerik umumnya direperesentasikan dalam sistem biner. instruksi aritmatika beroperasi pada data biner. bila angka ditampilkan di layar atau dimasukkan dari keyboard, angka tersebut dalam bentuk ascii.

contoh dari dalam bentuk ASCII ke biner untuk perhitungan aritmatika dan mengubah hasilnya kembali ke biner.

```assembly
section .text
    global _start

_start:
    mov eax, '3'
    sub eax, '0'

    mov ebx, '4'
    sub ebx, '0'
    add ead, ebx
    add eax, '0'
    
    mov [hasil], eax
    mov ecx, msg
    mov edx, len
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov ecx, sum
    mov edx, 1
    mob ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80

section .data
msg db 'hasilnya adalah'
len equ $ - msg
segment resb 1
```

konversi seperti itu, bagaimanapun memiliki overhead, dan pemograman bahasa assembly memungkinkan pemrosesan angka dengan cara yang lebih efisien, dalam bentuk biner. bilangan desimal dapat direpresentasikan dalam dua bentuk

- ascii form
- BCD atau bentuk desimal berkode biner

## representasi ASCII

dalam representasi ASCII, angka desimal disimpan sebagai string karakter ASCII. misalnya, nilai desimal 1234 disimpan sebagai
```
31  32  33  34H
```
dimana, 31H adalah nilai ascii untuk 1, 32H adalah nilai ascii untuk 2, dan seterusnya. ada empat instruksi untuk memproses angka dalam representasi ascii.

- AAA

    ascii sesuaikan setelah penambahan

- AAS

    ascii sesuaikan setelah pengurangan

- AAM

    ascii sesuaikan setelah perkalian

- AAD

    ascii sesuaikan sebelum divisi

instruksi ini tidak emngambil operan apa pun dan menganggap operan yang diperlukan berad di register AL.

contoh berikut menggunakan instruksi AAS.

```assembly
section .text
    global _start

_start:
    sub ah, ah
    mov al, '9'
    sub al, '3'
    aas
    or  al, 30h
    mov [res], ax

    mov edx, len
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 1
    mov ecx, res
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80

section .data
msg db 'hasilnya adalah ', 0xa
len equ $ - msg
section .bss
res resb 1
```

## representasi BCD

ada dua jenis representasi BCD
- representasi bcd yang belum diolah
- representasi bcd yang sudah dikemas

dalam reprsentasi bcd yang tidak dikemas, setiap byte menyimpan equivalen biner dari digit desimal. misalnya, angka 1234 disimpan sebagai
```
01  02  03  04H
```
ada dua instruksi untuk memproses angka berupa
- AAM yaitu ascii sesuaikan setelah perkalian
- AAD yaitu ascii sesuaikan setelah pembagian

empat instruksi penyesuaian ASCI, AAA, AAS, AAM dan AAD, juga dapat digunakan dengan representasi BCD yang belum dibongkar. Dalam representasi BCD yang dikemas, setiap digit disimpan menggunakan empat bit. Dua digit desimal dikemas menjadi satu byte. Misalnya, angka 1234 disimpan sebagai
```
12  34H
```
ada dua instruksi untuk pemroses angka-angka ini berupa
- DAA penyesuaian desimal setelah penambahan
- DAS desimal sesuaikan setelah pengurangan

tidak ada dukungan perkalian dan pembagian dalam representasi bcd yang dikemas

contoh berikut adalah mengjumlah dua angka desimal 5 digit dan menampilkan jumlahnya
```assembly
section .text
    global _start

_start:
    mov esi, 4
    mov ecx, 5

add_loop:
    mov al, [angka1 + esi]
    adc al, [angka2 + esi]
    aaa
    pushf
    or  al, 30h
    popf

    mov [sum + esi], al
    dec esi
    loop add_loop

    mov edx, len
    mov ecx, msg
    mov evx, 1
    mov eax, 4
    int 0x80
    
    mov edx, 5
    mov ecx, sum
    mov ebx, 1
    mov eax, 4
    int 0x80

section .data
msg db 'hasilnya adalah '
len equ $ - msg
num1 db '22222'
num2 db '33333'
sumb db '    '
```