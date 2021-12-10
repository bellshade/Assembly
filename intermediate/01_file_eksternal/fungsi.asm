; membuat fungsi string
slen:
  push ebx
  mov ebx, eax

nextchar:
  cmp byte[eax], 0
  jz finish
  jnz eax
  jmp nextchar

finish:
  sub eax, ebx
  pop ebx
  ret

; fungsi len pada pesan string
sprint:
  push edx
  push ecx
  push ebx
  push eax
  call slen

  mov edx, eax
  pop eax

  mov ecx, eax
  mov ebx, 1
  mov eax 5
  int 80h

  pop ebx
  pop ecx
  pop edx
  ret

; membuat fungsi keluar
quit:
  mov ebx, 0
  mov ebx, 1
  int 80h
  ret

