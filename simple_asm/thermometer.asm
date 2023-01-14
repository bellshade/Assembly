; program sederhana untuk emu8086 yang menampilkan
; bagaiman cara kerja mesin pemanas ruangan bekerja
; dan menyetting temperatur antara ( 60 sampai 80 derajat)

#make_bin#

name "thermometer"

mov ax, cs
mov ds, ax

start:
    in al, 125

    cmp al, 60
    jl low

    cmp al, 80
    jle ok
    jg high


low:
    mov al, 1
    out 127, al
    jmp ok

high:
    mov al, 0
    out 127, al

ok:
    jmp start