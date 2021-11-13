SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

segment .data
    pesan_input     db  'masukkan angka ', 0xA, 0xD
    panjang_pesan_input equ $- pesan_input

    pesan_input2    db  'masukkan angka kedua ', 0xA, 0xD
    panjang_pesan_input2 equ $- pesan_input2

    pesan_hasil    db  'hasilnya adalah '
    panjang_pesan_hasil   equ $- pesan_hasil

segment .bss

    angka1  resb    2
    angka2  resb    2
    res     resb    1

section .text
    global _start

_start:
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, pesan_input         
    mov edx, panjang_pesan_input
    int 0x80                

    mov eax, SYS_READ 
    mov ebx, STDIN  
    mov ecx, angka1 
    mov edx, 2
    int 0x80            

    mov eax, SYS_WRITE        
    mov ebx, STDOUT         
    mov ecx, pesan_input2          
    mov edx, panjang_pesan_input2 
    int 0x80

    mov eax, SYS_READ  
    mov ebx, STDIN  
    mov ecx, angka2 
    mov edx, 2
    int 0x80        

    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, pesan_hasil          
    mov edx, panjang_pesan_hasil  
    int 0x80

    ; pindah nomor pertama ke register EAX dan angka kedua ke EBX
    ; dan subtrak ascii '0' dan convert ke angka desimal

    mov     eax,    [angka1]
    sub     eax,    '0'

    mov     ebx,    [angka2]
    sub     ebx,    '0'
    
    ; tambah eax dan ebx
    add eax, ebx
    add eax, '0'

    mov [res], eax

    ; tampilkan hasil
    mov eax, SYS_WRITE        
    mov ebx, STDOUT
    mov ecx, res         
    mov edx, 1        
    int 0x80

exit:
    mov eax,    SYS_EXIT
    xor ebx,    ebx
    int 0x80