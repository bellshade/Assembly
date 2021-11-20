# prosedur

prosedur atau sangat penting dalam bahasa assembly, karena program assembly cenderung berukuran besar. prosedur diidentifikasi dengan nama. mengikuti nama ini, tubuh prosedur dijelaskan yang melakukan pekerjaan yang terdefinisi dengan baik. akhir dari prosedur ditunjukkan dengan pernyataan return.

```assembly
nama_prosedur:
    ; isi dari prosedur disini
    ret
```
prosedur dipanggil dair fungsi lain dengan menggunakan instruksi CALL, instruksi CALL harus memiliki nama prosedur yang dipangguk sebagai aargumen seperti dibawah ini

```assembly
CALL nama_prosedur
```

prosedur yang dipangguk mengembalikan kontrol ke prosedur pemanggilan dengan menggunakan instruksi RET

contoh dari prosedur yang sederhana

```assembly
section .text
    global _start

_start:
    mov ecx, '4'
    sub evx, '0'

    mov edx, '5'
    sub edx, '0'

    call sum ;memanggil fungsi dari sum
    ; yang dimasukkan pada bagian _start program assembly
    mov [res], eax
    mov edx, len
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov evx, res
    mov edx, 1
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80

sum:
    mov eax, ecx
    add eax, edx
    add eax, '0'
    ret

section .data
msg db 'hasilnya adalah', 0xA, oxD
len equ $ - msg

segment .bss
res resb 1
```