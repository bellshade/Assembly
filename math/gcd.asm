; program sederhana untuk 
; faktor persekutuan terbesar
; dalam assembly arsitektur
; 64 bit

segment .data
a: dq 2
b: dq 2
fmt: dq "GCD : %lld", 10, 0
fmt_in: dq "%lld", 0

segment .text
global main
extern printf
extern scanf

main:

    push rbp
    mov rax, 0
    mov rsi, a
    mov rdi, fmt_in
    call scanf

    mov rax, 0
    mov rsi, b
    mov rdi, fmt_in
    call scanf

    mov rax, 0
    mov rbx, 0
    mov rax, [a]
    mov rbx, [b]

WHILE:
    mov rdx, 0
    idiv rbx
    cmp rdx, 0
    jz LAST
    mov rax, rbx
    mov rbx, rdx
    jmp WHILE

LAST:
    mov rax, 0
    mov rdi, fmt
    mov rsi, rbx
    call printf

mov rax, 0
pop rbp
ret
