;program untuk menconvert input dari user menjadi angka karena input yang di dapat
;berupa karakter ascii bukan angka
;atau program ini atoi pada bahasa c dengan versi saya sendiri
;algoritmanya adalah kali sepuluh hasil yang ditampung terus ditambah dengan digit baru


section .data
	num db 0

section .text
	global _start

_start:
	;code here
	mov eax,3				;sys_read
	mov ebx,0				;file desceiptor stdin
	mov ecx,num
	mov edx,3
	int 0x80

	mov edi,num

	mov al, byte 0	;hasil perkalian

get_char:

	movzx edx, byte[edi] ;mov one byte edi to edx / dl 

	cmp dl,48	;jika kurang dari 0 end program
	jl end

	cmp dl,57	;jika lebih dari 9 end program
	jg end

	mov bl,byte [edi]
	sub bl, byte '0'
	mov dl, byte 10

	mul dl		;kali angka
	add al,bl	;tambahkan hasil perkalian dengan digit input

	inc edi		;char selanjutnya
	jmp get_char


	;hasil nya berada pada register eax tepatnya di al
end:
	mov eax,1
	mov ebx,0
	int 0x80