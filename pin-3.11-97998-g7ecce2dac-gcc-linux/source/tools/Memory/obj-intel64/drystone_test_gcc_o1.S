	.file	"drystone_test.c"
# GNU C (GCC) version 4.8.5 20150623 (Red Hat 4.8.5-16) (x86_64-redhat-linux)
#	compiled by GNU C version 4.8.5 20150623 (Red Hat 4.8.5-16), GMP version 6.0.0, MPFR version 3.1.1, MPC version 1.0.1
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  drystone_test.c -mtune=generic -march=x86-64
# -auxbase-strip drystone_test_gcc_o1.S -O1 -p -fverbose-asm
# options enabled:  -faggressive-loop-optimizations
# -fasynchronous-unwind-tables -fauto-inc-dec -fbranch-count-reg
# -fcombine-stack-adjustments -fcommon -fcompare-elim -fcprop-registers
# -fdefer-pop -fdelete-null-pointer-checks -fdwarf2-cfi-asm
# -fearly-inlining -feliminate-unused-debug-types -fforward-propagate
# -ffunction-cse -fgcse-lm -fgnu-runtime -fgnu-unique
# -fguess-branch-probability -fident -fif-conversion -fif-conversion2
# -finline -finline-atomics -finline-functions-called-once -fipa-profile
# -fipa-pure-const -fipa-reference -fira-hoist-pressure
# -fira-share-save-slots -fira-share-spill-slots -fivopts
# -fkeep-static-consts -fleading-underscore -fmath-errno -fmerge-constants
# -fmerge-debug-strings -fmove-loop-invariants -fomit-frame-pointer
# -fpeephole -fprefetch-loop-arrays -fprofile -freg-struct-return
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fshow-column -fshrink-wrap -fsigned-zeros
# -fsplit-ivs-in-unroller -fsplit-wide-types -fstrict-volatile-bitfields
# -fsync-libcalls -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp
# -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop
# -ftree-copyrename -ftree-cselim -ftree-dce -ftree-dominator-opts
# -ftree-dse -ftree-forwprop -ftree-fre -ftree-loop-if-convert
# -ftree-loop-im -ftree-loop-ivcanon -ftree-loop-optimize
# -ftree-parallelize-loops= -ftree-phiprop -ftree-pta -ftree-reassoc
# -ftree-scev-cprop -ftree-sink -ftree-slp-vectorize -ftree-slsr -ftree-sra
# -ftree-ter -ftree-vect-loop-version -funit-at-a-time -funwind-tables
# -fverbose-asm -fzero-initialized-in-bss -m128bit-long-double -m64 -m80387
# -maccumulate-outgoing-args -malign-stringops -mfancy-math-387
# -mfp-ret-in-387 -mfxsr -mglibc -mieee-fp -mlong-double-80 -mmmx -mno-sse4
# -mpush-args -mred-zone -msse -msse2 -mtls-direct-seg-refs

	.text
	.globl	Proc2
	.type	Proc2, @function
Proc2:
.LFB3:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	call	mcount
	movl	(%rdi), %eax	# *IntParIO_3(D), D.2025
	cmpb	$65, Char1Glob(%rip)	#, Char1Glob
	jne	.L3	#,
	addl	$9, %eax	#, IntLoc
	subl	IntGlob(%rip), %eax	# IntGlob, D.2025
	movl	%eax, (%rdi)	# D.2025, *IntParIO_3(D)
.L3:
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	Proc2, .-Proc2
	.globl	Proc3
	.type	Proc3, @function
Proc3:
.LFB4:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	call	mcount
	movq	PtrGlb(%rip), %rax	# PtrGlb, PtrGlb.16
	testq	%rax, %rax	# PtrGlb.16
	je	.L5	#,
	movq	(%rax), %rax	# PtrGlb.16_3->PtrComp, D.2032
	movq	%rax, (%rdi)	# D.2032, *PtrParOut_5(D)
	jmp	.L6	#
.L5:
	movl	$100, IntGlob(%rip)	#, IntGlob
.L6:
	movl	IntGlob(%rip), %eax	# IntGlob, tmp71
	leal	12(%rax), %edx	#, D.2033
	movq	PtrGlb(%rip), %rax	# PtrGlb, PtrGlb
	movl	%edx, 16(%rax)	# D.2033, MEM[(OneToFifty *)PtrGlb.16_8 + 16B]
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	Proc3, .-Proc3
	.globl	Proc4
	.type	Proc4, @function
Proc4:
.LFB5:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	call	mcount
	movb	$66, Char2Glob(%rip)	#, Char2Glob
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	Proc4, .-Proc4
	.globl	Proc5
	.type	Proc5, @function
Proc5:
.LFB6:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	call	mcount
	movb	$65, Char1Glob(%rip)	#, Char1Glob
	movl	$0, BoolGlob(%rip)	#, BoolGlob
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	Proc5, .-Proc5
	.globl	Proc6
	.type	Proc6, @function
Proc6:
.LFB7:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	call	mcount
	cmpl	$2, %edi	#, EnumParIn
	je	.L10	#,
	movl	$3, (%rsi)	#, *EnumParOut_4(D)
	cmpl	$1, %edi	#, EnumParIn
	je	.L12	#,
	cmpl	$1, %edi	#, EnumParIn
	jb	.L13	#,
	cmpl	$2, %edi	#, EnumParIn
	je	.L10	#,
	cmpl	$4, %edi	#, EnumParIn
	.p2align 4,,2
	je	.L14	#,
	.p2align 4,,5
	jmp	.L16	#
.L13:
	movl	$0, (%rsi)	#, *EnumParOut_4(D)
	.p2align 4,,2
	jmp	.L16	#
.L12:
	cmpl	$101, IntGlob(%rip)	#, IntGlob
	setl	%al	#, tmp64
	movzbl	%al, %eax	# tmp64, tmp64
	leal	(%rax,%rax,2), %eax	#, tmp64
	movl	%eax, (%rsi)	# tmp64, *EnumParOut_4(D)
	jmp	.L16	#
.L10:
	movl	$1, (%rsi)	#, *EnumParOut_4(D)
	jmp	.L16	#
.L14:
	movl	$2, (%rsi)	#, *EnumParOut_4(D)
.L16:
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	Proc6, .-Proc6
	.globl	Proc1
	.type	Proc1, @function
Proc1:
.LFB2:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	.cfi_offset 3, -24
	call	mcount
	movq	%rdi, %rbx	# PtrParIn, PtrParIn
	movq	(%rdi), %rax	# PtrParIn_3(D)->PtrComp, D.2049
	movq	PtrGlb(%rip), %rdx	# PtrGlb, PtrGlb.13
	movq	(%rdx), %rcx	# *PtrGlb.13_5, *PtrGlb.13_5
	movq	%rcx, (%rax)	# *PtrGlb.13_5, *_4
	movq	8(%rdx), %rcx	# *PtrGlb.13_5, *PtrGlb.13_5
	movq	%rcx, 8(%rax)	# *PtrGlb.13_5, *_4
	movq	16(%rdx), %rcx	# *PtrGlb.13_5, *PtrGlb.13_5
	movq	%rcx, 16(%rax)	# *PtrGlb.13_5, *_4
	movq	24(%rdx), %rcx	# *PtrGlb.13_5, *PtrGlb.13_5
	movq	%rcx, 24(%rax)	# *PtrGlb.13_5, *_4
	movq	32(%rdx), %rcx	# *PtrGlb.13_5, *PtrGlb.13_5
	movq	%rcx, 32(%rax)	# *PtrGlb.13_5, *_4
	movq	40(%rdx), %rcx	# *PtrGlb.13_5, *PtrGlb.13_5
	movq	%rcx, 40(%rax)	# *PtrGlb.13_5, *_4
	movq	48(%rdx), %rdx	# *PtrGlb.13_5, *PtrGlb.13_5
	movq	%rdx, 48(%rax)	# *PtrGlb.13_5, *_4
	movl	$5, 16(%rdi)	#, PtrParIn_3(D)->IntComp
	movq	(%rdi), %rax	# PtrParIn_3(D)->PtrComp, D.2049
	movl	$5, 16(%rax)	#, _8->IntComp
	movq	(%rdi), %rax	# PtrParIn_3(D)->PtrComp, D.2049
	movq	%rax, (%rax)	# D.2049, _10->PtrComp
	movq	(%rdi), %rax	# PtrParIn_3(D)->PtrComp, PtrParIn_3(D)->PtrComp
	movq	(%rax), %rdi	# _12->PtrComp,
	movl	$0, %eax	#,
	call	Proc3	#
	movq	(%rbx), %rax	# PtrParIn_3(D)->PtrComp, D.2049
	cmpl	$0, 8(%rax)	#, _15->Discr
	jne	.L18	#,
	movl	$6, 16(%rax)	#, _15->IntComp
	movq	(%rbx), %rax	# PtrParIn_3(D)->PtrComp, tmp97
	leaq	12(%rax), %rsi	#, D.2051
	movl	12(%rbx), %edi	# PtrParIn_3(D)->EnumComp, PtrParIn_3(D)->EnumComp
	movl	$0, %eax	#,
	call	Proc6	#
	movq	(%rbx), %rax	# PtrParIn_3(D)->PtrComp, D.2049
	movq	PtrGlb(%rip), %rdx	# PtrGlb, PtrGlb
	movq	(%rdx), %rdx	# PtrGlb.13_23->PtrComp, D.2049
	movq	%rdx, (%rax)	# D.2049, _22->PtrComp
	movq	(%rbx), %rax	# PtrParIn_3(D)->PtrComp, D.2049
	addl	$12, 16(%rax)	#, MEM[(OneToFifty *)_26 + 16B]
	jmp	.L20	#
.L18:
	movq	(%rax), %rdx	# *_15, *_15
	movq	%rdx, (%rbx)	# *_15, *PtrParIn_3(D)
	movq	8(%rax), %rdx	# *_15, *_15
	movq	%rdx, 8(%rbx)	# *_15, *PtrParIn_3(D)
	movq	16(%rax), %rdx	# *_15, *_15
	movq	%rdx, 16(%rbx)	# *_15, *PtrParIn_3(D)
	movq	24(%rax), %rdx	# *_15, *_15
	movq	%rdx, 24(%rbx)	# *_15, *PtrParIn_3(D)
	movq	32(%rax), %rdx	# *_15, *_15
	movq	%rdx, 32(%rbx)	# *_15, *PtrParIn_3(D)
	movq	40(%rax), %rdx	# *_15, *_15
	movq	%rdx, 40(%rbx)	# *_15, *PtrParIn_3(D)
	movq	48(%rax), %rax	# *_15, *_15
	movq	%rax, 48(%rbx)	# *_15, *PtrParIn_3(D)
.L20:
	popq	%rbx	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	Proc1, .-Proc1
	.globl	Proc7
	.type	Proc7, @function
Proc7:
.LFB8:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	call	mcount
	leal	2(%rdi,%rsi), %eax	#, tmp66
	movl	%eax, (%rdx)	# tmp66, *IntParOut_6(D)
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	Proc7, .-Proc7
	.globl	Proc8
	.type	Proc8, @function
Proc8:
.LFB9:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	call	mcount
	leal	5(%rdx), %r8d	#, IntIndex
	movslq	%r8d, %r10	# IntIndex, D.2071
	leaq	0(,%r10,4), %rax	#, D.2071
	leaq	(%rdi,%rax), %r11	#, D.2072
	movl	%ecx, (%r11)	# IntParI2, *_8
	movl	%ecx, 4(%rdi,%rax)	# IntParI2, *_14
	movl	%r8d, 120(%rdi,%rax)	# IntIndex, *_18
	leal	6(%rdx), %edi	#, D.2073
	cmpl	%edi, %r8d	# D.2073, IntIndex
	jg	.L23	#,
	imulq	$204, %r10, %r9	#, D.2071, D.2071
	addq	%rsi, %r9	# Array2Par, D.2069
	movl	%r8d, %eax	# IntIndex, IntIndex
.L24:
	movslq	%eax, %rcx	# IntIndex, IntIndex
	movl	%r8d, (%r9,%rcx,4)	# IntIndex, *_23
	addl	$1, %eax	#, IntIndex
	cmpl	%edi, %eax	# D.2073, IntIndex
	jle	.L24	#,
.L23:
	imulq	$204, %r10, %r10	#, D.2071, D.2071
	leaq	(%rsi,%r10), %rax	#, D.2069
	addl	$4, %edx	#, D.2073
	movslq	%edx, %rdx	# D.2073, D.2070
	addl	$1, (%rax,%rdx,4)	#, MEM[(int[51] *)_1]
	movl	(%r11), %edx	# *_8, D.2073
	movslq	%r8d, %r8	# IntIndex, IntIndex
	leaq	(%rsi,%r8,4), %rax	#, tmp99
	movl	%edx, 4080(%r10,%rax)	# D.2073, *_33
	movl	$5, IntGlob(%rip)	#, IntGlob
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	Proc8, .-Proc8
	.globl	Func1
	.type	Func1, @function
Func1:
.LFB10:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	call	mcount
	cmpb	%sil, %dil	# CharPar2, CharPar1
	sete	%al	#, D.2080
	movzbl	%al, %eax	# D.2080, D.2080
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	Func1, .-Func1
	.globl	Func2
	.type	Func2, @function
Func2:
.LFB11:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	call	mcount
	movzbl	1(%rdi), %eax	# MEM[(char *)StrParI1_10(D) + 1B], tmp71
	cmpb	%al, 2(%rsi)	# tmp71, MEM[(char *)StrParI2_5(D) + 2B]
	jne	.L27	#,
.L28:
	jmp	.L28	#
.L27:
	call	strcmp	#
	testl	%eax, %eax	# D.2088
	setg	%al	#, D.2089
	movzbl	%al, %eax	# D.2089, D.2089
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	Func2, .-Func2
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Dhrystone time for %ld passes = %ld\n"
	.align 8
.LC1:
	.string	"This machine benchmarks at %ld dhrystones/second\n"
	.text
	.globl	Proc0
	.type	Proc0, @function
Proc0:
.LFB1:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	subq	$104, %rsp	#,
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	call	mcount
	movl	%edi, %r14d	# num_loops, num_loops
	movl	$0, %edi	#,
	movl	$0, %eax	#,
	call	time	#
	movq	%rax, %rbx	#, starttime
	movl	%r14d, %r13d	# num_loops, num_loops.0
	testl	%r14d, %r14d	# num_loops
	je	.L30	#,
	movl	$0, %edx	#, i
.L32:
	addl	$1, %edx	#, i
	cmpl	%r13d, %edx	# num_loops.0, i
	jne	.L32	#,
	jmp	.L31	#
.L41:
	movl	$0, %eax	#,
	call	Proc5	#
	movb	$66, Char2Glob(%rip)	#, Char2Glob
	movl	$2, -52(%rbp)	#, IntLoc1
	movabsq	$5642821575076104260, %rax	#, tmp135
	movq	%rax, -128(%rbp)	# tmp135, MEM[(char * {ref-all})&String2Loc]
	movabsq	$4706902966564560965, %rax	#, tmp136
	movq	%rax, -120(%rbp)	# tmp136, MEM[(char * {ref-all})&String2Loc]
	movabsq	$2325069237881678925, %rax	#, tmp137
	movq	%rax, -112(%rbp)	# tmp137, MEM[(char * {ref-all})&String2Loc]
	movl	$1230132307, -104(%rbp)	#, MEM[(char * {ref-all})&String2Loc]
	movw	$18254, -100(%rbp)	#, MEM[(char * {ref-all})&String2Loc]
	movb	$0, -98(%rbp)	#, MEM[(char * {ref-all})&String2Loc]
	movl	$1, -56(%rbp)	#, EnumLoc
	leaq	-128(%rbp), %rsi	#, tmp138
	leaq	-96(%rbp), %rdi	#, tmp139
	movl	$0, %eax	#,
	call	Func2	#
	testl	%eax, %eax	# D.2122
	sete	%al	#, D.2123
	movzbl	%al, %eax	# D.2123, D.2123
	movl	%eax, BoolGlob(%rip)	# D.2123, BoolGlob
	movl	$2, %eax	#, IntLoc1.6
.L35:
	addl	$1, %eax	#, IntLoc1.8
	cmpl	$3, %eax	#, IntLoc1.8
	jne	.L35	#,
	movl	$3, -52(%rbp)	#, IntLoc1
	movl	$7, %ecx	#,
	movl	$3, %edx	#,
	movl	$Array2Glob, %esi	#,
	movl	$Array1Glob, %edi	#,
	movl	$0, %eax	#,
	call	Proc8	#
	movq	PtrGlb(%rip), %rdi	# PtrGlb,
	movl	$0, %eax	#,
	call	Proc1	#
	cmpb	$64, Char2Glob(%rip)	#, Char2Glob
	jle	.L36	#,
	movl	$65, %ebx	#, CharIndex
.L38:
	cmpb	$67, %bl	#, CharIndex
	sete	%al	#, D.2123
	movzbl	%al, %eax	# D.2123, D.2123
	cmpl	%eax, -56(%rbp)	# D.2123, EnumLoc
	jne	.L37	#,
	leaq	-56(%rbp), %rsi	#, tmp140
	movl	$0, %edi	#,
	movl	$0, %eax	#,
	call	Proc6	#
.L37:
	addl	$1, %ebx	#, CharIndex
	cmpb	%bl, Char2Glob(%rip)	# CharIndex, Char2Glob
	jge	.L38	#,
.L36:
	leaq	-52(%rbp), %rdi	#, tmp141
	movl	$0, %eax	#,
	call	Proc2	#
	addl	$1, %r12d	#, i
	cmpl	%r12d, %r13d	# i, num_loops.0
	jne	.L41	#,
	jmp	.L40	#
.L30:
	movl	$0, %edi	#,
	movl	$0, %eax	#,
	call	time	#
	subq	%rbx, %rax	# starttime, nulltime
	movq	%rax, -136(%rbp)	# nulltime, %sfp
	movl	$56, %edi	#,
	call	malloc	#
	movq	%rax, %rbx	#, tmp118
	movq	%rax, PtrGlbNext(%rip)	# tmp118, PtrGlbNext
	movl	$56, %edi	#,
	call	malloc	#
	movq	%rax, %rdx	#, tmp119
	movq	%rax, PtrGlb(%rip)	# tmp119, PtrGlb
	movq	%rbx, (%rax)	# tmp118, MEM[(struct RecordType *)PtrGlb.2_4].PtrComp
	movl	$0, 8(%rax)	#, MEM[(struct RecordType *)PtrGlb.2_4].Discr
	movl	$2, 12(%rax)	#, MEM[(struct RecordType *)PtrGlb.2_4].EnumComp
	movl	$40, 16(%rax)	#, MEM[(struct RecordType *)PtrGlb.2_4].IntComp
	movabsq	$5642821575076104260, %rcx	#, tmp145
	movq	%rcx, 20(%rdx)	# tmp145, MEM[(void *)PtrGlb.2_4 + 20B]
	movabsq	$4706902966564560965, %rcx	#, tmp146
	movq	%rcx, 28(%rdx)	# tmp146, MEM[(void *)PtrGlb.2_4 + 20B]
	movabsq	$2325349785699101773, %rcx	#, tmp147
	movq	%rcx, 36(%rdx)	# tmp147, MEM[(void *)PtrGlb.2_4 + 20B]
	movl	$1230132307, 44(%rdx)	#, MEM[(void *)PtrGlb.2_4 + 20B]
	movw	$18254, 48(%rdx)	#, MEM[(void *)PtrGlb.2_4 + 20B]
	movb	$0, 50(%rdx)	#, MEM[(void *)PtrGlb.2_4 + 20B]
	movl	$0, %edi	#,
	movl	$0, %eax	#,
	call	time	#
	movq	%rax, %r15	#, starttime
	jmp	.L40	#
.L31:
	movl	$0, %edi	#,
	movl	$0, %eax	#,
	call	time	#
	subq	%rbx, %rax	# starttime, nulltime
	movq	%rax, -136(%rbp)	# nulltime, %sfp
	movl	$56, %edi	#,
	call	malloc	#
	movq	%rax, %rbx	#, tmp124
	movq	%rax, PtrGlbNext(%rip)	# tmp124, PtrGlbNext
	movl	$56, %edi	#,
	call	malloc	#
	movq	%rax, %rdx	#, tmp125
	movq	%rax, PtrGlb(%rip)	# tmp125, PtrGlb
	movq	%rbx, (%rax)	# tmp124, MEM[(struct RecordType *)PtrGlb.2_109].PtrComp
	movl	$0, 8(%rax)	#, MEM[(struct RecordType *)PtrGlb.2_109].Discr
	movl	$2, 12(%rax)	#, MEM[(struct RecordType *)PtrGlb.2_109].EnumComp
	movl	$40, 16(%rax)	#, MEM[(struct RecordType *)PtrGlb.2_109].IntComp
	movabsq	$5642821575076104260, %rcx	#, tmp149
	movq	%rcx, 20(%rdx)	# tmp149, MEM[(void *)PtrGlb.2_109 + 20B]
	movabsq	$4706902966564560965, %rcx	#, tmp150
	movq	%rcx, 28(%rdx)	# tmp150, MEM[(void *)PtrGlb.2_109 + 20B]
	movabsq	$2325349785699101773, %rcx	#, tmp151
	movq	%rcx, 36(%rdx)	# tmp151, MEM[(void *)PtrGlb.2_109 + 20B]
	movl	$1230132307, 44(%rdx)	#, MEM[(void *)PtrGlb.2_109 + 20B]
	movw	$18254, 48(%rdx)	#, MEM[(void *)PtrGlb.2_109 + 20B]
	movb	$0, 50(%rdx)	#, MEM[(void *)PtrGlb.2_109 + 20B]
	movl	$0, %edi	#,
	movl	$0, %eax	#,
	call	time	#
	movq	%rax, %r15	#, starttime
	movl	$0, %r12d	#, i
	jmp	.L41	#
.L40:
	movl	$0, %edi	#,
	movl	$0, %eax	#,
	call	time	#
	subq	%r15, %rax	# starttime, D.2121
	movq	%rax, %rbx	# D.2121, D.2121
	subq	-136(%rbp), %rbx	# %sfp, benchtime
	movslq	%r14d, %r14	# num_loops, D.2121
	movq	%rbx, %rdx	# benchtime,
	movq	%r14, %rsi	# D.2121,
	movl	$.LC0, %edi	#,
	movl	$0, %eax	#,
	call	printf	#
	movq	%r14, %rax	# D.2121, D.2121
	cqto
	idivq	%rbx	# benchtime
	movq	%rax, %rsi	# D.2121, D.2121
	movl	$.LC1, %edi	#,
	movl	$0, %eax	#,
	call	printf	#
	movl	$0, %eax	#,
	addq	$104, %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	Proc0, .-Proc0
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	call	mcount
	movl	$500000000, %edi	#,
	movl	$0, %eax	#,
	call	Proc0	#
	movl	$1000000000, %edi	#,
	movl	$0, %eax	#,
	call	Proc0	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	Func3
	.type	Func3, @function
Func3:
.LFB12:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	call	mcount
	cmpl	$2, %edi	#, EnumParIn
	sete	%al	#, D.2131
	movzbl	%al, %eax	# D.2131, D.2131
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	Func3, .-Func3
	.comm	PtrGlbNext,8,8
	.comm	PtrGlb,8,8
	.comm	Array2Glob,10404,32
	.comm	Array1Glob,204,32
	.comm	Char2Glob,1,1
	.comm	Char1Glob,1,1
	.comm	BoolGlob,4,4
	.comm	IntGlob,4,4
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-16)"
	.section	.note.GNU-stack,"",@progbits
