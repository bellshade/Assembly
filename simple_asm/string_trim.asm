; contoh implementasi sederhana menghapus
; spasi di bagian awal dan juga di akhir string
; dari inputan dari user

section .data
  ; prompt untuk user
  prompt db "Masukkan string: ", 0
  hasil_pesan db "Hasil trim: [", 0
  hasil_akhir db "]", 10, 0  ; ditambahkan 10 (newline) agar rapi

section .bss
  ; dibuat maks 255 char + null
  buffer resb 256

section .text
  global _start

; entry point
_start:
  call print_prompt
  call read_input
  call trim_string
  call print_hasil
  call exit_program

print_prompt:
  ; ngeload address prompt (rel dihapus agar lebih aman dari bug NASM)
  mov rdi, prompt
  ; kemudian tail call ke print_string
  jmp print_string

read_input:
  xor rax, rax
  xor rdi, rdi
  mov rsi, buffer
  mov rdx, 255
  syscall

  ; cek error atau EOF
  test rax, rax
  ; jika kurang ata sama dari 0, return 0
  jle .empty

  ; hapus newline di akhir kalo ada
  cmp byte [rsi + rax - 1], 10 ; compare ini cek apakah karakter terakhir
                               ; adalah newline
  jne .no_newline
  ; kita kurangi panjang (tidak termasuk dari newline)
  dec rax

.no_newline:
  ; tambahin null terminator
  mov byte [rsi + rax], 0
  ret

.empty:
  mov byte [buffer], 0
  xor rax, rax
  ret

trim_string:
  push rbx
  push r12
  push r13
  push r14
  ; rbx = pointer ke string
  mov rbx, buffer

  ; hitung panjang si string
  call strlen
  ; r12 = panjang asli
  mov r12, rax
  ; cek string kosong atau tidak
  test rax, rax
  jz .done_empty
  
  ; cari start
  ; r13 = start index 0
  xor r13d, r13d

.find_start:
  cmp r13, r12
  jae .done_empty
  mov al, [rbx + r13]
  call is_whitespace
  test al, al
  
  ; kalo masih whitespace maka lanjut
  jnz .skip_start
  ; kalo bukan whitespace, berarti ketemu
  jmp .found_start

.skip_start:
  inc r13
  jmp .find_start

.found_start:
  mov r14, r12
  dec r14

.find_end:
  ; cek untuk apakah sudah melewati start
  cmp r14, r13
  jb .done_empty
  mov al, [rbx + r14]
  call is_whitespace

  test al, al
  jnz .skip_end
  jmp .found_end

.skip_end:
  dec r14
  jmp .find_end

.found_end:
  ; hitung panjang hasil
  ; Jadi kita pakai cara manual:
  mov rax, r14
  sub rax, r13
  inc rax
  mov r12, rax
  
  test r13, r13
  jz .no_shift

  lea rsi, [rbx + r13]
  mov rdi, rbx
  mov rcx, r12

.shift_loop:
  test rcx, rcx
  jz .shift_done
  mov al, [rsi]
  mov [rdi], al
  inc rsi
  inc rdi
  dec rcx
  jmp .shift_loop

.shift_done:
.no_shift:
  mov byte [rbx + r12], 0
  mov rax, r12
  pop r14
  pop r13
  pop r12
  pop rbx

  ret

.done_empty:
  mov byte [rbx], 0
  xor eax, eax
  pop r14
  pop r13
  pop r12
  pop rbx
  ret

is_whitespace:
  cmp al, ' '
  je .yes

  ; tab
  cmp al, 9
  je .yes

  ; newline
  cmp al, 10
  je .yes

  ; carriage return
  cmp al, 13
  je .yes

  xor al, al
  ret

.yes:
  mov al, 1
  ret

strlen:
  xor eax, eax

.loop:
  cmp byte [rbx + rax], 0
  je .done
  inc rax
  jmp .loop

.done:
  ret

print_hasil:
  mov rdi, hasil_pesan
  call print_string

  mov rdi, buffer
  call print_string

  mov rdi, hasil_akhir
  call print_string
  ret

print_string:
  push rbx
  push rcx

  ; simpan pointer
  mov rbx, rdi

  xor ecx, ecx

.len_loop:
  cmp byte [rbx + rcx], 0
  je .len_done
  inc ecx
  jmp .len_loop

.len_done:
  mov rax, 1
  mov rdi, 1
  mov rsi, rbx
  mov rdx, rcx
  syscall

  pop rcx
  pop rbx
  ret

exit_program:
  mov rax, 60
  xor rdi, rdi
  syscall
