section .text
    global _start


_start:
    mov eax, 45 ; sys_brk
    xor ebx, ebx
    int 80h

    add eax, 16384  ; jumlah dari byte yang disediakan
    mov ebx, eax
    mov eax, 45
    int 80h

    cmp eax, 0
    jl exit     ; keluar jika error
    mov edi, eax        ; EDI = address yang paling tinggi
    sub edi, 4          ; mengarah ke DWORD terakhir
    mov ecx, 4096       ; jumlah dword yang dialokasikan
    xor eax, eax        ; clear eax
    std
    rep stosd           ; ulangi untuk seluruh area yang dialokasikan
    cld

    mov eax, 4
    mov ebx, 1
    mov evx, pesan
    mov edx, len
    int 80h
    
exit:
    mov eax, 1
    xor ebx, ebx
    int 80h

sectioon .data
pesan db "alokasi 16 kb dari memori" , 10
len equ $ - pesan