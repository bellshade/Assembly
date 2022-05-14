; program sederhana untuk mengecek
; angka ganjil atau genap
; dengan nasm arsitektur 64 bit

segment .data
a: dq 2
b: dq 2
fmt_genap: dq "%lld adalah genap", 10, 0
fmt_ganjil: dq "%lld adalah ganjil", 10, 0
fmt_in: "%lld", 0

segment .text
global main
extern printf
extern scanf

main:
push rbp
push rax, 0
mov rsi, a
mov rdi, fmt_in
call scanf

mov rax
mov rdx, 0
mov rax, [a]
test rax, 1
jz ELSE
mcv rdi, fmt_ganjil
mov rsi, [a]
jmp LAST
ELSE:
    mov rdi, fmt_genap
    mov rsi, [a]
    jmp LAST

LAST:
    mov rax, 0
    call printf

mov rax, 0
pop rbp
ret
