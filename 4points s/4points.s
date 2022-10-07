	.file	"4points.c"
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
	sub	rsp, 112
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	# идет инициализация массива А
	mov	DWORD PTR -96[rbp], 1
	mov	DWORD PTR -92[rbp], 2
	mov	DWORD PTR -88[rbp], 3
	mov	DWORD PTR -84[rbp], 4
	mov	DWORD PTR -80[rbp], 5
	mov	DWORD PTR -76[rbp], 6
	mov	DWORD PTR -72[rbp], 7
	mov	DWORD PTR -68[rbp], 8
	mov	DWORD PTR -64[rbp], 9
	mov	DWORD PTR -60[rbp], 10
	mov	DWORD PTR -108[rbp], 0
	mov	DWORD PTR -104[rbp], 0
	# переходим в цикл вычисления суммы элементов массива A
	jmp	.L2
.L3:
	# в блоке L3 считаем сумму элементов и выводим элементы массива A
	mov	eax, DWORD PTR -104[rbp]
	cdqe
	mov	eax, DWORD PTR -96[rbp+rax*4]
	# добавляем к переменной a значение элемента массива A
	add	DWORD PTR -108[rbp], eax
	mov	eax, DWORD PTR -104[rbp]
	cdqe
	mov	eax, DWORD PTR -96[rbp+rax*4]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	# выводим элемент массива A и пробел
	call	printf@PLT
	mov	edi, 32
	call	putchar@PLT
	# увеличиваем счетчик i
	add	DWORD PTR -104[rbp], 1
.L2:
	# выходим из цикла после того, как пройдем его 10 раз
	cmp	DWORD PTR -104[rbp], 9
	jle	.L3
	mov	edi, 10
	# выводим переход на новую строку
	call	putchar@PLT
	# вычисляем значение a при делении его на кол-во элементов массива
	mov	eax, DWORD PTR -108[rbp]
	movsx	rdx, eax
	imul	rdx, rdx, 1717986919
	shr	rdx, 32
	sar	edx, 2
	sar	eax, 31
	mov	ecx, eax
	mov	eax, edx
	sub	eax, ecx
	mov	DWORD PTR -108[rbp], eax
	mov	DWORD PTR -100[rbp], 0
	# переходим в цикл заполнения массива B
	jmp	.L4
.L7:
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	mov	eax, DWORD PTR -96[rbp+rax*4]
	# если элеменет больше, чем ср знач, то в элемент массива B записываем ср знач
	# иначе записываем соответсвтующий ему элемент из массива A
	cmp	DWORD PTR -108[rbp], eax
	jge	.L5
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	mov	edx, DWORD PTR -108[rbp]
	mov	DWORD PTR -48[rbp+rax*4], edx
	jmp	.L6
.L5:
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	mov	edx, DWORD PTR -96[rbp+rax*4]
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	mov	DWORD PTR -48[rbp+rax*4], edx
.L6:
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	mov	eax, DWORD PTR -48[rbp+rax*4]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	# выводим элемент массива B
	call	printf@PLT
	mov	edi, 32
	# выводим " "
	call	putchar@PLT
	# увеличиваем счетчик i
	add	DWORD PTR -100[rbp], 1
.L4:
	# выходим из цикла после того, как пройдем его 10 раз
	cmp	DWORD PTR -100[rbp], 9
	jle	.L7
	mov	edi, 10
	# выводим перевод на новую строку
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
