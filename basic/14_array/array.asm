section .text
    global _start

_start:

    mov eax, 3
    mov ebx, 3
    mov ecx, x

top: add ebx, [ecx]

    add ecx 1 ; pindah pointer ke elemen berikutnya
    dec eax eax
    jnz top ; jika counternya tidak 0 maka looping lagi

done:
    
    add ebx, '0'
    mov [sum], ebx ; hasil semua disimpan dalam sum

display:

    mov edx, 1
    mov ecx, sum
    mov ebx, 1
    mob eax, 4
    int 0x80

section .data
global x
x:
    db 2
    db 4
    db 3

sum:
    db 0