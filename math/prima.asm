
section .text
global _start

_start:
    mov rax, 4
    mov rbx, 1
    mov rcx, hello
    mov rdx, helloLen
    int 80h

    ; memuat data dari keyboard ke variabel nomor
    mov rax, 3
    mov rbx, 0
    mov rcx, angka
    mov rdx, angkaLen
    int 80h

    mov rcx, 2
    mov rax, angka
    mov rsi, angka

    loop:
        xor rdx, rdx
        mov rax, rsi
        cmp rcx, rsi
        jae prima

        div rcx

        or rdx, rdx
        jz bukanPrima

        inc rcx

        jmp loop

    bukanPrima:
        mov rax, 1
        mov rbx, 1
        mov rsi, no
        mov rdx, noLen
        syscall

        mov rax, 60
        syscall

    prima:
        mov rax, 1
        mov rbx, 1
        mov rsi, yes
        mov rdx, yesLen
        syscall

        mov rax, 60
        syscall

section .data

    hello db "Masukkan angka: "
    helloLen equ $ - hello

    no db "Bukan angka prima"
    noLen equ $ - no

    yes db "Angka prima"
    yesLen equ $ - yes

    angka db 1
    angkaLen equ $ - angka