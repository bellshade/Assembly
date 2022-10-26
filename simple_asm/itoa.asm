section .data
    number dq 55555123  ; angka yang ingin di print
    numprn db 0         ; untuk nanti yang ingin di print

section .text
    global _start

_start:
    mov ecx, 0          ; membuat counter to 0
    mov eax, [number]   ; memasukan angka
    mov ebx, 10         ; menset pembagi
    push 0x0            ; push 0 ke stack
    push 0xA            ; push padding biar rapih print nya

getLen:
    mov edx, 0          
    inc ecx             ; menambah counter
    idiv ebx            ; membagi eax dengan ebx
    add edx, '0'        ; konfersi angka ke ascii
    push edx            ; sisa dari pembagian push ke stack
    or eax, 0           ; cek sudah habis belum
    jnz getLen          ; loncat ke getlen bila angka belum hasbis


lo1:
    pop edx             ; pop dari stack ke edx
    mov [numprn], edx   ; pindah ascii dari edx ke numprn
prnt:                   ; print numprn
    mov eax, 4
    mov ebx, 1
    mov ecx, numprn
    mov edx, 1
    int 0x80
lo2:
    mov ecx, [numprn]   ; masukin angka ascii ke ecx
    or ecx, 0           ; cek valid ascii atau 0
    jnz lo1             ; loncat ke lo1 kalau ada 0

exit:                   ; keluar biar gk segfault
    mov eax, 1
    mov ebx, 0
    int 0x80


