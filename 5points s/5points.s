	.file	"5points.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 848
	# edi - argc в программе на C
	mov	DWORD PTR -836[rbp], edi
	# rsi - argv в программе на C
	mov	QWORD PTR -848[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	# записываем в n argc, затем вычитаем 1
	mov	eax, DWORD PTR -836[rbp]
	sub	eax, 1
	mov	DWORD PTR -820[rbp], eax
	mov	DWORD PTR -832[rbp], 0
	mov	DWORD PTR -828[rbp], 0
	jmp	.L2
.L3:
	# в L3 мы обращаемся к элементу argv и записываем в элемент массива A
	mov	eax, DWORD PTR -828[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -848[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	edx, DWORD PTR -828[rbp]
	movsx	rdx, edx
	mov	DWORD PTR -816[rbp+rdx*4], eax
	mov	eax, DWORD PTR -828[rbp]
	cdqe
	mov	eax, DWORD PTR -816[rbp+rax*4]
	add	DWORD PTR -832[rbp], eax
	mov	eax, DWORD PTR -828[rbp]
	cdqe
	mov	eax, DWORD PTR -816[rbp+rax*4]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	edi, 32
	call	putchar@PLT
	add	DWORD PTR -828[rbp], 1
.L2:
	mov	eax, DWORD PTR -828[rbp]
	# cравниваем с n
	cmp	eax, DWORD PTR -820[rbp]
	jl	.L3
	mov	edi, 10
	call	putchar@PLT
	mov	eax, DWORD PTR -832[rbp]
	cdq
	idiv	DWORD PTR -820[rbp]
	mov	DWORD PTR -832[rbp], eax
	mov	DWORD PTR -824[rbp], 0
	jmp	.L4
.L7:
	mov	eax, DWORD PTR -824[rbp]
	cdqe
	mov	eax, DWORD PTR -816[rbp+rax*4]
	cmp	DWORD PTR -832[rbp], eax
	jge	.L5
	mov	eax, DWORD PTR -824[rbp]
	cdqe
	mov	edx, DWORD PTR -832[rbp]
	mov	DWORD PTR -416[rbp+rax*4], edx
	jmp	.L6
.L5:
	mov	eax, DWORD PTR -824[rbp]
	cdqe
	mov	edx, DWORD PTR -816[rbp+rax*4]
	mov	eax, DWORD PTR -824[rbp]
	cdqe
	mov	DWORD PTR -416[rbp+rax*4], edx
.L6:
	mov	eax, DWORD PTR -824[rbp]
	cdqe
	mov	eax, DWORD PTR -416[rbp+rax*4]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	edi, 32
	call	putchar@PLT
	add	DWORD PTR -824[rbp], 1
.L4:
	mov	eax, DWORD PTR -824[rbp]
	# cравниваем с n
	cmp	eax, DWORD PTR -820[rbp]
	jl	.L7
	mov	edi, 10
	call	putchar@PLT
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
