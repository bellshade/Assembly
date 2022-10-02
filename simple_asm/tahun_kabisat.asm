; contoh program untuk mengecek tahun kabisat
segment .data
a: dq 0
b: dq 0
first: dq 0
last: dq 0
sum1: dq 0
sum2: dq 0
flag: dq 0
cnt: dq 0
cnt1:dq 0
newline: dq "",10,0
fmt: dq "%lld ",10,0
fmt_in: dq "%lld", 10,0
fmtshow: dq "%lld adalah tahun kabisat" ,10,0
fmt_out: dq "total tahun kabisat antara %lld dan %lld adalah %lld", 10, 0

segment .bss
array resq 21

segment .text
global main
extern printf
extern scanf

main:
push RBP

mov RAX, 0
mov RCX, 0
mov RBX, 0
mov [a] ,rax
INPUT: 
	mov RAX, 0
	mov RDI, fmt_in
	mov RSI, first
	call scanf
	mov RAX, 0
	mov RDI, fmt_in
	mov RSI, last
	call scanf
init:
	mov rcx , [first]
loop:
	mov rbx ,[last]
	cmp rcx,rbx
	jg printcount
	mov [cnt] ,rcx
cektahunkabisat:
	mov rdx ,0
	mov rax ,[cnt]
	mov rbx , 400
	div rbx
	cmp rdx ,0
	jz printtahunkabisat
	mov rdx ,0
	mov rax ,[cnt]
	mov rbx ,100
	div rbx
	cmp rdx ,0
	jz lastpartloop
	mov rdx ,0
	mov rax ,[cnt]
	mov rbx , 4
	div rbx
	cmp rdx ,0
	jz printtahunkabisat
lastpartloop:
	mov rcx ,[cnt]
	inc rcx
	mov [cnt] ,rcx
	jmp loop
printtahunkabisat:
	mov rbx ,[a]
	inc rbx
	mov [a] ,rbx
	mov rax ,0
	mov rdi ,fmtshow
	mov rsi ,[cnt]
	call printf
	mov rax ,0
	mov rdi ,newline
	call printf
	jmp lastpartloop

printcount:
	mov rdi ,fmt_out
	mov rsi ,[first]
	mov rdx ,[last]
	mov rcx ,[a]
	call printf
END:
	mov RAX, 0
	pop RBP
ret