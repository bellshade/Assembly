section .data
    userInput   db  'Masukkan angka: '
    lenUserInput    equ $-userInput         ; panjang dari sebuah pesan input
    displayPesan    db 'Angka kamu : '
    lenDisplayPesan equ $-displayPesan

section .bss
    num resb    5

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, userInput
    mov edx, lenUserInput
    int 80h

    ; kemudian baca dan tampilakan hasil input
    mov eax, 3
    mov ebx, 2
    mov ecx, num
    mov edx, 5      ; 5 byte (numeric, 1 untuk identitas angka)
    int 80h

    ; kemudian tampilkan pesan 'Angka kamu: '
    mov eax, 4
    mov ebx, 1
    mov ecx, displayPesan
    mov edx, lenDisplayPesan
    int 80h

    ; membuat output dari nomor yang sudah di outputkan
    mov eax, 4
    mov ebx, 1
    mov ecx, num
    mov edx, 5
    int 80h

    ; exit dari program
    mov eax, 1
    mov ebx, 0
    int 80h