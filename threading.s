	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15, 6	sdk_version 10, 15, 6
	.globl	_runOperationONThread   ## -- Begin function runOperationONThread
	.p2align	4, 0x90
_runOperationONThread:                  ## @runOperationONThread
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	$3, %edi
	callq	_sleep
	leaq	L_.str(%rip), %rdi
	movl	%eax, -12(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	movl	%eax, -16(%rbp)         ## 4-byte Spill
	jmp	LBB0_1
	.cfi_endproc
                                        ## -- End function
	.globl	_runOperationONSeparateThread ## -- Begin function runOperationONSeparateThread
	.p2align	4, 0x90
_runOperationONSeparateThread:          ## @runOperationONSeparateThread
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	jmp	LBB1_1
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	$3, %edi
	callq	_sleep
	leaq	L_.str.1(%rip), %rdi
	movl	%eax, -4(%rbp)          ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	movl	%eax, -8(%rbp)          ## 4-byte Spill
	jmp	LBB1_1
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	xorl	%eax, %eax
	movl	%eax, %ecx
	movl	$0, -4(%rbp)
	leaq	-16(%rbp), %rdi
	movq	%rcx, %rsi
	leaq	_runOperationONThread(%rip), %rdx
	callq	_pthread_create
	movl	%eax, -20(%rbp)         ## 4-byte Spill
	callq	_runOperationONSeparateThread
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"First thread function is running every 3 second gap\n"

L_.str.1:                               ## @.str.1
	.asciz	"Another thread function is running every 3 second gap\n"

.subsections_via_symbols
