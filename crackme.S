	.file	"crackme.c"
	.text
	.globl	_arg
	.bss
	.align 4
_arg:
	.space 4
	.comm	_mark, 64, 5
	.section .rdata,"dr"
LC0:
	.ascii "Error #%d: %s\12\0"
	.text
	.globl	_check_error
	.def	_check_error;	.scl	2;	.type	32;	.endef
_check_error:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	cmpl	$0, 8(%ebp)
	je	L3
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_sqlite3_errmsg
	movl	%eax, 12(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	__imp___iob, %eax
	addl	$64, %eax
	movl	%eax, (%esp)
	call	_fprintf
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_sqlite3_close
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_exit
L3:
	nop
	leave
	ret
	.section .rdata,"dr"
LC1:
	.ascii "ADMIN\0"
LC2:
	.ascii "1\0"
LC3:
	.ascii "Admin\0"
LC4:
	.ascii "%10s\0"
LC5:
	.ascii "-----\0"
LC6:
	.ascii " | \0"
	.text
	.globl	_select_callback
	.def	_select_callback;	.scl	2;	.type	32;	.endef
_select_callback:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$12, %esp
	movl	$0, -4(%ebp)
	jmp	L5
L10:
	movl	-4(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	$LC1, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L6
	movl	-4(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	$LC2, 4(%esp)
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L7
	movl	$LC3, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	jmp	L8
L7:
	movl	$LC5, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	jmp	L8
L6:
	movl	-4(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
L8:
	movl	12(%ebp), %eax
	subl	$1, %eax
	cmpl	%eax, -4(%ebp)
	jge	L9
	movl	$LC6, (%esp)
	call	_printf
L9:
	addl	$1, -4(%ebp)
L5:
	movl	-4(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L10
	movl	$10, (%esp)
	call	_putchar
	movl	$0, %eax
	leave
	ret
	.section .rdata,"dr"
	.align 4
LC7:
	.ascii "select username, password from users where username='\0"
LC8:
	.ascii "users.db\0"
	.align 4
LC9:
	.ascii "Cannot open db. Please contact the IT guy\12\0"
	.text
	.globl	_db_access
	.def	_db_access;	.scl	2;	.type	32;	.endef
_db_access:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	subl	$292, %esp
	movl	$0, -16(%ebp)
	movl	$LC7, -8(%ebp)
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC8, (%esp)
	call	_sqlite3_open
	testl	%eax, %eax
	jne	L13
	movl	$0, -276(%ebp)
	leal	-272(%ebp), %edx
	movl	$0, %eax
	movl	$63, %ecx
	movl	%edx, %edi
	rep stosl
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-276(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcat
	movl	_arg, %eax
	movl	$11, 8(%esp)
	movl	%eax, 4(%esp)
	leal	-276(%ebp), %eax
	movl	%eax, (%esp)
	call	_strncat
	leal	-276(%ebp), %eax
	movl	$-1, %ecx
	movl	%eax, %edx
	movl	$0, %eax
	movl	%edx, %edi
	repnz scasb
	movl	%ecx, %eax
	notl	%eax
	leal	-1(%eax), %edx
	leal	-276(%ebp), %eax
	addl	%edx, %eax
	movw	$39, (%eax)
	movl	-16(%ebp), %eax
	leal	-20(%ebp), %edx
	movl	%edx, 16(%esp)
	movl	$0, 12(%esp)
	movl	$_select_callback, 8(%esp)
	leal	-276(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_sqlite3_exec
	movl	%eax, -12(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_check_error
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_sqlite3_close
	jmp	L16
L13:
	movl	__imp___iob, %eax
	addl	$64, %eax
	movl	%eax, 12(%esp)
	movl	$42, 8(%esp)
	movl	$1, 4(%esp)
	movl	$LC9, (%esp)
	call	_fwrite
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_sqlite3_close
	movl	$1, (%esp)
	call	_exit
L16:
	movl	$0, %eax
	addl	$292, %esp
	popl	%edi
	popl	%ebp
	ret
	.globl	_divider
	.data
	.align 4
_divider:
	.long	80
	.text
	.globl	_rand_32
	.def	_rand_32;	.scl	2;	.type	32;	.endef
_rand_32:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	imull	$1103515245, %eax, %eax
	movl	%eax, -4(%ebp)
	addl	$12345, -4(%ebp)
	movl	-4(%ebp), %eax
	shrl	$16, %eax
	andl	$2047, %eax
	movl	%eax, -8(%ebp)
	movl	-4(%ebp), %eax
	imull	$1103515245, %eax, %eax
	movl	%eax, -4(%ebp)
	addl	$12345, -4(%ebp)
	sall	$10, -8(%ebp)
	movl	-4(%ebp), %eax
	shrl	$16, %eax
	andl	$1023, %eax
	movl	%eax, %edx
	movl	-8(%ebp), %eax
	xorl	%edx, %eax
	movl	%eax, -8(%ebp)
	movl	-4(%ebp), %eax
	imull	$1103515245, %eax, %eax
	movl	%eax, -4(%ebp)
	addl	$12345, -4(%ebp)
	sall	$10, -8(%ebp)
	movl	-4(%ebp), %eax
	shrl	$16, %eax
	andl	$1023, %eax
	movl	%eax, %edx
	movl	-8(%ebp), %eax
	xorl	%edx, %eax
	movl	%eax, -8(%ebp)
	movl	8(%ebp), %eax
	movl	-4(%ebp), %edx
	movl	%edx, (%eax)
	movl	-8(%ebp), %eax
	leave
	ret
	.section .rdata,"dr"
LC10:
	.ascii "Level 4 Passed!\0"
LC11:
	.ascii "Points will be reduced\0"
	.text
	.globl	_handler
	.def	_handler;	.scl	2;	.type	32;	.endef
_handler:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	cmpl	$8, %eax
	jne	L20
	movl	$LC10, (%esp)
	call	_puts
	leal	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_rand_32
	movl	%eax, _divider
	movl	$-1, 4(%esp)
	movl	$_mark, (%esp)
	call	_longjmp
L20:
	movl	$LC11, (%esp)
	call	_puts
	nop
	leave
	ret
	.section .rdata,"dr"
LC12:
	.ascii "Level 3 Passed!\0"
	.text
	.globl	__dummy_
	.def	__dummy_;	.scl	2;	.type	32;	.endef
__dummy_:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$12, %esp
	movl	$LC12, (%esp)
	call	_puts
	movl	$_mark, (%esp)
	call	__setjmp
	movl	_divider, %ecx
	movl	$236496, %eax
	movl	$0, %edx
	divl	%ecx
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	sall	$3, %eax
	movl	%eax, -8(%ebp)
	call	_db_access
	movl	$0, (%esp)
	call	_exit
	.section .rdata,"dr"
LC13:
	.ascii "%08X \0"
	.text
	.globl	_printArray
	.def	_printArray;	.scl	2;	.type	32;	.endef
_printArray:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$12, %esp
	movl	12(%ebp), %eax
	movl	%eax, -4(%ebp)
	jmp	L24
L27:
	movl	-4(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC13, (%esp)
	call	_printf
	movl	-4(%ebp), %eax
	subl	12(%ebp), %eax
	sarl	$2, %eax
	addl	$1, %eax
	andl	$3, %eax
	testl	%eax, %eax
	jne	L25
	movl	$10, (%esp)
	call	_putchar
	jmp	L26
L25:
	movl	-4(%ebp), %eax
	addl	$4, %eax
	cmpl	%eax, 16(%ebp)
	ja	L26
	movl	$10, (%esp)
	call	_putchar
L26:
	addl	$4, -4(%ebp)
L24:
	movl	-4(%ebp), %eax
	cmpl	16(%ebp), %eax
	jb	L27
	nop
	nop
	leave
	ret
	.section .rdata,"dr"
LC14:
	.ascii "Level 1 Passed!\0"
	.text
	.globl	_level1
	.def	_level1;	.scl	2;	.type	32;	.endef
_level1:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	cmpl	$1, 8(%ebp)
	jle	L29
	movl	$LC14, (%esp)
	call	_puts
	jmp	L31
L29:
	movl	$0, (%esp)
	call	_exit
L31:
	leave
	ret
	.section .rdata,"dr"
LC15:
	.ascii "%d %d\0"
LC16:
	.ascii "%X\0"
LC17:
	.ascii "Level 2 Passed!\0"
	.text
	.globl	_level2
	.def	_level2;	.scl	2;	.type	32;	.endef
_level2:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$64, %esp
	movl	$-1753689557, -46(%ebp)
	movl	$367503155, -42(%ebp)
	movb	$103, -38(%ebp)
	movl	$0, -4(%ebp)
	jmp	L33
L34:
	leal	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_rand_32
	cltd
	shrl	$24, %edx
	addl	%edx, %eax
	movzbl	%al, %eax
	subl	%edx, %eax
	movl	%eax, %ecx
	leal	-37(%ebp), %edx
	movl	-4(%ebp), %eax
	addl	%edx, %eax
	movb	%cl, (%eax)
	addl	$1, -4(%ebp)
L33:
	cmpl	$8, -4(%ebp)
	jle	L34
	leal	-28(%ebp), %eax # eax = &x
	movl	%eax, 8(%esp) 	# arg3 = &x
	leal	-24(%ebp), %eax # eax = &y
	movl	%eax, 4(%esp)   # arg2 = &y
	movl	$LC15, (%esp)	# arg1 = string for scanf
	call	_scanf # scanf of two integers
	movl	-24(%ebp), %eax # eax = y
	testl	%eax, %eax		
	js	L43 				# jump if y < 0
	movl	-24(%ebp), %eax 
	movl	%eax, %edx		# edx = y
	leal	-37(%ebp), %eax # eax = &z
	addl	%edx, %eax		# eax = &z + y
	andl	$-4, %eax		# unsets 2 LSBs - what is the meaning ?
	movl	%eax, -16(%ebp) # t = eax
	movl	-28(%ebp), %eax
	movl	%eax, %edx		# edx = x
	leal	-37(%ebp), %eax	# ????
	addl	%edx, %eax		#
	andl	$-4, %eax		#
	movl	%eax, -20(%ebp)	
	movl	-20(%ebp), %eax	
	movl	%eax, 8(%esp)	# argument #3 = 
	movl	-16(%ebp), %eax	# 
	movl	%eax, 4(%esp)	# argument #2 =  t
	leal	-37(%ebp), %eax	#
	movl	%eax, (%esp)	# argument #1 =  
	call	_printArray
	movl	-16(%ebp), %eax
	movl	%eax, -8(%ebp)
	jmp	L37
L38:
	leal	-52(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC16, (%esp)
	call	_scanf
	movl	-8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	movl	-52(%ebp), %eax
	xorl	%edx, %eax
	movl	%eax, %edx
	movl	-8(%ebp), %eax
	movl	%edx, (%eax)
	addl	$4, -8(%ebp)
L37:
	movl	-8(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jb	L38
	movl	$0, -12(%ebp)
	jmp	L39
L41:
	leal	-37(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %edx
	leal	-46(%ebp), %ecx
	movl	-12(%ebp), %eax
	addl	%ecx, %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	jne	L44
	addl	$1, -12(%ebp)
L39:
	cmpl	$8, -12(%ebp)
	jle	L41
	movl	$LC17, (%esp)
	call	_puts
	jmp	L32
L43:
	nop
	jmp	L32
L44:
	nop
L32:
	leave
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	call	___main
	movl	$_handler, 4(%esp)
	movl	$8, (%esp)
	call	_signal
	movl	$__dummy_, -4(%ebp)
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_atoi
	movl	%eax, -8(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_level1
	movl	-8(%ebp), %eax
	movl	%eax, (%esp)
	call	_level2
	movl	12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, _arg
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_atoi
	movl	%eax, -8(%ebp)
	leal	-8(%ebp), %eax
	movl	%eax, (%esp)
	call	_rand_32
	cltd
	shrl	$24, %edx
	addl	%edx, %eax
	movzbl	%al, %eax
	subl	%edx, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$26, %eax
	addl	%eax, %edx
	andl	$63, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, _divider
	movl	$0, %eax
	leave
	ret
	.ident	"GCC: (MinGW.org GCC Build-2) 9.2.0"
	.def	_sqlite3_errmsg;	.scl	2;	.type	32;	.endef
	.def	_fprintf;	.scl	2;	.type	32;	.endef
	.def	_sqlite3_close;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_sqlite3_open;	.scl	2;	.type	32;	.endef
	.def	_strcat;	.scl	2;	.type	32;	.endef
	.def	_strncat;	.scl	2;	.type	32;	.endef
	.def	_sqlite3_exec;	.scl	2;	.type	32;	.endef
	.def	_fwrite;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_longjmp;	.scl	2;	.type	32;	.endef
	.def	__setjmp;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_signal;	.scl	2;	.type	32;	.endef
	.def	_atoi;	.scl	2;	.type	32;	.endef
