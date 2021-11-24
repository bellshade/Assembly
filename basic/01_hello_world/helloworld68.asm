SECTION .data
pesan db    'bellshade', 0Ah

SECTION .text
global _start

_start:
    mov edx, 13
    mov ecx, pesan
    mov ebx, 1
    mov eax, 4
    int 80h

    mov ebx, 0  ; return 0 jika status exit bersifat error
    mov eax, 1  ; mengaktifkan SYS_EXIT (kernal opcode 1)
    int 80h
