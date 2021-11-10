# instruksi kondisi

Esekusi bersyarat dalam bahasa assembly dilakukan dengan beberapa instruksi perulangan dan percabangan. instruksi ini dapat mengubah aliran kontrl dalam suatu program. eksekusi bersyarat diamati dalam dua skenario

1. lompatan tanpa syarat

    ini dilakukan oleh instruksi ``JMP``. eksekusi bersayart sering kali melibatkan transfer kontrol ke alamat instruksi yang tidak mengikuti instruksi yang sedang dieksekusi. transfer kontrol mungkin maju, untuk menjalankan serangkaian instruksi baru atau mundur, untuk menjalankan kembali langkah2 yang sama.

2. lompatan bersyarat

    ini dilakukan oleh satu set instruksi lompata ``J<kondisi>`` tergantung pada kondisinya. instruksi bersyarat mentransfer kontrol dengan memutus aliran sekuensial dan melakukan dengan mengubah nilai offset di dalam IP.

## instuksi cmp

instuksi ``cmp`` membandingkan dua operan. hal ini umumnya digunakan dalam eksesukis bersyarakt. instriksi ini pada dasarnya mengurangi satu operan dari yang lain untuk membandingkan apakah operan sama atau tidak. itu tidak menganggu tujuan atau sumber operan. digunakan bersama dengan instruksi lompatan bersyarat untuk pengambilan keputusan.

contoh
```assembly
CMP     tujuan, sumber
```
``cmp`` membandingkan dua bidang data numerik.operan tujuan dapat berupa register atau memori. operan sumber dapat berupa data, register, atau memori konstan.

contoh
```assembly
CMP DX,00 ; komparasi nilai dx dengan angka 0
JE L7     ; jika iya maka lompat ke label 7
.
.
L7:
....
```

cmp sering digunakan untuk membandingkan apakah nilai penghitung telah mencapai beberapa kali loop perlu dijalankan. contoh 
```assembly
INC     EDX
CMP     EDX, 10  ; komparasi apakah sudah mencapai angka 10
JLE     LP1      ; jika kurang dari atau sama dengan 10 maka lompat ke LP1
```

## lompatan tanpa syarat

seperti yang sudah diberitahukan sebelumnya, ini dilakukan oleh instruksi jmp. eksekusi bersyarat sering kali melibatkan transfer kontrol ke alamat instruksi yang tidak mengikuti instruksi yang sedang dieksekusi. transfer kontrol mungkin maju, untuk menjalankan serangkaia instruksi baru atau mundur.

contoh dari instruksi JMP memberikan nama label dimana aliran kontrol ditransfer segera.

```assembly
JMP     label
```

contoh lebih dari instruksi dari ``JMP``
```assembly
MOV  AX, 00    ; membuat AX ke 0
MOV  BX, 00    ; membuat BX ke 0
MOV  CX, 01    ; membuat CX ke 1
L20:
ADD  AX, 01    ; Increment AX
ADD  BX, AX    ; tambah bx ke ax
SHL  CX, 1     ; geser cx ke kiri, ini pada gilirannya menggandakan nilai CX
JMP  L20       ; mengulangi statement
```

## lompatan bersyarat

jika beberapa kondis tertentu dipenuhi dalam lompatan bersyarat, aliran kontrol ditransfer ke instruksi target. ada banyak instruksi lompatan bersyarat tergantung pada kondisi dan data.


| pentunjuk  | keterangan   | flag (label)   |
|------------|--------------|----------------|
| JE/JZ   | lompat sama atau lompat nol  | ZF                                         |
| JNE/JNZ  | lompat tidak sama atau lompat bukan nol  | ZF                            |
| JG/JNLE | lompat lebih besar atau lompat tidak kurang / sama  | OF, SF, ZF          |
| JGDE/JNL  | lompat lebih besar / sama atau lompat tidak kurang  | OF, SF            |
| JL/JNGE  | lompat lebih sedikit atau lompat tidak lebih besar / sama  | OF, SF      |
| JLE/JNG  | lompat lebih sedikit / sama atau lompat tidak lebih besar  | OF, SF, ZF  |

berikut dibawah ini adalah instruksi lompatan bersyarat yang digunakan pad adata tidak bertanda yang digunakan untuk operasi logika

| pentunjuk  | keterangan   | flag (label)   |
|------------|--------------|----------------|
| JE/JZ   | lompat sama atau lompat nol  | ZF                                         |
| JNE/JNZ  | lompat tidak sama atau lompat bukan nol  | ZF                            |
| JG/JNLE | lompat di atas atau lompat tidak di bawah / sama    | CF, ZF        |
| JGDE/JNL  | lompat di atas / sama atau lompat tidak di bawahh   | CF            |
| JL/JNGE  | lompat ke bawah atau lompat tidak ke atas / sama   | CF      |
| JLE/JNG  | lompat ke bawah / sama atau lompat tidak ke atas         | AF, CF  |


program berikut menampikan angka terbesar dari tiga variabel

```assembly
section .text
    global _start

_start:
    mov     ecx, [angka1]
    mov     ecx, [angka2]
    jg      check_angka_ketiga
    mov     ecx, [num2]

        chek_angka_ketiga:
    
    cmp     ecx, [angka3]
    jg      _exit
    mov     ecx, [amgka3]
        
        _exit:
    
    mov     [terbesar], ecx
    mov     ecx, msg
    mov     edx, len
    mov     ebx, 1  ; stdout
    mov     ebx, 4  ; syswrite
    int     0x80

    mov     ecx, terbesar
    mov     edx, 2
    mov     ebx, 1  ; stdout
    mov     eax, 4  ; syswrite
    int     0x80

    mov     eax, 1
    int     80h

section .data
    msg db 'angka yang paling besar adalah ', 0xA, 0xD
    len equ $- msg
    angka1 dd '52'
    angka2 dd '33'
    angka3 dd '12'

segment .bss
    terbesar resb 2s
```
        
