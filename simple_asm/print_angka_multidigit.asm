;program untuk print angka lebih dari 1 digit
;algoritma nya adalah dibagi dulu setelah itu assign hasil bagi tersebut ke beberapa variable
;untuk lebih jelasnya silahkan kunjungi link berikut:
;link: https://pvk.ca/Blog/2017/12/22/appnexus-common-framework-its-out-also-how-to-print-integers-faster/

section .data
	num dd 79000

section .bss
	;variable untuk mendapatkan jumlah digit
	counter resb 1

section .text
	global _start

_start:

get_digit:
	;increment digit ketika looping
	mov eax,[counter]
	inc eax
	mov [counter],eax

	; initial value yang akan di bagi
	mov edx, 0
	mov eax, [num]
	mov ecx, 10

	;bagi nilai yang variable num sekarang
	div ecx 

	;convert ke ascii nilai mod yang didapat dari pembagian dan push ke stack
	add edx, byte '0'
	push edx

	;memperbarui nilai variable num dengan nilai baru hasil pembagian
	mov [num],eax

	;check apakah nilai variable num sekarang besar dari 10 jika iya looping kembali
	mov eax,[num]
	cmp eax,10
	jg get_digit

	;ketika variable num sudah bernilai 10, ambil hasil bagi di num sekarang dan push ke stack
	add [num], byte '0'
	mov eax, [num]
	push eax

	;print angka yang sudah di push ke stack
print_number:
	mov eax,4				;sys_write
	mov ebx,1				;file descriptor std_out
	mov ecx,esp				
	mov edx,1
	int 0x80

	;pop esp untuk mendapatkan nilai valu ascii selanjutnya
	add esp,4

	;decrement valu counter yang didapatkan sebelumnya
	mov ecx,[counter]
	dec ecx
	mov [counter],ecx

	;compare counter untuk kondisi loop
	cmp ecx,0
	jge print_number

	;sys_exit kernel
	mov eax,1
	mov ebx,0
	int 0x80