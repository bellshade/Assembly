; typewriter_clock.asm - x86 Assembly (Linux ELF32)
; Typewriter clock: prints current time in terminal
; Compile: make
; Run: ./typewriter_clock

section .data
    msg db "00:00:00", 0       ; placeholder for HH:MM:SS
    len equ $ - msg
    newline db 0x0A, 0         ; newline

section .bss
    timebuf resb 9             ; HH:MM:SS\0

section .text
global _start

_start:
.loop:
    ; get current time from system
    mov eax, 13               ; sys_time
    xor ebx, ebx              ; time_t *tloc = NULL
    int 0x80

    ; simple conversion to HH:MM:SS (simplified)
    mov ecx, 3600             ; seconds per hour
    xor edx, edx
    div ecx                    ; eax/3600 -> quotient=hours, remainder=minutes+seconds
    add al, '0'
    mov [timebuf], al

    ; minutes
    mov eax, edx
    mov ecx, 60
    xor edx, edx
    div ecx
    add al, '0'
    mov [timebuf+3], al

    ; seconds
    mov al, dl
    add al, '0'
    mov [timebuf+6], al

    ; print with typewriter effect
    mov esi, timebuf
.print_loop:
    lodsb
    cmp al, 0
    je .done
    mov eax, 4
    mov ebx, 1
    mov ecx, esi
    dec ecx
    mov edx, 1
    int 0x80

    ; small delay
    mov ecx, 50000
.delay:
    loop .delay
    jmp .print_loop

.done:
    ; new line
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    jmp .loop
