global main
extern printf

section .text

; Membuat fungsi untuk mengecek palindrome

is_palindrome:
    push rbp
    mov rbp, rsp

    ; Input string
    mov rdi, qword [rbp + 24]
    
    ; Menghitung panjang string
    mov rdx, qword [rbp + 16]
    mov rcx, rdx
    shr rcx, 1
    mov rax, 1

; Fungsi untuk memulai mengecek awal palindrome
palindrome_start:
    cmp rcx, 0
    jl palindrome_end

    mov rbx, rdx
    sub rbx, rcx
    sub rbx, 1
    mov bl, byte[rdi + rbx]
    cmp byte [rdi + rcx], bl
    jne palindrome_gagal
    dec rcx
    jmp palindrome_start

; Fungsi jika string tidak palindrome
palindrome_gagal:
    mov rax, 0

; Fungsi untuk mengakhiri megecek palindrome
palindrome_end:
    pop rbp
    ret

; Print angka string yagn tersimpan
printnum:
    push rbp
    mov rbp, rsp
    sub rsp, 8
    mov rsi, rdi
    mov rdi, pesan
    mov qword [rbp - 8], 0
    mov al, 0
    call printf
    mov rsi, 0
    mov rax, rsi
    add rsp, 0
    pop rbp
    ret

main:
    push qword Input
    push qword [len]
    call is_palindrome
    add rsp, 16
    mov rdi, rax
    call printnum
    ret

section .data

input db 'radar', 0
len dq 7
pesan db 'Hasil: %d', 0x0A, 0x0D, 0
