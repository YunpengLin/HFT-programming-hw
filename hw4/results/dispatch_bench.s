	.file	"dispatch_bench.cpp"
# GNU C++20 (Ubuntu 15.2.0-16ubuntu1) version 15.2.0 (x86_64-linux-gnu)
#	compiled by GNU C version 15.2.0, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.3.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -D_FORTIFY_SOURCE=3 -mtune=generic -march=x86-64 -O2 -std=c++20 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection -fzero-init-padding-bits=all
	.text
	.section	.text._ZN2S07on_bookEddd,"axG",@progbits,_ZN2S07on_bookEddd,comdat
	.align 2
	.p2align 4
	.weak	_ZN2S07on_bookEddd
	.type	_ZN2S07on_bookEddd, @function
_ZN2S07on_bookEddd:
.LFB13156:
	.cfi_startproc
	endbr64
# week04_practice/dispatch_bench.cpp:12:         return o*(a - b);
	subsd	%xmm0, %xmm1	# b, _1
# week04_practice/dispatch_bench.cpp:12:         return o*(a - b);
	mulsd	%xmm2, %xmm1	# o, _1
	movapd	%xmm1, %xmm0	# _1, _5
# week04_practice/dispatch_bench.cpp:13:     }
	ret
	.cfi_endproc
.LFE13156:
	.size	_ZN2S07on_bookEddd, .-_ZN2S07on_bookEddd
	.section	.text._ZN2S17on_bookEddd,"axG",@progbits,_ZN2S17on_bookEddd,comdat
	.align 2
	.p2align 4
	.weak	_ZN2S17on_bookEddd
	.type	_ZN2S17on_bookEddd, @function
_ZN2S17on_bookEddd:
.LFB13157:
	.cfi_startproc
	endbr64
# week04_practice/dispatch_bench.cpp:17:         return  o + (a + b) / 2.0;
	addsd	%xmm0, %xmm1	# b, _1
# week04_practice/dispatch_bench.cpp:17:         return  o + (a + b) / 2.0;
	mulsd	.LC0(%rip), %xmm1	#, _2
# week04_practice/dispatch_bench.cpp:17:         return  o + (a + b) / 2.0;
	movapd	%xmm1, %xmm0	# _2, _2
	addsd	%xmm2, %xmm0	# o, _2
# week04_practice/dispatch_bench.cpp:18:     }
	ret
	.cfi_endproc
.LFE13157:
	.size	_ZN2S17on_bookEddd, .-_ZN2S17on_bookEddd
	.section	.text._ZN2S27on_bookEddd,"axG",@progbits,_ZN2S27on_bookEddd,comdat
	.align 2
	.p2align 4
	.weak	_ZN2S27on_bookEddd
	.type	_ZN2S27on_bookEddd, @function
_ZN2S27on_bookEddd:
.LFB13158:
	.cfi_startproc
	endbr64
# week04_practice/dispatch_bench.cpp:22:         return (a - b) - o;
	subsd	%xmm0, %xmm1	# b, _1
# week04_practice/dispatch_bench.cpp:22:         return (a - b) - o;
	subsd	%xmm2, %xmm1	# o, _1
	movapd	%xmm1, %xmm0	# _1, _5
# week04_practice/dispatch_bench.cpp:23:     }
	ret
	.cfi_endproc
.LFE13158:
	.size	_ZN2S27on_bookEddd, .-_ZN2S27on_bookEddd
	.section	.text._ZN2S37on_bookEddd,"axG",@progbits,_ZN2S37on_bookEddd,comdat
	.align 2
	.p2align 4
	.weak	_ZN2S37on_bookEddd
	.type	_ZN2S37on_bookEddd, @function
_ZN2S37on_bookEddd:
.LFB13159:
	.cfi_startproc
	endbr64
# week04_practice/dispatch_bench.cpp:27:         return  o*o + b;
	mulsd	%xmm2, %xmm2	# o, _1
# week04_practice/dispatch_bench.cpp:27:         return  o*o + b;
	addsd	%xmm2, %xmm0	# _1, _4
# week04_practice/dispatch_bench.cpp:28:     }
	ret
	.cfi_endproc
.LFE13159:
	.size	_ZN2S37on_bookEddd, .-_ZN2S37on_bookEddd
	.section	.text._ZN2S0D2Ev,"axG",@progbits,_ZN2S0D5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZN2S0D2Ev
	.type	_ZN2S0D2Ev, @function
_ZN2S0D2Ev:
.LFB13174:
	.cfi_startproc
	endbr64
# week04_practice/dispatch_bench.cpp:10: struct S0 final : Strategy {
	ret
	.cfi_endproc
.LFE13174:
	.size	_ZN2S0D2Ev, .-_ZN2S0D2Ev
	.weak	_ZN2S0D1Ev
	.set	_ZN2S0D1Ev,_ZN2S0D2Ev
	.section	.text._ZN2S1D2Ev,"axG",@progbits,_ZN2S1D5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZN2S1D2Ev
	.type	_ZN2S1D2Ev, @function
_ZN2S1D2Ev:
.LFB13181:
	.cfi_startproc
	endbr64
# week04_practice/dispatch_bench.cpp:15: struct S1 final : Strategy {
	ret
	.cfi_endproc
.LFE13181:
	.size	_ZN2S1D2Ev, .-_ZN2S1D2Ev
	.weak	_ZN2S1D1Ev
	.set	_ZN2S1D1Ev,_ZN2S1D2Ev
	.section	.text._ZN2S2D2Ev,"axG",@progbits,_ZN2S2D5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZN2S2D2Ev
	.type	_ZN2S2D2Ev, @function
_ZN2S2D2Ev:
.LFB13188:
	.cfi_startproc
	endbr64
# week04_practice/dispatch_bench.cpp:20: struct S2 final : Strategy {
	ret
	.cfi_endproc
.LFE13188:
	.size	_ZN2S2D2Ev, .-_ZN2S2D2Ev
	.weak	_ZN2S2D1Ev
	.set	_ZN2S2D1Ev,_ZN2S2D2Ev
	.section	.text._ZN2S3D2Ev,"axG",@progbits,_ZN2S3D5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZN2S3D2Ev
	.type	_ZN2S3D2Ev, @function
_ZN2S3D2Ev:
.LFB13195:
	.cfi_startproc
	endbr64
# week04_practice/dispatch_bench.cpp:25: struct S3 final : Strategy {
	ret
	.cfi_endproc
.LFE13195:
	.size	_ZN2S3D2Ev, .-_ZN2S3D2Ev
	.weak	_ZN2S3D1Ev
	.set	_ZN2S3D1Ev,_ZN2S3D2Ev
	.section	.text._ZN2S3D0Ev,"axG",@progbits,_ZN2S3D5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZN2S3D0Ev
	.type	_ZN2S3D0Ev, @function
_ZN2S3D0Ev:
.LFB13197:
	.cfi_startproc
	endbr64
# week04_practice/dispatch_bench.cpp:25: struct S3 final : Strategy {
	movl	$8, %esi	#,
	jmp	_ZdlPvm@PLT	#
	.cfi_endproc
.LFE13197:
	.size	_ZN2S3D0Ev, .-_ZN2S3D0Ev
	.section	.text._ZN2S2D0Ev,"axG",@progbits,_ZN2S2D5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZN2S2D0Ev
	.type	_ZN2S2D0Ev, @function
_ZN2S2D0Ev:
.LFB13190:
	.cfi_startproc
	endbr64
# week04_practice/dispatch_bench.cpp:20: struct S2 final : Strategy {
	movl	$8, %esi	#,
	jmp	_ZdlPvm@PLT	#
	.cfi_endproc
.LFE13190:
	.size	_ZN2S2D0Ev, .-_ZN2S2D0Ev
	.section	.text._ZN2S1D0Ev,"axG",@progbits,_ZN2S1D5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZN2S1D0Ev
	.type	_ZN2S1D0Ev, @function
_ZN2S1D0Ev:
.LFB13183:
	.cfi_startproc
	endbr64
# week04_practice/dispatch_bench.cpp:15: struct S1 final : Strategy {
	movl	$8, %esi	#,
	jmp	_ZdlPvm@PLT	#
	.cfi_endproc
.LFE13183:
	.size	_ZN2S1D0Ev, .-_ZN2S1D0Ev
	.section	.text._ZN2S0D0Ev,"axG",@progbits,_ZN2S0D5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZN2S0D0Ev
	.type	_ZN2S0D0Ev, @function
_ZN2S0D0Ev:
.LFB13176:
	.cfi_startproc
	endbr64
# week04_practice/dispatch_bench.cpp:10: struct S0 final : Strategy {
	movl	$8, %esi	#,
	jmp	_ZdlPvm@PLT	#
	.cfi_endproc
.LFE13176:
	.size	_ZN2S0D0Ev, .-_ZN2S0D0Ev
	.text
	.p2align 4
	.type	_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEENS0_5__ops15_Iter_less_iterEEvT_S9_T0_.isra.0, @function
_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEENS0_5__ops15_Iter_less_iterEEvT_S9_T0_.isra.0:
.LFB15660:
	.cfi_startproc
# /usr/include/c++/15/bits/stl_algo.h:1774:       if (__first == __last) return;
	cmpq	%rsi, %rdi	# __last, __first
	je	.L34	#,
# /usr/include/c++/15/bits/stl_algo.h:1771:     __insertion_sort(_RandomAccessIterator __first,
	pushq	%r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rsi, %r12	# __last, __last
	pushq	%rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp	# __first, __first
	pushq	%rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
# /usr/include/c++/15/bits/stl_iterator.h:1148:       { return __normal_iterator(_M_current + __n); }
	leaq	8(%rdi), %rbx	#, __i$_M_current
# /usr/include/c++/15/bits/stl_algo.h:1771:     __insertion_sort(_RandomAccessIterator __first,
	subq	$16, %rsp	#,
	.cfi_def_cfa_offset 48
# /usr/include/c++/15/bits/stl_algo.h:1776:       for (_RandomAccessIterator __i = __first + 1; __i != __last; ++__i)
	cmpq	%rbx, %rsi	# __i$_M_current, __last
	jne	.L24	#,
	jmp	.L14	#
	.p2align 4,,10
	.p2align 3
.L37:
# /usr/include/c++/15/bits/stl_iterator_base_funcs.h:108:       return __last - __first;
	movq	%rbx, %rdx	# __i$_M_current, _23
	subq	%rbp, %rdx	# __first, _23
# /usr/include/c++/15/bits/stl_iterator_base_funcs.h:197: 	__i += __n;
	movq	%rdx, %rax	# _23, tmp116
	salq	$61, %rax	#, tmp116
	subq	%rdx, %rax	# _23, _41
	leaq	8(%rbx,%rax), %rdi	#, _42
# /usr/include/c++/15/bits/stl_algobase.h:702: 	  if (__builtin_expect(__n > 1, true))
	cmpq	$8, %rdx	#, _23
	jle	.L18	#,
# /usr/include/c++/15/bits/stl_algobase.h:704: 	      __builtin_memmove(_GLIBCXX_TO_ADDR(__result),
	movq	%rbp, %rsi	# __first,
	movsd	%xmm1, 8(%rsp)	# _5, %sfp
	call	memmove@PLT	#
	movsd	8(%rsp), %xmm1	# %sfp, _5
.L19:
# /usr/include/c++/15/bits/stl_iterator.h:1103: 	++_M_current;
	addq	$8, %rbx	#, __i$_M_current
# /usr/include/c++/15/bits/stl_algo.h:1783: 	      *__first = _GLIBCXX_MOVE(__val);
	movsd	%xmm1, 0(%rbp)	# _5, *__first_1
# /usr/include/c++/15/bits/stl_algo.h:1776:       for (_RandomAccessIterator __i = __first + 1; __i != __last; ++__i)
	cmpq	%rbx, %r12	# __i$_M_current, __last
	je	.L14	#,
.L24:
# /usr/include/c++/15/bits/predefined_ops.h:45:       { return *__it1 < *__it2; }
	movsd	(%rbx), %xmm1	# MEM[(double &)__i$_M_current_24], _5
# /usr/include/c++/15/bits/predefined_ops.h:45:       { return *__it1 < *__it2; }
	movsd	0(%rbp), %xmm0	# *__first_1, _6
# /usr/include/c++/15/bits/stl_algo.h:1778: 	  if (__comp(__i, __first))
	comisd	%xmm1, %xmm0	# _5, _6
	ja	.L37	#,
# /usr/include/c++/15/bits/predefined_ops.h:98:       { return __val < *__it; }
	movsd	-8(%rbx), %xmm0	# MEM[(double &)__i$_M_current_24 + 18446744073709551608], _9
# /usr/include/c++/15/bits/stl_iterator.h:1120: 	--_M_current;
	leaq	-8(%rbx), %rax	#, _12
# /usr/include/c++/15/bits/stl_algo.h:1758:       while (__comp(__val, __next))
	comisd	%xmm1, %xmm0	# _5, _9
	jbe	.L32	#,
	.p2align 5
	.p2align 4
	.p2align 3
.L23:
# /usr/include/c++/15/bits/stl_algo.h:1760: 	  *__last = _GLIBCXX_MOVE(*__next);
	movsd	%xmm0, 8(%rax)	# _9, MEM[(double &)__next$_M_current_40 + 8]
	movq	%rax, %rdx	# _12, __last$_M_current
# /usr/include/c++/15/bits/predefined_ops.h:98:       { return __val < *__it; }
	movsd	-8(%rax), %xmm0	# MEM[(double &)_12], _9
# /usr/include/c++/15/bits/stl_iterator.h:1120: 	--_M_current;
	subq	$8, %rax	#, _12
# /usr/include/c++/15/bits/stl_algo.h:1758:       while (__comp(__val, __next))
	comisd	%xmm1, %xmm0	# _5, _9
	ja	.L23	#,
.L21:
# /usr/include/c++/15/bits/stl_iterator.h:1103: 	++_M_current;
	addq	$8, %rbx	#, __i$_M_current
# /usr/include/c++/15/bits/stl_algo.h:1764:       *__last = _GLIBCXX_MOVE(__val);
	movsd	%xmm1, (%rdx)	# _5, *__last$_M_current_57
# /usr/include/c++/15/bits/stl_algo.h:1776:       for (_RandomAccessIterator __i = __first + 1; __i != __last; ++__i)
	cmpq	%rbx, %r12	# __i$_M_current, __last
	jne	.L24	#,
.L14:
# /usr/include/c++/15/bits/stl_algo.h:1789:     }
	addq	$16, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx	#
	.cfi_def_cfa_offset 24
	popq	%rbp	#
	.cfi_def_cfa_offset 16
	popq	%r12	#
	.cfi_def_cfa_offset 8
	ret
.L18:
	.cfi_restore_state
# /usr/include/c++/15/bits/stl_algobase.h:708: 	  else if (__n == 1)
	jne	.L19	#,
# /usr/include/c++/15/bits/stl_algobase.h:404: 	*__out = std::move(*__in);
	movsd	%xmm0, (%rdi)	# _6, *_42
# /usr/include/c++/15/bits/stl_algobase.h:408:     }
	jmp	.L19	#
.L32:
# /usr/include/c++/15/bits/stl_algo.h:1758:       while (__comp(__val, __next))
	movq	%rbx, %rdx	# __i$_M_current, __last$_M_current
	jmp	.L21	#
.L34:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
	.cfi_endproc
.LFE15660:
	.size	_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEENS0_5__ops15_Iter_less_iterEEvT_S9_T0_.isra.0, .-_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEENS0_5__ops15_Iter_less_iterEEvT_S9_T0_.isra.0
	.p2align 4
	.type	_ZSt16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEElNS0_5__ops15_Iter_less_iterEEvT_S9_T0_T1_.isra.0, @function
_ZSt16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEElNS0_5__ops15_Iter_less_iterEEvT_S9_T0_T1_.isra.0:
.LFB15663:
	.cfi_startproc
# /usr/include/c++/15/bits/stl_iterator.h:1340:     { return __lhs.base() - __rhs.base(); }
	movq	%rsi, %rax	# __last, _7
	subq	%rdi, %rax	# __first, _7
# /usr/include/c++/15/bits/stl_algo.h:1881:       while (__last - __first > int(_S_threshold))
	cmpq	$128, %rax	#, _7
	jle	.L132	#,
# /usr/include/c++/15/bits/stl_algo.h:1877:     __introsort_loop(_RandomAccessIterator __first,
	pushq	%r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
# /usr/include/c++/15/bits/stl_iterator.h:1340:     { return __lhs.base() - __rhs.base(); }
	movq	%rax, %r10	# _7, _444
	sarq	$4, %rax	#, _445
# /usr/include/c++/15/bits/stl_algo.h:1877:     __introsort_loop(_RandomAccessIterator __first,
	pushq	%rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdx, %rbp	# __depth_limit, __depth_limit
# /usr/include/c++/15/bits/stl_iterator.h:1340:     { return __lhs.base() - __rhs.base(); }
	sarq	$3, %r10	#, _444
# /usr/include/c++/15/bits/stl_algo.h:1877:     __introsort_loop(_RandomAccessIterator __first,
	pushq	%rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx	# __first, __first
	subq	$16, %rsp	#,
	.cfi_def_cfa_offset 48
# /usr/include/c++/15/bits/stl_algo.h:1883: 	  if (__depth_limit == 0)
	testq	%rbp, %rbp	# __depth_limit
	je	.L133	#,
.L40:
# /usr/include/c++/15/bits/predefined_ops.h:45:       { return *__it1 < *__it2; }
	movupd	(%rbx), %xmm2	# MEM <vector(2) double> [(type &)__first_9], MEM <vector(2) double> [(type &)__first_9]
# /usr/include/c++/15/bits/stl_iterator.h:1148:       { return __normal_iterator(_M_current + __n); }
	leaq	(%rbx,%rax,8), %rax	#, _226
# /usr/include/c++/15/bits/stl_algo.h:1888: 	  --__depth_limit;
	subq	$1, %rbp	#, __depth_limit
# /usr/include/c++/15/bits/stl_iterator.h:1148:       { return __normal_iterator(_M_current + __n); }
	leaq	8(%rbx), %rdi	#, __first$_M_current
# /usr/include/c++/15/bits/predefined_ops.h:45:       { return *__it1 < *__it2; }
	movsd	(%rax), %xmm3	# *_226, _246
	movsd	-8(%rsi), %xmm4	# MEM[(double &)__last_309 + 18446744073709551608], pretmp_442
	movapd	%xmm2, %xmm5	# MEM <vector(2) double> [(type &)__first_9], MEM <vector(2) double> [(type &)__first_9]
	movapd	%xmm2, %xmm1	# MEM <vector(2) double> [(type &)__first_9], prephitmp_319
	unpckhpd	%xmm5, %xmm5	# MEM <vector(2) double> [(type &)__first_9]
# /usr/include/c++/15/bits/stl_algo.h:91:       if (__comp(__a, __b))
	comisd	%xmm5, %xmm3	# pretmp_165, _246
	movapd	%xmm5, %xmm0	# MEM <vector(2) double> [(type &)__first_9], pretmp_165
	jbe	.L117	#,
# /usr/include/c++/15/bits/stl_algo.h:93: 	  if (__comp(__b, __c))
	comisd	%xmm3, %xmm4	# _246, pretmp_442
	ja	.L119	#,
# /usr/include/c++/15/bits/stl_algo.h:95: 	  else if (__comp(__a, __c))
	comisd	%xmm5, %xmm4	# pretmp_165, pretmp_442
	ja	.L131	#,
.L78:
# /usr/include/c++/15/bits/move.h:236:       __a = _GLIBCXX_MOVE(__b);
	shufpd	$1, %xmm2, %xmm2	#, MEM <vector(2) double> [(type &)__first_9], _62
	movups	%xmm2, (%rbx)	# _62, MEM <vector(2) double> [(double &)__first_9]
.L77:
# /usr/include/c++/15/bits/stl_algo.h:1836: 	  while (__comp(__first, __pivot))
	comisd	%xmm1, %xmm0	# prephitmp_319, pretmp_165
# /usr/include/c++/15/bits/stl_heap.h:238:       if ((__len & 1) == 0 && __secondChild == (__len - 2) / 2)
	movq	%rsi, %rdx	# __last, __last$_M_current
	leaq	8(%rdi), %rax	#, ivtmp.569
# /usr/include/c++/15/bits/stl_algo.h:1836: 	  while (__comp(__first, __pivot))
	jbe	.L120	#,
	.p2align 5
	.p2align 4
	.p2align 3
.L85:
	movq	%rax, %rcx	# ivtmp.569, ivtmp.569
# /usr/include/c++/15/bits/predefined_ops.h:45:       { return *__it1 < *__it2; }
	movsd	(%rax), %xmm1	# MEM[(double &)_175 + 18446744073709551608], prephitmp_319
# /usr/include/c++/15/bits/stl_algo.h:1836: 	  while (__comp(__first, __pivot))
	addq	$8, %rax	#, ivtmp.569
	comisd	%xmm1, %xmm0	# prephitmp_319, pretmp_165
	ja	.L85	#,
# /usr/include/c++/15/bits/predefined_ops.h:45:       { return *__it1 < *__it2; }
	movsd	-8(%rdx), %xmm2	# MEM[(double &)__last$_M_current_236 + 18446744073709551608], _240
	leaq	-16(%rdx), %rax	#, ivtmp.563
# /usr/include/c++/15/bits/stl_algo.h:1839: 	  while (__comp(__pivot, __last))
	comisd	%xmm0, %xmm2	# pretmp_165, _240
	jbe	.L121	#,
	.p2align 5
	.p2align 4
	.p2align 3
.L88:
	movq	%rax, %rdx	# ivtmp.563, ivtmp.563
# /usr/include/c++/15/bits/predefined_ops.h:45:       { return *__it1 < *__it2; }
	movsd	(%rax), %xmm2	# MEM[(double &)_409 + 8], _240
# /usr/include/c++/15/bits/stl_algo.h:1839: 	  while (__comp(__pivot, __last))
	subq	$8, %rax	#, ivtmp.563
	comisd	%xmm0, %xmm2	# pretmp_165, _240
	ja	.L88	#,
# /usr/include/c++/15/bits/stl_algo.h:1841: 	  if (!(__first < __last))
	cmpq	%rdx, %rcx	# __last$_M_current, _232
	jnb	.L134	#,
.L90:
# /usr/include/c++/15/bits/move.h:236:       __a = _GLIBCXX_MOVE(__b);
	movsd	%xmm2, (%rcx)	# _240, *__first$_M_current_371
# /usr/include/c++/15/bits/stl_iterator.h:1103: 	++_M_current;
	leaq	8(%rcx), %rdi	#, __first$_M_current
# /usr/include/c++/15/bits/move.h:237:       __b = _GLIBCXX_MOVE(__tmp);
	movsd	%xmm1, (%rdx)	# prephitmp_319, *__last$_M_current_282
# /usr/include/c++/15/bits/predefined_ops.h:45:       { return *__it1 < *__it2; }
	movsd	(%rbx), %xmm0	# *__first_9, pretmp_165
# /usr/include/c++/15/bits/predefined_ops.h:45:       { return *__it1 < *__it2; }
	movsd	8(%rcx), %xmm1	# MEM[(double &)__first$_M_current_371 + 8], prephitmp_319
	leaq	8(%rdi), %rax	#, ivtmp.569
# /usr/include/c++/15/bits/stl_algo.h:1836: 	  while (__comp(__first, __pivot))
	comisd	%xmm1, %xmm0	# prephitmp_319, pretmp_165
	ja	.L85	#,
.L120:
# /usr/include/c++/15/bits/predefined_ops.h:45:       { return *__it1 < *__it2; }
	movsd	-8(%rdx), %xmm2	# MEM[(double &)__last$_M_current_236 + 18446744073709551608], _240
# /usr/include/c++/15/bits/stl_algo.h:1836: 	  while (__comp(__first, __pivot))
	movq	%rdi, %rcx	# __first$_M_current, _232
	leaq	-16(%rdx), %rax	#, ivtmp.563
# /usr/include/c++/15/bits/stl_algo.h:1839: 	  while (__comp(__pivot, __last))
	comisd	%xmm0, %xmm2	# pretmp_165, _240
	ja	.L88	#,
	.p2align 4
	.p2align 3
.L121:
# /usr/include/c++/15/bits/stl_iterator.h:1120: 	--_M_current;
	subq	$8, %rdx	#, __last$_M_current
# /usr/include/c++/15/bits/stl_algo.h:1841: 	  if (!(__first < __last))
	cmpq	%rdx, %rcx	# __last$_M_current, _232
	jb	.L90	#,
	.p2align 4
	.p2align 3
.L134:
# /usr/include/c++/15/bits/stl_algo.h:1891: 	  std::__introsort_loop(__cut, __last, __depth_limit, __comp);
	movq	%rbp, %rdx	# __depth_limit,
	movq	%rcx, %rdi	# _232,
	movq	%rcx, 8(%rsp)	# _232, %sfp
	call	_ZSt16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEElNS0_5__ops15_Iter_less_iterEEvT_S9_T0_T1_.isra.0	#
# /usr/include/c++/15/bits/stl_iterator.h:1340:     { return __lhs.base() - __rhs.base(); }
	movq	8(%rsp), %rax	# %sfp, _7
	subq	%rbx, %rax	# __first, _7
# /usr/include/c++/15/bits/stl_algo.h:1881:       while (__last - __first > int(_S_threshold))
	cmpq	$128, %rax	#, _7
	jle	.L38	#,
# /usr/include/c++/15/bits/stl_iterator.h:1340:     { return __lhs.base() - __rhs.base(); }
	movq	%rax, %r10	# _7, _444
	movq	8(%rsp), %rsi	# %sfp, __last
	sarq	$4, %rax	#, _445
	sarq	$3, %r10	#, _444
# /usr/include/c++/15/bits/stl_algo.h:1883: 	  if (__depth_limit == 0)
	testq	%rbp, %rbp	# __depth_limit
	jne	.L40	#,
.L133:
# /usr/include/c++/15/bits/stl_heap.h:229:       while (__secondChild < (__len - 1) / 2)
	leaq	-1(%r10), %r8	#, _376
	leaq	-8(%rbx,%rax,8), %r9	#, ivtmp.557
# /usr/include/c++/15/bits/stl_heap.h:352:       _DistanceType __parent = (__len - 2) / 2;
	leaq	-1(%rax), %rdi	#, __parent
# /usr/include/c++/15/bits/stl_heap.h:229:       while (__secondChild < (__len - 1) / 2)
	sarq	%r8	# _369
# /usr/include/c++/15/bits/stl_heap.h:355: 	  _ValueType __value = _GLIBCXX_MOVE(*(__first + __parent));
	movsd	(%r9), %xmm2	# MEM[(type &)_40], _41
# /usr/include/c++/15/bits/stl_iterator.h:1148:       { return __normal_iterator(_M_current + __n); }
	movq	%r9, %rcx	# ivtmp.557, prephitmp_219
# /usr/include/c++/15/bits/stl_heap.h:238:       if ((__len & 1) == 0 && __secondChild == (__len - 2) / 2)
	movq	%rdi, %r11	# __parent, _68
# /usr/include/c++/15/bits/stl_heap.h:229:       while (__secondChild < (__len - 1) / 2)
	cmpq	%r8, %rdi	# _369, __parent
	jge	.L135	#,
.L51:
# /usr/include/c++/15/bits/stl_heap.h:360: 	  __parent--;
	movq	%rdi, %rbp	# __parent, __holeIndex
	jmp	.L43	#
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L94:
# /usr/include/c++/15/bits/stl_heap.h:229:       while (__secondChild < (__len - 1) / 2)
	movq	%rax, %rbp	# __holeIndex, __holeIndex
.L43:
# /usr/include/c++/15/bits/stl_heap.h:231: 	  __secondChild = 2 * (__secondChild + 1);
	leaq	1(%rbp), %rdx	#, _249
# /usr/include/c++/15/bits/stl_heap.h:231: 	  __secondChild = 2 * (__secondChild + 1);
	leaq	(%rdx,%rdx), %r12	#, __secondChild
# /usr/include/c++/15/bits/stl_iterator.h:1148:       { return __normal_iterator(_M_current + __n); }
	salq	$4, %rdx	#, _231
# /usr/include/c++/15/bits/stl_heap.h:232: 	  if (__comp(__first + __secondChild,
	leaq	-1(%r12), %rax	#, __holeIndex
# /usr/include/c++/15/bits/stl_iterator.h:1148:       { return __normal_iterator(_M_current + __n); }
	addq	%rbx, %rdx	# __first, _230
	leaq	(%rbx,%rax,8), %rcx	#, prephitmp_219
# /usr/include/c++/15/bits/predefined_ops.h:45:       { return *__it1 < *__it2; }
	movsd	(%rdx), %xmm1	# *_230, _229
# /usr/include/c++/15/bits/predefined_ops.h:45:       { return *__it1 < *__it2; }
	movsd	(%rcx), %xmm0	# *_235, prephitmp_202
# /usr/include/c++/15/bits/stl_heap.h:232: 	  if (__comp(__first + __secondChild,
	comisd	%xmm1, %xmm0	# _229, prephitmp_202
# /usr/include/c++/15/bits/stl_heap.h:231: 	  __secondChild = 2 * (__secondChild + 1);
	maxsd	%xmm1, %xmm0	# _229, prephitmp_202
	cmovbe	%r12, %rax	# __holeIndex,, __secondChild, __holeIndex
	cmovbe	%rdx, %rcx	# prephitmp_219,, _230, prephitmp_219
# /usr/include/c++/15/bits/stl_heap.h:235: 	  *(__first + __holeIndex) = _GLIBCXX_MOVE(*(__first + __secondChild));
	movsd	%xmm0, (%rbx,%rbp,8)	# prephitmp_202, *_166
# /usr/include/c++/15/bits/stl_heap.h:229:       while (__secondChild < (__len - 1) / 2)
	cmpq	%r8, %rax	# _369, __holeIndex
	jl	.L94	#,
# /usr/include/c++/15/bits/stl_heap.h:238:       if ((__len & 1) == 0 && __secondChild == (__len - 2) / 2)
	testb	$1, %r10b	#, _444
	jne	.L126	#,
# /usr/include/c++/15/bits/stl_heap.h:238:       if ((__len & 1) == 0 && __secondChild == (__len - 2) / 2)
	cmpq	%rax, %r11	# __holeIndex, _68
	je	.L46	#,
.L126:
# /usr/include/c++/15/bits/stl_heap.h:139:       _Distance __parent = (__holeIndex - 1) / 2;
	leaq	-1(%rax), %rdx	#, _388
.L45:
# /usr/include/c++/15/bits/stl_heap.h:139:       _Distance __parent = (__holeIndex - 1) / 2;
	sarq	%rdx	# __parent
# /usr/include/c++/15/bits/stl_heap.h:140:       while (__holeIndex > __topIndex && __comp(__first + __parent, __value))
	cmpq	%rdi, %rax	# __parent, __holeIndex
	jg	.L50	#,
	jmp	.L47	#
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L137:
# /usr/include/c++/15/bits/stl_heap.h:142: 	  *(__first + __holeIndex) = _GLIBCXX_MOVE(*(__first + __parent));
	movsd	%xmm0, (%rax)	# _88, *_436
# /usr/include/c++/15/bits/stl_heap.h:144: 	  __parent = (__holeIndex - 1) / 2;
	leaq	-1(%rdx), %rax	#, tmp234
	shrq	$63, %rax	#, tmp234
	leaq	-1(%rax,%rdx), %rcx	#, tmp235
	movq	%rdx, %rax	# __parent, __holeIndex
# /usr/include/c++/15/bits/stl_heap.h:140:       while (__holeIndex > __topIndex && __comp(__first + __parent, __value))
	cmpq	%rdx, %rdi	# __holeIndex, __parent
	jge	.L136	#,
	sarq	%rcx	# tmp235
	movq	%rcx, %rdx	# tmp235, __parent
.L50:
# /usr/include/c++/15/bits/stl_iterator.h:1148:       { return __normal_iterator(_M_current + __n); }
	leaq	(%rbx,%rdx,8), %rbp	#, _87
	leaq	(%rbx,%rax,8), %rax	#, prephitmp_404
# /usr/include/c++/15/bits/predefined_ops.h:69:       { return *__it < __val; }
	movsd	0(%rbp), %xmm0	# *_87, _88
# /usr/include/c++/15/bits/stl_heap.h:140:       while (__holeIndex > __topIndex && __comp(__first + __parent, __value))
	comisd	%xmm0, %xmm2	# _88, _41
	ja	.L137	#,
# /usr/include/c++/15/bits/stl_heap.h:146:       *(__first + __holeIndex) = _GLIBCXX_MOVE(__value);
	movsd	%xmm2, (%rax)	# _41, *prephitmp_404
# /usr/include/c++/15/bits/stl_heap.h:358: 	  if (__parent == 0)
	testq	%rdi, %rdi	# __parent
	je	.L54	#,
.L53:
# /usr/include/c++/15/bits/stl_heap.h:353:       while (true)
	subq	$8, %r9	#, ivtmp.557
# /usr/include/c++/15/bits/stl_heap.h:360: 	  __parent--;
	subq	$1, %rdi	#, __parent
# /usr/include/c++/15/bits/stl_heap.h:355: 	  _ValueType __value = _GLIBCXX_MOVE(*(__first + __parent));
	movsd	(%r9), %xmm2	# MEM[(type &)_40], _41
# /usr/include/c++/15/bits/stl_iterator.h:1148:       { return __normal_iterator(_M_current + __n); }
	movq	%r9, %rcx	# ivtmp.557, prephitmp_219
# /usr/include/c++/15/bits/stl_heap.h:229:       while (__secondChild < (__len - 1) / 2)
	cmpq	%r8, %rdi	# _369, __parent
	jl	.L51	#,
.L135:
# /usr/include/c++/15/bits/stl_heap.h:238:       if ((__len & 1) == 0 && __secondChild == (__len - 2) / 2)
	testb	$1, %r10b	#, _444
	jne	.L127	#,
# /usr/include/c++/15/bits/stl_heap.h:238:       if ((__len & 1) == 0 && __secondChild == (__len - 2) / 2)
	cmpq	%r11, %rdi	# _68, __parent
	je	.L138	#,
.L47:
# /usr/include/c++/15/bits/stl_heap.h:146:       *(__first + __holeIndex) = _GLIBCXX_MOVE(__value);
	movsd	%xmm2, (%rcx)	# _41, *prephitmp_398
	jmp	.L53	#
	.p2align 4,,10
	.p2align 3
.L117:
# /usr/include/c++/15/bits/stl_algo.h:100:       else if (__comp(__a, __c))
	comisd	%xmm5, %xmm4	# pretmp_165, pretmp_442
	ja	.L78	#,
# /usr/include/c++/15/bits/stl_algo.h:102:       else if (__comp(__b, __c))
	comisd	%xmm3, %xmm4	# _246, pretmp_442
	jbe	.L119	#,
.L131:
# /usr/include/c++/15/bits/move.h:236:       __a = _GLIBCXX_MOVE(__b);
	movsd	%xmm4, (%rbx)	# pretmp_442, *__first_9
# /usr/include/c++/15/bits/move.h:237:       __b = _GLIBCXX_MOVE(__tmp);
	movsd	%xmm1, -8(%rsi)	# prephitmp_319, MEM[(double &)__last_309 + 18446744073709551608]
# /usr/include/c++/15/bits/predefined_ops.h:45:       { return *__it1 < *__it2; }
	movsd	8(%rbx), %xmm1	# MEM[(double &)__first_9 + 8], prephitmp_319
# /usr/include/c++/15/bits/predefined_ops.h:45:       { return *__it1 < *__it2; }
	movsd	(%rbx), %xmm0	# *__first_9, pretmp_165
	jmp	.L77	#
.L119:
# /usr/include/c++/15/bits/move.h:236:       __a = _GLIBCXX_MOVE(__b);
	movsd	%xmm3, (%rbx)	# _246, *__first_9
# /usr/include/c++/15/bits/move.h:237:       __b = _GLIBCXX_MOVE(__tmp);
	movsd	%xmm1, (%rax)	# prephitmp_319, *_226
# /usr/include/c++/15/bits/predefined_ops.h:45:       { return *__it1 < *__it2; }
	movsd	8(%rbx), %xmm1	# MEM[(double &)__first_9 + 8], prephitmp_319
# /usr/include/c++/15/bits/predefined_ops.h:45:       { return *__it1 < *__it2; }
	movsd	(%rbx), %xmm0	# *__first_9, pretmp_165
	jmp	.L77	#
.L38:
# /usr/include/c++/15/bits/stl_algo.h:1894:     }
	addq	$16, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx	#
	.cfi_def_cfa_offset 24
	popq	%rbp	#
	.cfi_def_cfa_offset 16
	popq	%r12	#
	.cfi_def_cfa_offset 8
	ret
.L136:
	.cfi_restore_state
	movq	%rbp, %rax	# _87, prephitmp_404
# /usr/include/c++/15/bits/stl_heap.h:146:       *(__first + __holeIndex) = _GLIBCXX_MOVE(__value);
	movsd	%xmm2, (%rax)	# _41, *prephitmp_404
# /usr/include/c++/15/bits/stl_heap.h:358: 	  if (__parent == 0)
	testq	%rdi, %rdi	# __parent
	jne	.L53	#,
.L54:
# /usr/include/c++/15/bits/stl_iterator.h:1340:     { return __lhs.base() - __rhs.base(); }
	movq	%rsi, %rax	# __last, _264
	subq	$8, %rsi	#, ivtmp.549
	subq	%rbx, %rax	# __first, _264
# /usr/include/c++/15/bits/stl_heap.h:422:       while (__last - __first > 1)
	cmpq	$8, %rax	#, _264
	jle	.L38	#,
	.p2align 4
	.p2align 3
.L72:
# /usr/include/c++/15/bits/stl_iterator.h:1340:     { return __lhs.base() - __rhs.base(); }
	movq	%rsi, %rdi	# ivtmp.549, _163
# /usr/include/c++/15/bits/stl_heap.h:263:       *__result = _GLIBCXX_MOVE(*__first);
	movsd	(%rbx), %xmm0	# MEM[(type &)__first_9], _161
# /usr/include/c++/15/bits/stl_heap.h:262:       _ValueType __value = _GLIBCXX_MOVE(*__result);
	movsd	(%rsi), %xmm2	# MEM[(type &)_21], _160
# /usr/include/c++/15/bits/stl_iterator.h:1340:     { return __lhs.base() - __rhs.base(); }
	subq	%rbx, %rdi	# __first, _163
# /usr/include/c++/15/bits/stl_iterator.h:1340:     { return __lhs.base() - __rhs.base(); }
	movq	%rdi, %r11	# _163, _164
# /usr/include/c++/15/bits/stl_heap.h:263:       *__result = _GLIBCXX_MOVE(*__first);
	movsd	%xmm0, (%rsi)	# _161, MEM[(double &)_21]
# /usr/include/c++/15/bits/stl_iterator.h:1340:     { return __lhs.base() - __rhs.base(); }
	sarq	$3, %r11	#, _164
# /usr/include/c++/15/bits/stl_heap.h:229:       while (__secondChild < (__len - 1) / 2)
	cmpq	$16, %rdi	#, _163
	jle	.L58	#,
# /usr/include/c++/15/bits/stl_heap.h:229:       while (__secondChild < (__len - 1) / 2)
	leaq	-1(%r11), %r10	#, _146
# /usr/include/c++/15/bits/stl_heap.h:229:       while (__secondChild < (__len - 1) / 2)
	xorl	%r9d, %r9d	# __holeIndex
	sarq	%r10	# _29
	jmp	.L60	#
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L98:
# /usr/include/c++/15/bits/stl_heap.h:229:       while (__secondChild < (__len - 1) / 2)
	movq	%rax, %r9	# __holeIndex, __holeIndex
.L60:
# /usr/include/c++/15/bits/stl_heap.h:231: 	  __secondChild = 2 * (__secondChild + 1);
	leaq	1(%r9), %rdx	#, _302
# /usr/include/c++/15/bits/stl_heap.h:231: 	  __secondChild = 2 * (__secondChild + 1);
	leaq	(%rdx,%rdx), %r8	#, __secondChild
# /usr/include/c++/15/bits/stl_iterator.h:1148:       { return __normal_iterator(_M_current + __n); }
	salq	$4, %rdx	#, _279
# /usr/include/c++/15/bits/stl_heap.h:232: 	  if (__comp(__first + __secondChild,
	leaq	-1(%r8), %rax	#, __holeIndex
# /usr/include/c++/15/bits/stl_iterator.h:1148:       { return __normal_iterator(_M_current + __n); }
	addq	%rbx, %rdx	# __first, _278
	leaq	(%rbx,%rax,8), %rcx	#, prephitmp_271
# /usr/include/c++/15/bits/predefined_ops.h:45:       { return *__it1 < *__it2; }
	movsd	(%rdx), %xmm1	# *_278, _276
# /usr/include/c++/15/bits/predefined_ops.h:45:       { return *__it1 < *__it2; }
	movsd	(%rcx), %xmm0	# *_288, prephitmp_268
# /usr/include/c++/15/bits/stl_heap.h:232: 	  if (__comp(__first + __secondChild,
	comisd	%xmm1, %xmm0	# _276, prephitmp_268
# /usr/include/c++/15/bits/stl_heap.h:231: 	  __secondChild = 2 * (__secondChild + 1);
	maxsd	%xmm1, %xmm0	# _276, prephitmp_268
	cmovbe	%r8, %rax	# __holeIndex,, __secondChild, __holeIndex
	cmovbe	%rdx, %rcx	# prephitmp_271,, _278, prephitmp_271
# /usr/include/c++/15/bits/stl_heap.h:235: 	  *(__first + __holeIndex) = _GLIBCXX_MOVE(*(__first + __secondChild));
	movsd	%xmm0, (%rbx,%r9,8)	# prephitmp_268, *_261
# /usr/include/c++/15/bits/stl_heap.h:229:       while (__secondChild < (__len - 1) / 2)
	cmpq	%rax, %r10	# __holeIndex, _29
	jg	.L98	#,
# /usr/include/c++/15/bits/stl_heap.h:238:       if ((__len & 1) == 0 && __secondChild == (__len - 2) / 2)
	andl	$1, %r11d	#, _164
	jne	.L129	#,
# /usr/include/c++/15/bits/stl_heap.h:238:       if ((__len & 1) == 0 && __secondChild == (__len - 2) / 2)
	movq	%rdi, %rdx	# _163, _115
	sarq	$4, %rdx	#, _115
	subq	$1, %rdx	#, _190
# /usr/include/c++/15/bits/stl_heap.h:238:       if ((__len & 1) == 0 && __secondChild == (__len - 2) / 2)
	cmpq	%rax, %rdx	# __holeIndex, _190
	je	.L66	#,
.L129:
# /usr/include/c++/15/bits/stl_heap.h:139:       _Distance __parent = (__holeIndex - 1) / 2;
	leaq	-1(%rax), %rdx	#, tmp251
	shrq	$63, %rdx	#, tmp251
	leaq	-1(%rax,%rdx), %rdx	#, tmp252
	sarq	%rdx	# prephitmp_168
# /usr/include/c++/15/bits/stl_heap.h:140:       while (__holeIndex > __topIndex && __comp(__first + __parent, __value))
	testq	%rax, %rax	# __holeIndex
	jne	.L70	#,
	jmp	.L139	#
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L141:
# /usr/include/c++/15/bits/stl_heap.h:142: 	  *(__first + __holeIndex) = _GLIBCXX_MOVE(*(__first + __parent));
	movsd	%xmm0, (%rax)	# _210, *_432
# /usr/include/c++/15/bits/stl_heap.h:144: 	  __parent = (__holeIndex - 1) / 2;
	leaq	-1(%rdx), %rax	#, tmp257
	shrq	$63, %rax	#, tmp257
	leaq	-1(%rax,%rdx), %rcx	#, tmp258
	movq	%rdx, %rax	# prephitmp_168, __holeIndex
# /usr/include/c++/15/bits/stl_heap.h:140:       while (__holeIndex > __topIndex && __comp(__first + __parent, __value))
	testq	%rdx, %rdx	# __holeIndex
	je	.L140	#,
	sarq	%rcx	# tmp258
	movq	%rcx, %rdx	# tmp258, prephitmp_168
.L70:
# /usr/include/c++/15/bits/stl_iterator.h:1148:       { return __normal_iterator(_M_current + __n); }
	leaq	(%rbx,%rdx,8), %r8	#, _209
	leaq	(%rbx,%rax,8), %rax	#, prephitmp_428
# /usr/include/c++/15/bits/predefined_ops.h:69:       { return *__it < __val; }
	movsd	(%r8), %xmm0	# *_209, _210
# /usr/include/c++/15/bits/stl_heap.h:140:       while (__holeIndex > __topIndex && __comp(__first + __parent, __value))
	comisd	%xmm0, %xmm2	# _210, _160
	ja	.L141	#,
.L63:
# /usr/include/c++/15/bits/stl_heap.h:146:       *(__first + __holeIndex) = _GLIBCXX_MOVE(__value);
	movsd	%xmm2, (%rax)	# _160, *prephitmp_428
# /usr/include/c++/15/bits/stl_heap.h:422:       while (__last - __first > 1)
	cmpq	$8, %rdi	#, _163
	jle	.L38	#,
.L128:
	subq	$8, %rsi	#, ivtmp.549
	jmp	.L72	#
.L140:
	movq	%r8, %rax	# _209, prephitmp_428
	jmp	.L63	#
.L58:
# /usr/include/c++/15/bits/stl_heap.h:238:       if ((__len & 1) == 0 && __secondChild == (__len - 2) / 2)
	andl	$1, %r11d	#, _164
	jne	.L130	#,
# /usr/include/c++/15/bits/stl_heap.h:238:       if ((__len & 1) == 0 && __secondChild == (__len - 2) / 2)
	cmpq	$16, %rdi	#, _163
	jne	.L130	#,
	movq	%rbx, %rcx	# __first, prephitmp_271
	xorl	%eax, %eax	# __holeIndex
.L66:
# /usr/include/c++/15/bits/stl_heap.h:241: 	  *(__first + __holeIndex) = _GLIBCXX_MOVE(*(__first
	leaq	1(%rax,%rax), %r8	#, _193
# /usr/include/c++/15/bits/stl_heap.h:241: 	  *(__first + __holeIndex) = _GLIBCXX_MOVE(*(__first
	movq	%rax, %rdx	# __holeIndex, prephitmp_168
# /usr/include/c++/15/bits/stl_heap.h:241: 	  *(__first + __holeIndex) = _GLIBCXX_MOVE(*(__first
	movsd	(%rbx,%r8,8), %xmm0	# MEM[(type &)_196], _197
# /usr/include/c++/15/bits/stl_heap.h:243: 	  __holeIndex = __secondChild - 1;
	movq	%r8, %rax	# _193, __holeIndex
# /usr/include/c++/15/bits/stl_heap.h:241: 	  *(__first + __holeIndex) = _GLIBCXX_MOVE(*(__first
	movsd	%xmm0, (%rcx)	# _197, *prephitmp_169
	jmp	.L70	#
.L130:
# /usr/include/c++/15/bits/stl_heap.h:238:       if ((__len & 1) == 0 && __secondChild == (__len - 2) / 2)
	movq	%rbx, %rax	# __first, prephitmp_428
	jmp	.L63	#
.L138:
	movq	%rdi, %rax	# __parent, __holeIndex
.L46:
	leaq	(%rax,%rax), %rdx	#, _388
# /usr/include/c++/15/bits/stl_heap.h:241: 	  *(__first + __holeIndex) = _GLIBCXX_MOVE(*(__first
	leaq	1(%rdx), %rax	#, __holeIndex
# /usr/include/c++/15/bits/stl_iterator.h:1148:       { return __normal_iterator(_M_current + __n); }
	leaq	(%rbx,%rax,8), %rbp	#, _74
# /usr/include/c++/15/bits/stl_heap.h:241: 	  *(__first + __holeIndex) = _GLIBCXX_MOVE(*(__first
	movsd	0(%rbp), %xmm0	# MEM[(type &)_74], _75
# /usr/include/c++/15/bits/stl_heap.h:241: 	  *(__first + __holeIndex) = _GLIBCXX_MOVE(*(__first
	movsd	%xmm0, (%rcx)	# _75, *prephitmp_117
	movq	%rbp, %rcx	# _74, prephitmp_219
	jmp	.L45	#
.L142:
# /usr/include/c++/15/bits/stl_heap.h:360: 	  __parent--;
	subq	$2, %rdi	#, __parent
# /usr/include/c++/15/bits/stl_heap.h:355: 	  _ValueType __value = _GLIBCXX_MOVE(*(__first + __parent));
	movsd	-16(%rax), %xmm2	# MEM[(type &)_129], _41
# /usr/include/c++/15/bits/stl_heap.h:353:       while (true)
	leaq	-16(%rax), %r9	#, ivtmp.557
# /usr/include/c++/15/bits/stl_heap.h:229:       while (__secondChild < (__len - 1) / 2)
	cmpq	%r8, %rdi	# _369, __parent
	jl	.L51	#,
.L127:
# /usr/include/c++/15/bits/stl_heap.h:238:       if ((__len & 1) == 0 && __secondChild == (__len - 2) / 2)
	movq	%r9, %rax	# ivtmp.557, ivtmp.557
# /usr/include/c++/15/bits/stl_heap.h:146:       *(__first + __holeIndex) = _GLIBCXX_MOVE(__value);
	movsd	%xmm2, (%r9)	# _41, *_125
# /usr/include/c++/15/bits/stl_heap.h:360: 	  __parent--;
	leaq	-1(%rdi), %rdx	#, __parent
# /usr/include/c++/15/bits/stl_heap.h:353:       while (true)
	subq	$8, %r9	#, ivtmp.557
# /usr/include/c++/15/bits/stl_heap.h:355: 	  _ValueType __value = _GLIBCXX_MOVE(*(__first + __parent));
	movsd	(%r9), %xmm2	# MEM[(type &)_373], _41
# /usr/include/c++/15/bits/stl_heap.h:229:       while (__secondChild < (__len - 1) / 2)
	cmpq	%r8, %rdx	# _369, __parent
	jge	.L142	#,
# /usr/include/c++/15/bits/stl_heap.h:360: 	  __parent--;
	movq	%rdx, %rdi	# __parent, __parent
	jmp	.L51	#
.L132:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
.L139:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
# /usr/include/c++/15/bits/stl_heap.h:146:       *(__first + __holeIndex) = _GLIBCXX_MOVE(__value);
	movsd	%xmm2, (%rcx)	# _160, *prephitmp_271
	jmp	.L128	#
	.cfi_endproc
.LFE15663:
	.size	_ZSt16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEElNS0_5__ops15_Iter_less_iterEEvT_S9_T0_T1_.isra.0, .-_ZSt16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEElNS0_5__ops15_Iter_less_iterEEvT_S9_T0_T1_.isra.0
	.p2align 4
	.type	_ZSt6__sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEENS0_5__ops15_Iter_less_iterEEvT_S9_T0_.isra.0, @function
_ZSt6__sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEENS0_5__ops15_Iter_less_iterEEvT_S9_T0_.isra.0:
.LFB15672:
	.cfi_startproc
# /usr/include/c++/15/bits/stl_algo.h:1904:       if (__first != __last)
	cmpq	%rsi, %rdi	# __last, __first
	je	.L162	#,
# /usr/include/c++/15/bits/stl_algo.h:1901:     __sort(_RandomAccessIterator __first, _RandomAccessIterator __last,
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# /usr/include/c++/15/bits/stl_iterator.h:1340:     { return __lhs.base() - __rhs.base(); }
	movq	%rsi, %rbp	# __last, _3
	subq	%rdi, %rbp	# __first, _3
# /usr/include/c++/15/bits/stl_algo.h:1901:     __sort(_RandomAccessIterator __first, _RandomAccessIterator __last,
	pushq	%rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbx	# __last, __last
# /usr/include/c++/15/bits/stl_iterator.h:1340:     { return __lhs.base() - __rhs.base(); }
	movq	%rbp, %rax	# _3, _4
	sarq	$3, %rax	#, _4
# /usr/include/c++/15/bits/stl_algo.h:1901:     __sort(_RandomAccessIterator __first, _RandomAccessIterator __last,
	subq	$24, %rsp	#,
	.cfi_def_cfa_offset 48
# /usr/include/c++/15/bit:209:       return __builtin_clzg(__x, _Nd);
	bsrq	%rax, %rdx	# _4, tmp121
	xorq	$63, %rdx	#, tmp120
	testq	%rax, %rax	# _4
	movl	$64, %eax	#, tmp126
# /usr/include/c++/15/bits/stl_algo.h:1906: 	  std::__introsort_loop(__first, __last,
	movq	%rdi, 8(%rsp)	# __first, %sfp
# /usr/include/c++/15/bit:209:       return __builtin_clzg(__x, _Nd);
	cmovne	%edx, %eax	# tmp126,, tmp120, _7
# /usr/include/c++/15/bits/stl_algobase.h:1555:       return std::__bit_width(make_unsigned_t<_Tp>(__n)) - 1;
	movl	$63, %edx	#, tmp123
	subl	%eax, %edx	# _7, _8
# /usr/include/c++/15/bits/stl_algobase.h:1555:       return std::__bit_width(make_unsigned_t<_Tp>(__n)) - 1;
	movslq	%edx, %rdx	# _8, _9
# /usr/include/c++/15/bits/stl_algo.h:1906: 	  std::__introsort_loop(__first, __last,
	addq	%rdx, %rdx	# _10
	call	_ZSt16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEElNS0_5__ops15_Iter_less_iterEEvT_S9_T0_T1_.isra.0	#
# /usr/include/c++/15/bits/stl_algo.h:1816:       if (__last - __first > int(_S_threshold))
	cmpq	$128, %rbp	#, _3
	movq	8(%rsp), %rdi	# %sfp, __first
	jle	.L146	#,
# /usr/include/c++/15/bits/stl_iterator.h:1148:       { return __normal_iterator(_M_current + __n); }
	leaq	128(%rdi), %rbp	#, __i$_M_current
# /usr/include/c++/15/bits/stl_algo.h:1818: 	  std::__insertion_sort(__first, __first + int(_S_threshold), __comp);
	movq	%rbp, %rsi	# __i$_M_current,
	call	_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEENS0_5__ops15_Iter_less_iterEEvT_S9_T0_.isra.0	#
# /usr/include/c++/15/bits/stl_algo.h:1798:       for (_RandomAccessIterator __i = __first; __i != __last; ++__i)
	cmpq	%rbp, %rbx	# __i$_M_current, __last
	je	.L143	#,
	.p2align 4
	.p2align 3
.L147:
# /usr/include/c++/15/bits/stl_algo.h:1755: 	__val = _GLIBCXX_MOVE(*__last);
	movsd	0(%rbp), %xmm1	# MEM[(type &)__i$_M_current_37], _21
# /usr/include/c++/15/bits/predefined_ops.h:98:       { return __val < *__it; }
	movsd	-8(%rbp), %xmm0	# MEM[(double &)__i$_M_current_37 + 18446744073709551608], _23
# /usr/include/c++/15/bits/stl_iterator.h:1120: 	--_M_current;
	leaq	-8(%rbp), %rax	#, __next$_M_current
# /usr/include/c++/15/bits/stl_algo.h:1758:       while (__comp(__val, __next))
	comisd	%xmm1, %xmm0	# _21, _23
	jbe	.L160	#,
	.p2align 5
	.p2align 4
	.p2align 3
.L151:
# /usr/include/c++/15/bits/stl_algo.h:1760: 	  *__last = _GLIBCXX_MOVE(*__next);
	movsd	%xmm0, 8(%rax)	# _23, MEM[(double &)__next$_M_current_14 + 8]
	movq	%rax, %rdx	# __next$_M_current, __last$_M_current
# /usr/include/c++/15/bits/predefined_ops.h:98:       { return __val < *__it; }
	movsd	-8(%rax), %xmm0	# MEM[(double &)_26], _23
# /usr/include/c++/15/bits/stl_iterator.h:1120: 	--_M_current;
	subq	$8, %rax	#, __next$_M_current
# /usr/include/c++/15/bits/stl_algo.h:1758:       while (__comp(__val, __next))
	comisd	%xmm1, %xmm0	# _21, _23
	ja	.L151	#,
.L149:
# /usr/include/c++/15/bits/stl_iterator.h:1103: 	++_M_current;
	addq	$8, %rbp	#, __i$_M_current
# /usr/include/c++/15/bits/stl_algo.h:1764:       *__last = _GLIBCXX_MOVE(__val);
	movsd	%xmm1, (%rdx)	# _21, *__last$_M_current_28
# /usr/include/c++/15/bits/stl_algo.h:1798:       for (_RandomAccessIterator __i = __first; __i != __last; ++__i)
	cmpq	%rbp, %rbx	# __i$_M_current, __last
	jne	.L147	#,
.L143:
# /usr/include/c++/15/bits/stl_algo.h:1911:     }
	addq	$24, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx	#
	.cfi_def_cfa_offset 16
	popq	%rbp	#
	.cfi_def_cfa_offset 8
	ret
.L146:
	.cfi_restore_state
	addq	$24, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
# /usr/include/c++/15/bits/stl_algo.h:1823: 	std::__insertion_sort(__first, __last, __comp);
	movq	%rbx, %rsi	# __last,
# /usr/include/c++/15/bits/stl_algo.h:1911:     }
	popq	%rbx	#
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp	#
	.cfi_restore 6
	.cfi_def_cfa_offset 8
# /usr/include/c++/15/bits/stl_algo.h:1823: 	std::__insertion_sort(__first, __last, __comp);
	jmp	_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEENS0_5__ops15_Iter_less_iterEEvT_S9_T0_.isra.0	#
.L160:
	.cfi_restore_state
# /usr/include/c++/15/bits/stl_algo.h:1758:       while (__comp(__val, __next))
	movq	%rbp, %rdx	# __i$_M_current, __last$_M_current
	jmp	.L149	#
.L162:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE15672:
	.size	_ZSt6__sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEENS0_5__ops15_Iter_less_iterEEvT_S9_T0_.isra.0, .-_ZSt6__sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEENS0_5__ops15_Iter_less_iterEEvT_S9_T0_.isra.0
	.section	.text._ZNSt12_Vector_baseIdSaIdEED2Ev,"axG",@progbits,_ZNSt12_Vector_baseIdSaIdEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt12_Vector_baseIdSaIdEED2Ev
	.type	_ZNSt12_Vector_baseIdSaIdEED2Ev, @function
_ZNSt12_Vector_baseIdSaIdEED2Ev:
.LFB13939:
	.cfi_startproc
	endbr64
# /usr/include/c++/15/bits/stl_vector.h:373:       ~_Vector_base() _GLIBCXX_NOEXCEPT
	movq	%rdi, %rax	# this, this
# /usr/include/c++/15/bits/stl_vector.h:376: 		      _M_impl._M_end_of_storage - _M_impl._M_start);
	movq	(%rdi), %rdi	# this_7(D)->_M_impl.D.172354._M_start, _2
# /usr/include/c++/15/bits/stl_vector.h:395: 	if (__p)
	testq	%rdi, %rdi	# _2
	je	.L165	#,
# /usr/include/c++/15/bits/stl_vector.h:376: 		      _M_impl._M_end_of_storage - _M_impl._M_start);
	movq	16(%rax), %rsi	# this_7(D)->_M_impl.D.172354._M_end_of_storage, this_7(D)->_M_impl.D.172354._M_end_of_storage
	subq	%rdi, %rsi	# _2, _3
# /usr/include/c++/15/bits/new_allocator.h:172: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	jmp	_ZdlPvm@PLT	#
	.p2align 4,,10
	.p2align 3
.L165:
# /usr/include/c++/15/bits/stl_vector.h:377:       }
	ret
	.cfi_endproc
.LFE13939:
	.size	_ZNSt12_Vector_baseIdSaIdEED2Ev, .-_ZNSt12_Vector_baseIdSaIdEED2Ev
	.weak	_ZNSt12_Vector_baseIdSaIdEED1Ev
	.set	_ZNSt12_Vector_baseIdSaIdEED1Ev,_ZNSt12_Vector_baseIdSaIdEED2Ev
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC6:
	.string	"vector::_M_realloc_append"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC7:
	.string	"direct call (no base class)    %6.2f ns/call\n"
	.align 8
.LC8:
	.string	"virtual, 1 target              %6.2f ns/call\n"
	.align 8
.LC9:
	.string	"virtual, 4 targets, i&3        %6.2f ns/call\n"
	.align 8
.LC10:
	.string	"virtual, 4 targets, random     %6.2f ns/call\n"
	.align 8
.LC11:
	.string	"final class, via S0*           %6.2f ns/call\n"
	.section	.rodata.str1.1
.LC12:
	.string	"sink=%g\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB14:
	.section	.text.startup,"ax",@progbits
.LHOTB14:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB13162:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA13162
	endbr64
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
# /usr/include/c++/15/bits/new_allocator.h:151: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	movl	$4096, %edi	#,
# week04_practice/dispatch_bench.cpp:46: int main() {
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$328, %rsp	#,
	.cfi_def_cfa_offset 384
	leaq	144(%rsp), %rax	#, prephitmp_953
	leaq	152(%rsp), %rsi	#, tmp796
# week04_practice/dispatch_bench.cpp:46: int main() {
	movq	%fs:40, %rbx	# MEM[(<address-space-1> long unsigned int *)40B], tmp494
	movq	%rbx, 312(%rsp)	# tmp494, D.219688
	xorl	%ebx, %ebx	# tmp494
	movq	%rax, %xmm5	# prephitmp_953, _343
	movq	%rax, 24(%rsp)	# prephitmp_953, %sfp
# week04_practice/dispatch_bench.cpp:47:     S0 s0; S1 s1; S2 s2; S3 s3;
	leaq	16+_ZTV2S0(%rip), %rax	#, tmp869
	movq	%rax, 112(%rsp)	# tmp869, s0.D.171919._vptr.Strategy
# week04_practice/dispatch_bench.cpp:47:     S0 s0; S1 s1; S2 s2; S3 s3;
	leaq	16+_ZTV2S1(%rip), %rax	#, tmp870
	movq	%rax, 120(%rsp)	# tmp870, s1.D.171941._vptr.Strategy
# week04_practice/dispatch_bench.cpp:47:     S0 s0; S1 s1; S2 s2; S3 s3;
	leaq	16+_ZTV2S2(%rip), %rax	#, tmp871
	movq	%rax, 128(%rsp)	# tmp871, s2.D.171963._vptr.Strategy
# week04_practice/dispatch_bench.cpp:47:     S0 s0; S1 s1; S2 s2; S3 s3;
	leaq	16+_ZTV2S3(%rip), %rax	#, tmp872
	movq	%rax, 136(%rsp)	# tmp872, s3.D.171985._vptr.Strategy
# week04_practice/dispatch_bench.cpp:49:     Strategy* four[4] = {&s0, &s1, &s2, &s3};
	leaq	112(%rsp), %rax	#, tmp794
	movq	%rax, 80(%rsp)	# tmp794, %sfp
	movq	%rax, %xmm0	# tmp794, _320
	leaq	120(%rsp), %rax	#, _492
	movq	%rax, %xmm6	# _492, _492
	leaq	128(%rsp), %rax	#, _115
	movq	%rsi, 32(%rsp)	# tmp796, %sfp
	movhps	32(%rsp), %xmm5	# %sfp, _343
	punpcklqdq	%xmm6, %xmm0	# _492, _320
	movaps	%xmm5, 48(%rsp)	# _343, %sfp
	movaps	%xmm0, 272(%rsp)	# _320, MEM <vector(2) long unsigned int> [(struct Strategy * *)&four]
	movq	%rax, %xmm0	# _115, _115
	leaq	136(%rsp), %rax	#, _134
	movq	%rax, %xmm7	# _134, _134
	punpcklqdq	%xmm7, %xmm0	# _134, _541
	movaps	%xmm0, 288(%rsp)	# _541, MEM <vector(2) long unsigned int> [(struct Strategy * *)&four + 16B]
.LEHB0:
# /usr/include/c++/15/bits/new_allocator.h:151: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	call	_Znwm@PLT	#
.LEHE0:
# /usr/include/c++/15/bits/stl_algobase.h:951: 	__builtin_memset(__first, static_cast<unsigned char>(__val), __len);
	leaq	9(%rax), %rdi	#, tmp515
# /usr/include/c++/15/bits/stl_vector.h:407: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	leaq	4096(%rax), %rsi	#, _97
# /usr/include/c++/15/bits/stl_vector.h:405: 	this->_M_impl._M_start = this->_M_allocate(__n);
	movq	%rax, 176(%rsp)	# tmp806, MEM[(struct _Vector_base *)&pat]._M_impl.D.173558._M_start
# /usr/include/c++/15/bits/new_allocator.h:151: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	movq	%rax, %rdx	#, tmp806
# /usr/include/c++/15/bits/stl_algobase.h:951: 	__builtin_memset(__first, static_cast<unsigned char>(__val), __len);
	andq	$-8, %rdi	#, tmp515
# /usr/include/c++/15/bits/stl_vector.h:407: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	movq	%rsi, 192(%rsp)	# _97, MEM[(struct _Vector_base *)&pat]._M_impl.D.173558._M_end_of_storage
# /usr/include/c++/15/bits/stl_construct.h:133:       ::new(static_cast<void*>(__p)) _Tp(std::forward<_Args>(__args)...);
	movb	$0, (%rax)	#, *_102
# /usr/include/c++/15/bits/stl_algobase.h:951: 	__builtin_memset(__first, static_cast<unsigned char>(__val), __len);
	movq	$0, 1(%rax)	#,
	movq	$0, 4088(%rax)	#,
	subl	%edi, %eax	# tmp515, tmp516
	leal	4096(%rax), %ecx	#, tmp510
	movq	%rbx, %rax	# tmp494, tmp494
	shrl	$3, %ecx	#, tmp518
	rep stosq
	movq	%rdx, %rax	# tmp806, ivtmp.813
# /usr/include/c++/15/bits/stl_vector.h:2010: 	this->_M_impl._M_finish =
	movq	%rsi, 184(%rsp)	# _97, pat.D.174220._M_impl.D.173558._M_finish
	movl	$12345, %edx	#, x
# week04_practice/dispatch_bench.cpp:53:     for (auto& p : pat) {
	cmpq	%rsi, %rax	# _97, ivtmp.813
	je	.L171	#,
	.p2align 5
	.p2align 4
	.p2align 3
.L170:
# week04_practice/dispatch_bench.cpp:54:         x = x * 1664525u + 1013904223u;
	imull	$1664525, %edx, %edx	#, x, _1
# week04_practice/dispatch_bench.cpp:53:     for (auto& p : pat) {
	addq	$1, %rax	#, ivtmp.813
# week04_practice/dispatch_bench.cpp:54:         x = x * 1664525u + 1013904223u;
	addl	$1013904223, %edx	#, x
# week04_practice/dispatch_bench.cpp:55:         p = (x >> 24) & 3;
	movl	%edx, %ecx	# x, _2
	shrl	$24, %ecx	#, _2
# week04_practice/dispatch_bench.cpp:55:         p = (x >> 24) & 3;
	andl	$3, %ecx	#, tmp523
	movb	%cl, -1(%rax)	# tmp523, MEM[(unsigned char &)_691]
# week04_practice/dispatch_bench.cpp:53:     for (auto& p : pat) {
	cmpq	%rax, %rsi	# ivtmp.813, _97
	jne	.L170	#,
.L171:
# week04_practice/dispatch_bench.cpp:57:     double bid = 100.00, ask = 100.02;
	movsd	.LC1(%rip), %xmm3	#, tmp519
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	pxor	%xmm0, %xmm0	# tmp521
	xorl	%ebx, %ebx	# ivtmp.794
# week04_practice/dispatch_bench.cpp:57:     double bid = 100.00, ask = 100.02;
	movsd	.LC2(%rip), %xmm2	#, tmp520
# week04_practice/dispatch_bench.cpp:70:     double t_direct = run([&](double a, long) {
	movdqa	48(%rsp), %xmm6	# %sfp, _343
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	movaps	%xmm0, 240(%rsp)	# tmp521, MEM[(struct vector *)_1063]
# week04_practice/dispatch_bench.cpp:60:         double acc = 0.0;
	pxor	%xmm0, %xmm0	# acc
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	movl	$2000001, %r15d	#, ivtmp.806
# week04_practice/dispatch_bench.cpp:57:     double bid = 100.00, ask = 100.02;
	movsd	%xmm3, 144(%rsp)	# tmp519, bid
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	movl	$22000001, %r14d	#, ivtmp.804
	movq	$0, 256(%rsp)	#, MEM[(struct vector *)_1063]
# week04_practice/dispatch_bench.cpp:57:     double bid = 100.00, ask = 100.02;
	movsd	%xmm2, 152(%rsp)	# tmp520, ask
# week04_practice/dispatch_bench.cpp:70:     double t_direct = run([&](double a, long) {
	movups	%xmm6, 216(%rsp)	# _343, MEM <vector(2) long unsigned int> [(double & *)_346 + 8B]
	.p2align 4
	.p2align 3
.L169:
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	pxor	%xmm1, %xmm1	# _770
# week04_practice/dispatch_bench.cpp:32:         return o*(a - b);
	subsd	%xmm3, %xmm2	# pretmp_336, _761
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	cvtsi2sdq	%rbx, %xmm1	# ivtmp.794, _770
	mulsd	.LC4(%rip), %xmm1	#, _767
# week04_practice/dispatch_bench.cpp:32:         return o*(a - b);
	mulsd	%xmm2, %xmm1	# _761, _755
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	addsd	%xmm1, %xmm0	# _755, acc
# week04_practice/../tests/bench.hpp:16:     asm volatile("" : : "g"(v) : "memory");
	movq	%xmm0, %rax	# acc, acc
# week04_practice/dispatch_bench.cpp:66:             g_sink = acc;
	movsd	%xmm0, _ZL6g_sink(%rip)	# acc, g_sink
	leaq	-22000000(%r14), %rax	#, ivtmp.789
	.p2align 4
	.p2align 3
.L172:
# week04_practice/dispatch_bench.cpp:32:         return o*(a - b);
	movq	224(%rsp), %rdx	# MEM[(struct ._anon_176 *)_346].__ask, MEM[(struct ._anon_176 *)_346].__ask
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	pxor	%xmm2, %xmm2	# _145
# week04_practice/dispatch_bench.cpp:32:         return o*(a - b);
	movsd	(%rdx), %xmm1	# *pretmp_339, *pretmp_339
	movq	216(%rsp), %rdx	# MEM[(struct ._anon_176 *)_346].__bid, MEM[(struct ._anon_176 *)_346].__bid
	subsd	(%rdx), %xmm1	# *pretmp_318, _151
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	movq	%rax, %rdx	# ivtmp.789, _997
	andl	$7, %edx	#, _997
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	cvtsi2sdq	%rdx, %xmm2	# _997, _145
	mulsd	.LC4(%rip), %xmm2	#, _146
# week04_practice/dispatch_bench.cpp:32:         return o*(a - b);
	mulsd	%xmm2, %xmm1	# _146, _152
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	addsd	%xmm1, %xmm0	# _152, acc
# week04_practice/../tests/bench.hpp:16:     asm volatile("" : : "g"(v) : "memory");
	movq	%xmm0, %rcx	# acc, acc
# week04_practice/../tests/bench.hpp:71:     for (long i = 0; i < iters / 10 + 1; ++i) f();          // warm up
	addq	$1, %rax	#, ivtmp.789
# week04_practice/dispatch_bench.cpp:66:             g_sink = acc;
	movsd	%xmm0, _ZL6g_sink(%rip)	# acc, g_sink
# week04_practice/../tests/bench.hpp:71:     for (long i = 0; i < iters / 10 + 1; ++i) f();          // warm up
	cmpq	%rax, %r15	# ivtmp.789, ivtmp.806
	jne	.L172	#,
	movsd	%xmm0, (%rsp)	# acc, %sfp
	movq	%r15, %r12	# ivtmp.806, i
# week04_practice/../tests/bench.hpp:72:     auto t0 = std::chrono::steady_clock::now();
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT	#
	movsd	(%rsp), %xmm0	# %sfp, acc
	movq	%rax, %rbp	#, t0
	.p2align 4
	.p2align 3
.L173:
# week04_practice/dispatch_bench.cpp:32:         return o*(a - b);
	movq	224(%rsp), %rax	# MEM[(struct ._anon_176 *)_346].__ask, MEM[(struct ._anon_176 *)_346].__ask
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	pxor	%xmm2, %xmm2	# _163
# week04_practice/dispatch_bench.cpp:32:         return o*(a - b);
	movsd	(%rax), %xmm1	# *_165, *_165
	movq	216(%rsp), %rax	# MEM[(struct ._anon_176 *)_346].__bid, MEM[(struct ._anon_176 *)_346].__bid
	subsd	(%rax), %xmm1	# *_167, _169
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	movq	%r12, %rax	# i, _162
# week04_practice/dispatch_bench.cpp:64:             ++i;
	addq	$1, %r12	#, i
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	andl	$7, %eax	#, _162
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	cvtsi2sdq	%rax, %xmm2	# _162, _163
	mulsd	.LC4(%rip), %xmm2	#, _164
# week04_practice/dispatch_bench.cpp:32:         return o*(a - b);
	mulsd	%xmm2, %xmm1	# _164, _170
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	addsd	%xmm1, %xmm0	# _170, acc
# week04_practice/../tests/bench.hpp:16:     asm volatile("" : : "g"(v) : "memory");
	movq	%xmm0, %rax	# acc, acc
# week04_practice/dispatch_bench.cpp:66:             g_sink = acc;
	movsd	%xmm0, _ZL6g_sink(%rip)	# acc, g_sink
# week04_practice/../tests/bench.hpp:73:     for (long i = 0; i < iters; ++i) f();
	cmpq	%r14, %r12	# ivtmp.804, i
	jne	.L173	#,
	movsd	%xmm0, (%rsp)	# acc, %sfp
# week04_practice/../tests/bench.hpp:74:     auto t1 = std::chrono::steady_clock::now();
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT	#
# /usr/include/c++/15/bits/chrono.h:205: 	    return _ToDur(static_cast<__to_rep>(__d.count()));
	pxor	%xmm1, %xmm1	# _138
# /usr/include/c++/15/bits/vector.tcc:114: 	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
	movsd	(%rsp), %xmm0	# %sfp, acc
# /usr/include/c++/15/bits/vector.tcc:114: 	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
	movq	248(%rsp), %rcx	# MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_finish, _124
# /usr/include/c++/15/bits/vector.tcc:114: 	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
	movq	256(%rsp), %rsi	# MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_end_of_storage, _125
# /usr/include/c++/15/bits/chrono.h:720: 	return __cd(__cd(__lhs).count() - __cd(__rhs).count());
	subq	%rbp, %rax	# t0, _137
# /usr/include/c++/15/bits/chrono.h:205: 	    return _ToDur(static_cast<__to_rep>(__d.count()));
	cvtsi2sdq	%rax, %xmm1	# _137, _138
# week04_practice/../tests/bench.hpp:75:     return std::chrono::duration<double, std::nano>(t1 - t0).count() / iters;
	divsd	.LC5(%rip), %xmm1	#, _140
# /usr/include/c++/15/bits/vector.tcc:114: 	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
	cmpq	%rsi, %rcx	# _125, _124
	je	.L174	#,
# /usr/include/c++/15/bits/stl_construct.h:110: 	return ::new(__loc) _Tp(std::forward<_Args>(__args)...);
	movsd	%xmm1, (%rcx)	# _140, *_124
# week04_practice/dispatch_bench.cpp:41:     for (int i = 0; i < reps; ++i) v.push_back(ns_per_op(f, N));
	addq	$22000001, %r14	#, ivtmp.804
# /usr/include/c++/15/bits/vector.tcc:119: 	    ++this->_M_impl._M_finish;
	addq	$8, %rcx	#, tmp545
	movq	%rcx, 248(%rsp)	# tmp545, MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_finish
# week04_practice/dispatch_bench.cpp:41:     for (int i = 0; i < reps; ++i) v.push_back(ns_per_op(f, N));
	cmpq	$176000008, %r14	#, ivtmp.804
	je	.L180	#,
.L306:
# week04_practice/dispatch_bench.cpp:71:         return d.on_book(bid, ask, a);
	movq	224(%rsp), %rax	# MEM[(struct ._anon_176 *)_346].__ask, MEM[(struct ._anon_176 *)_346].__ask
# week04_practice/dispatch_bench.cpp:41:     for (int i = 0; i < reps; ++i) v.push_back(ns_per_op(f, N));
	addq	$1, %rbx	#, ivtmp.794
	addq	$22000001, %r15	#, ivtmp.806
# week04_practice/dispatch_bench.cpp:71:         return d.on_book(bid, ask, a);
	movsd	(%rax), %xmm2	# *pretmp_425, prephitmp_359
	movq	216(%rsp), %rax	# MEM[(struct ._anon_176 *)_346].__bid, MEM[(struct ._anon_176 *)_346].__bid
	movsd	(%rax), %xmm3	# *pretmp_351, pretmp_336
	jmp	.L169	#
	.p2align 4,,10
	.p2align 3
.L174:
	movq	240(%rsp), %r12	# MEM[(double * *)_1063], _195
# /usr/include/c++/15/bits/stl_vector.h:2204: 	if (max_size() - size() < __n)
	movabsq	$1152921504606846975, %rdi	#, tmp886
# /usr/include/c++/15/bits/stl_vector.h:1119: 	ptrdiff_t __dif = this->_M_impl._M_finish - this->_M_impl._M_start;
	subq	%r12, %rcx	# _195, _199
# /usr/include/c++/15/bits/stl_vector.h:1119: 	ptrdiff_t __dif = this->_M_impl._M_finish - this->_M_impl._M_start;
	movq	%rcx, %rax	# _199, __dif_200
	sarq	$3, %rax	#, __dif_200
# /usr/include/c++/15/bits/stl_vector.h:2204: 	if (max_size() - size() < __n)
	cmpq	%rdi, %rax	# tmp886, __dif_200
	je	.L296	#,
# /usr/include/c++/15/bits/stl_algobase.h:263:       if (__a < __b)
	testq	%rax, %rax	# __dif_200
	movl	$1, %ebp	#, tmp842
	movq	%rcx, 88(%rsp)	# _199, %sfp
	cmovne	%rax, %rbp	# __dif_200,, _93
	movq	%rsi, (%rsp)	# _125, %sfp
	movsd	%xmm0, 64(%rsp)	# acc, %sfp
# /usr/include/c++/15/bits/stl_vector.h:2207: 	const size_type __len = size() + (std::max)(size(), __n);
	addq	%rax, %rbp	# __dif_200, __len_105
	movsd	%xmm1, 40(%rsp)	# _140, %sfp
# /usr/include/c++/15/bits/stl_vector.h:2208: 	return (__len < size() || __len > max_size()) ? max_size() : __len;
	movabsq	$1152921504606846975, %rax	#, tmp843
	cmpq	%rax, %rbp	# tmp843, __len_105
	cmova	%rax, %rbp	# __len_105,, tmp843, __len_105
# /usr/include/c++/15/bits/new_allocator.h:151: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	salq	$3, %rbp	#, _210
	movq	%rbp, %rdi	# _210,
.LEHB1:
	call	_Znwm@PLT	#
.LEHE1:
# /usr/include/c++/15/bits/stl_construct.h:110: 	return ::new(__loc) _Tp(std::forward<_Args>(__args)...);
	movq	88(%rsp), %rcx	# %sfp, _199
	movsd	40(%rsp), %xmm1	# %sfp, _140
# /usr/include/c++/15/bits/new_allocator.h:151: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	movq	%rax, %r13	#, _211
# /usr/include/c++/15/bits/stl_uninitialized.h:1331:       if (__count > 0)
	movq	(%rsp), %rsi	# %sfp, _125
	movsd	64(%rsp), %xmm0	# %sfp, acc
	testq	%rcx, %rcx	# _199
# /usr/include/c++/15/bits/stl_construct.h:110: 	return ::new(__loc) _Tp(std::forward<_Args>(__args)...);
	movsd	%xmm1, (%rax,%rcx)	# _140, *_185
# /usr/include/c++/15/bits/stl_uninitialized.h:1331:       if (__count > 0)
	je	.L178	#,
# /usr/include/c++/15/bits/stl_uninitialized.h:1343: 	  __builtin_memcpy(__result, __first, __count * sizeof(_Tp));
	movq	%rcx, %rdx	# _199,
	movq	%r12, %rsi	# _195,
	movq	%rax, %rdi	# _211,
	movq	%rcx, (%rsp)	# _199, %sfp
	movsd	%xmm0, 40(%rsp)	# acc, %sfp
	call	memcpy@PLT	#
# /usr/include/c++/15/bits/vector.tcc:639: 	__guard._M_len = this->_M_impl._M_end_of_storage - __old_start;
	movsd	40(%rsp), %xmm0	# %sfp, acc
	movq	(%rsp), %rcx	# %sfp, _199
	movq	256(%rsp), %rsi	# MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_end_of_storage, _125
.L178:
# /usr/include/c++/15/bits/vector.tcc:601: 	    ++__new_finish;
	leaq	8(%r13,%rcx), %rax	#, __new_finish
# /usr/include/c++/15/bits/stl_vector.h:1882: 	  if (_M_storage)
	testq	%r12, %r12	# _195
	je	.L179	#,
# /usr/include/c++/15/bits/vector.tcc:639: 	__guard._M_len = this->_M_impl._M_end_of_storage - __old_start;
	subq	%r12, %rsi	# _195, _190
# /usr/include/c++/15/bits/new_allocator.h:172: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	movq	%r12, %rdi	# _195,
	movq	%rax, 40(%rsp)	# __new_finish, %sfp
	movsd	%xmm0, (%rsp)	# acc, %sfp
	call	_ZdlPvm@PLT	#
	movq	40(%rsp), %rax	# %sfp, __new_finish
	movsd	(%rsp), %xmm0	# %sfp, acc
.L179:
# /usr/include/c++/15/bits/vector.tcc:646:       this->_M_impl._M_end_of_storage = __new_start + __len;
	leaq	0(%r13,%rbp), %r8	#, tmp560
# week04_practice/dispatch_bench.cpp:41:     for (int i = 0; i < reps; ++i) v.push_back(ns_per_op(f, N));
	addq	$22000001, %r14	#, ivtmp.804
# /usr/include/c++/15/bits/vector.tcc:644:       this->_M_impl._M_start = __new_start;
	movq	%r13, 240(%rsp)	# _211, MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_start
# /usr/include/c++/15/bits/vector.tcc:645:       this->_M_impl._M_finish = __new_finish;
	movq	%rax, 248(%rsp)	# __new_finish, MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_finish
# /usr/include/c++/15/bits/vector.tcc:646:       this->_M_impl._M_end_of_storage = __new_start + __len;
	movq	%r8, 256(%rsp)	# tmp560, MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_end_of_storage
# week04_practice/dispatch_bench.cpp:41:     for (int i = 0; i < reps; ++i) v.push_back(ns_per_op(f, N));
	cmpq	$176000008, %r14	#, ivtmp.804
	jne	.L306	#,
	.p2align 4
	.p2align 3
.L180:
# /usr/include/c++/15/bits/stl_algo.h:4841:       std::__sort(__first, __last, __gnu_cxx::__ops::__iter_less_iter());
	movq	248(%rsp), %rsi	# MEM[(double * const &)_1063 + 8],
	movq	240(%rsp), %rdi	# MEM[(double * const &)_1063],
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	movl	$7, %ebp	#, ivtmp_867
# week04_practice/dispatch_bench.cpp:60:         double acc = 0.0;
	xorl	%r15d, %r15d	# acc
	leaq	160(%rsp), %rbx	#, _333
	movq	%rbx, %xmm0	# _333, tmp568
	movhps	24(%rsp), %xmm0	# %sfp, tmp568
	movaps	%xmm0, (%rsp)	# tmp568, %sfp
# /usr/include/c++/15/bits/stl_algo.h:4841:       std::__sort(__first, __last, __gnu_cxx::__ops::__iter_less_iter());
	call	_ZSt6__sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEENS0_5__ops15_Iter_less_iterEEvT_S9_T0_.isra.0	#
# week04_practice/dispatch_bench.cpp:43:     return v[reps / 2];
	movq	240(%rsp), %rax	# MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_start, MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_start
	movsd	24(%rax), %xmm7	# MEM[(value_type &)_120 + 24], _123
# /usr/include/c++/15/bits/stl_vector.h:805:       }
	leaq	240(%rsp), %rax	#, tmp799
	movq	%rax, %rdi	# tmp799,
	movq	%rax, 40(%rsp)	# tmp799, %sfp
# week04_practice/dispatch_bench.cpp:43:     return v[reps / 2];
	movsd	%xmm7, 96(%rsp)	# _123, %sfp
# /usr/include/c++/15/bits/stl_vector.h:805:       }
	call	_ZNSt12_Vector_baseIdSaIdEED2Ev	#
# week04_practice/dispatch_bench.cpp:74:     double t_virt1 = run([&](double a, long) {
	movq	32(%rsp), %rdx	# %sfp, tmp796
	movdqa	(%rsp), %xmm0	# %sfp, tmp568
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	movq	$0, 256(%rsp)	#, MEM[(struct vector *)_1063]
# week04_practice/dispatch_bench.cpp:73:     Strategy* volatile hide = one;
	movq	80(%rsp), %rax	# %sfp, tmp794
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	movq	24(%rsp), %rsi	# %sfp, pretmp_208
# week04_practice/dispatch_bench.cpp:74:     double t_virt1 = run([&](double a, long) {
	movq	%rdx, 224(%rsp)	# tmp796, MEM[(struct ._anon_178 *)_346].__ask
	movaps	%xmm0, 208(%rsp)	# tmp568, MEM <vector(2) long unsigned int> [(void *)_346]
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	pxor	%xmm0, %xmm0	# tmp575
# week04_practice/dispatch_bench.cpp:73:     Strategy* volatile hide = one;
	movq	%rax, 160(%rsp)	# tmp794, hide
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	movq	%rbx, %rax	# _333, pretmp_221
# week04_practice/dispatch_bench.cpp:61:         long i = 0;
	xorl	%ebx, %ebx	# i
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	movaps	%xmm0, 240(%rsp)	# tmp575, MEM[(struct vector *)_1063]
	.p2align 4
	.p2align 3
.L181:
	leaq	2000001(%rbx), %r12	#, _475
	jmp	.L193	#
	.p2align 4,,10
	.p2align 3
.L184:
# week04_practice/dispatch_bench.cpp:75:         return hide->on_book(bid, ask, a);
	movq	208(%rsp), %rax	# MEM[(struct ._anon_178 *)_346].__hide, pretmp_221
# week04_practice/dispatch_bench.cpp:75:         return hide->on_book(bid, ask, a);
	movq	224(%rsp), %rdx	# MEM[(struct ._anon_178 *)_346].__ask, prephitmp_207
# week04_practice/dispatch_bench.cpp:64:             ++i;
	movq	%r13, %rbx	# _274, i
# week04_practice/dispatch_bench.cpp:75:         return hide->on_book(bid, ask, a);
	movq	216(%rsp), %rsi	# MEM[(struct ._anon_178 *)_346].__bid, pretmp_208
.L193:
# week04_practice/dispatch_bench.cpp:75:         return hide->on_book(bid, ask, a);
	movq	(%rax), %rdi	# *prephitmp_222, _254
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	movq	%rbx, %rax	# i, _241
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	pxor	%xmm2, %xmm2	# _242
# week04_practice/dispatch_bench.cpp:75:         return hide->on_book(bid, ask, a);
	movsd	(%rsi), %xmm0	# *prephitmp_209, *prephitmp_209
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	andl	$7, %eax	#, _241
# week04_practice/dispatch_bench.cpp:75:         return hide->on_book(bid, ask, a);
	movsd	(%rdx), %xmm1	# *prephitmp_207,
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	cvtsi2sdq	%rax, %xmm2	# _241, _242
# week04_practice/dispatch_bench.cpp:75:         return hide->on_book(bid, ask, a);
	movq	(%rdi), %rax	# _254->_vptr.Strategy, _254->_vptr.Strategy
	mulsd	.LC4(%rip), %xmm2	#,
.LEHB2:
	call	*16(%rax)	# MEM[(int (*) () *)_255 + 16B]
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	movq	%r15, %xmm4	# acc, acc
# week04_practice/dispatch_bench.cpp:64:             ++i;
	leaq	1(%rbx), %r13	#, _274
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	addsd	%xmm0, %xmm4	# _261, acc
	movq	%xmm4, %r15	# acc, acc
# week04_practice/../tests/bench.hpp:16:     asm volatile("" : : "g"(v) : "memory");
# week04_practice/dispatch_bench.cpp:66:             g_sink = acc;
	movsd	%xmm4, _ZL6g_sink(%rip)	# acc, g_sink
# week04_practice/../tests/bench.hpp:71:     for (long i = 0; i < iters / 10 + 1; ++i) f();          // warm up
	cmpq	%r12, %r13	# _475, _274
	jne	.L184	#,
# week04_practice/../tests/bench.hpp:72:     auto t0 = std::chrono::steady_clock::now();
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT	#
	addq	$20000001, %rbx	#, _735
	movq	%rax, %r12	#, t0
	.p2align 4
	.p2align 3
.L185:
# week04_practice/dispatch_bench.cpp:75:         return hide->on_book(bid, ask, a);
	movq	208(%rsp), %rax	# MEM[(struct ._anon_178 *)_346].__hide, _277
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	pxor	%xmm2, %xmm2	# _266
# week04_practice/dispatch_bench.cpp:75:         return hide->on_book(bid, ask, a);
	movq	224(%rsp), %rdx	# MEM[(struct ._anon_178 *)_346].__ask, MEM[(struct ._anon_178 *)_346].__ask
# week04_practice/dispatch_bench.cpp:75:         return hide->on_book(bid, ask, a);
	movq	(%rax), %rdi	# *_277, _278
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	movq	%r13, %rax	# _274, _265
# week04_practice/dispatch_bench.cpp:75:         return hide->on_book(bid, ask, a);
	movsd	(%rdx), %xmm1	# *_281,
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	andl	$7, %eax	#, _265
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	cvtsi2sdq	%rax, %xmm2	# _265, _266
# week04_practice/dispatch_bench.cpp:75:         return hide->on_book(bid, ask, a);
	movq	216(%rsp), %rax	# MEM[(struct ._anon_178 *)_346].__bid, MEM[(struct ._anon_178 *)_346].__bid
	mulsd	.LC4(%rip), %xmm2	#,
	movsd	(%rax), %xmm0	# *_283, *_283
	movq	(%rdi), %rax	# _278->_vptr.Strategy, _278->_vptr.Strategy
	call	*16(%rax)	# MEM[(int (*) () *)_279 + 16B]
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	movq	%r15, %xmm5	# acc, acc
# week04_practice/dispatch_bench.cpp:64:             ++i;
	addq	$1, %r13	#, _274
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	addsd	%xmm0, %xmm5	# _285, acc
	movq	%xmm5, %r15	# acc, acc
# week04_practice/../tests/bench.hpp:16:     asm volatile("" : : "g"(v) : "memory");
# week04_practice/dispatch_bench.cpp:66:             g_sink = acc;
	movsd	%xmm5, _ZL6g_sink(%rip)	# acc, g_sink
# week04_practice/../tests/bench.hpp:73:     for (long i = 0; i < iters; ++i) f();
	cmpq	%rbx, %r13	# _735, _274
	jne	.L185	#,
# week04_practice/../tests/bench.hpp:74:     auto t1 = std::chrono::steady_clock::now();
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT	#
# /usr/include/c++/15/bits/chrono.h:205: 	    return _ToDur(static_cast<__to_rep>(__d.count()));
	pxor	%xmm0, %xmm0	# _235
# /usr/include/c++/15/bits/vector.tcc:114: 	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
	movq	256(%rsp), %rsi	# MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_end_of_storage, prephitmp_198
# /usr/include/c++/15/bits/chrono.h:720: 	return __cd(__cd(__lhs).count() - __cd(__rhs).count());
	subq	%r12, %rax	# t0, _234
# /usr/include/c++/15/bits/chrono.h:205: 	    return _ToDur(static_cast<__to_rep>(__d.count()));
	cvtsi2sdq	%rax, %xmm0	# _234, _235
# /usr/include/c++/15/bits/vector.tcc:114: 	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
	movq	248(%rsp), %rax	# MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_finish, _286
# week04_practice/../tests/bench.hpp:75:     return std::chrono::duration<double, std::nano>(t1 - t0).count() / iters;
	divsd	.LC5(%rip), %xmm0	#, _237
# /usr/include/c++/15/bits/vector.tcc:114: 	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
	cmpq	%rsi, %rax	# prephitmp_198, _286
	je	.L186	#,
# /usr/include/c++/15/bits/stl_construct.h:110: 	return ::new(__loc) _Tp(std::forward<_Args>(__args)...);
	movsd	%xmm0, (%rax)	# _237, *_286
# /usr/include/c++/15/bits/vector.tcc:119: 	    ++this->_M_impl._M_finish;
	addq	$8, %rax	#, tmp602
	movq	%rax, 248(%rsp)	# tmp602, MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_finish
# week04_practice/dispatch_bench.cpp:41:     for (int i = 0; i < reps; ++i) v.push_back(ns_per_op(f, N));
	subl	$1, %ebp	#, ivtmp_867
	je	.L192	#,
.L307:
# week04_practice/dispatch_bench.cpp:75:         return hide->on_book(bid, ask, a);
	movq	208(%rsp), %rax	# MEM[(struct ._anon_178 *)_346].__hide, pretmp_221
# week04_practice/dispatch_bench.cpp:75:         return hide->on_book(bid, ask, a);
	movq	224(%rsp), %rdx	# MEM[(struct ._anon_178 *)_346].__ask, prephitmp_207
# week04_practice/dispatch_bench.cpp:64:             ++i;
	movq	%r13, %rbx	# _274, i
# week04_practice/dispatch_bench.cpp:75:         return hide->on_book(bid, ask, a);
	movq	216(%rsp), %rsi	# MEM[(struct ._anon_178 *)_346].__bid, pretmp_208
	jmp	.L181	#
	.p2align 4,,10
	.p2align 3
.L186:
	movq	240(%rsp), %r8	# MEM[(double * *)_1063], _310
# /usr/include/c++/15/bits/stl_vector.h:2204: 	if (max_size() - size() < __n)
	movabsq	$1152921504606846975, %rcx	#, tmp899
# /usr/include/c++/15/bits/stl_vector.h:1119: 	ptrdiff_t __dif = this->_M_impl._M_finish - this->_M_impl._M_start;
	subq	%r8, %rax	# _310, _286
	movq	%rax, %r12	# _286, _314
# /usr/include/c++/15/bits/stl_vector.h:1119: 	ptrdiff_t __dif = this->_M_impl._M_finish - this->_M_impl._M_start;
	sarq	$3, %rax	#, __dif_315
# /usr/include/c++/15/bits/stl_vector.h:2204: 	if (max_size() - size() < __n)
	cmpq	%rcx, %rax	# tmp899, __dif_315
	je	.L297	#,
# /usr/include/c++/15/bits/stl_algobase.h:263:       if (__a < __b)
	testq	%rax, %rax	# __dif_315
	movl	$1, %ebx	#, tmp840
	movq	%r8, 88(%rsp)	# _310, %sfp
	cmovne	%rax, %rbx	# __dif_315,, _557
	movq	%rsi, (%rsp)	# prephitmp_198, %sfp
	movsd	%xmm0, 64(%rsp)	# _237, %sfp
# /usr/include/c++/15/bits/stl_vector.h:2207: 	const size_type __len = size() + (std::max)(size(), __n);
	addq	%rax, %rbx	# __dif_315, __len_539
# /usr/include/c++/15/bits/stl_vector.h:2208: 	return (__len < size() || __len > max_size()) ? max_size() : __len;
	movabsq	$1152921504606846975, %rax	#, tmp841
	cmpq	%rax, %rbx	# tmp841, __len_539
	cmova	%rax, %rbx	# __len_539,, tmp841, __len_539
# /usr/include/c++/15/bits/new_allocator.h:151: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	salq	$3, %rbx	#, _325
	movq	%rbx, %rdi	# _325,
	call	_Znwm@PLT	#
.LEHE2:
# /usr/include/c++/15/bits/stl_construct.h:110: 	return ::new(__loc) _Tp(std::forward<_Args>(__args)...);
	movsd	64(%rsp), %xmm0	# %sfp, _237
# /usr/include/c++/15/bits/stl_uninitialized.h:1331:       if (__count > 0)
	testq	%r12, %r12	# _314
	movq	(%rsp), %rsi	# %sfp, prephitmp_198
# /usr/include/c++/15/bits/new_allocator.h:151: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	movq	%rax, %r14	#, _326
# /usr/include/c++/15/bits/stl_uninitialized.h:1331:       if (__count > 0)
	movq	88(%rsp), %r8	# %sfp, _310
# /usr/include/c++/15/bits/stl_construct.h:110: 	return ::new(__loc) _Tp(std::forward<_Args>(__args)...);
	movsd	%xmm0, (%rax,%r12)	# _237, *_300
# /usr/include/c++/15/bits/stl_uninitialized.h:1331:       if (__count > 0)
	je	.L190	#,
# /usr/include/c++/15/bits/stl_uninitialized.h:1343: 	  __builtin_memcpy(__result, __first, __count * sizeof(_Tp));
	movq	%r8, %rsi	# _310,
	movq	%r12, %rdx	# _314,
	movq	%rax, %rdi	# _326,
	movq	%r8, (%rsp)	# _310, %sfp
	call	memcpy@PLT	#
# /usr/include/c++/15/bits/vector.tcc:639: 	__guard._M_len = this->_M_impl._M_end_of_storage - __old_start;
	movq	256(%rsp), %rsi	# MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_end_of_storage, prephitmp_198
	movq	(%rsp), %r8	# %sfp, _310
.L190:
# /usr/include/c++/15/bits/vector.tcc:601: 	    ++__new_finish;
	leaq	8(%r14,%r12), %r12	#, __new_finish
# /usr/include/c++/15/bits/stl_vector.h:1882: 	  if (_M_storage)
	testq	%r8, %r8	# _310
	je	.L191	#,
# /usr/include/c++/15/bits/vector.tcc:639: 	__guard._M_len = this->_M_impl._M_end_of_storage - __old_start;
	subq	%r8, %rsi	# _310, _305
# /usr/include/c++/15/bits/new_allocator.h:172: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	movq	%r8, %rdi	# _310,
	call	_ZdlPvm@PLT	#
.L191:
# /usr/include/c++/15/bits/vector.tcc:646:       this->_M_impl._M_end_of_storage = __new_start + __len;
	leaq	(%r14,%rbx), %r9	#, tmp617
# /usr/include/c++/15/bits/vector.tcc:644:       this->_M_impl._M_start = __new_start;
	movq	%r14, 240(%rsp)	# _326, MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_start
# /usr/include/c++/15/bits/vector.tcc:645:       this->_M_impl._M_finish = __new_finish;
	movq	%r12, 248(%rsp)	# __new_finish, MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_finish
# /usr/include/c++/15/bits/vector.tcc:646:       this->_M_impl._M_end_of_storage = __new_start + __len;
	movq	%r9, 256(%rsp)	# tmp617, MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_end_of_storage
# week04_practice/dispatch_bench.cpp:41:     for (int i = 0; i < reps; ++i) v.push_back(ns_per_op(f, N));
	subl	$1, %ebp	#, ivtmp_867
	jne	.L307	#,
	.p2align 4
	.p2align 3
.L192:
	leaq	272(%rsp), %rax	#, prephitmp_34
	leaq	176(%rsp), %rbx	#, _931
# /usr/include/c++/15/bits/stl_algo.h:4841:       std::__sort(__first, __last, __gnu_cxx::__ops::__iter_less_iter());
	movq	248(%rsp), %rsi	# MEM[(double * const &)_1063 + 8],
	movq	240(%rsp), %rdi	# MEM[(double * const &)_1063],
	movq	%rbx, %xmm6	# _931, _931
	movq	%rax, %xmm0	# prephitmp_34, tmp618
	movq	%rax, (%rsp)	# prephitmp_34, %sfp
# week04_practice/dispatch_bench.cpp:60:         double acc = 0.0;
	xorl	%r13d, %r13d	# acc
	punpcklqdq	%xmm6, %xmm0	# _931, tmp618
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	movl	$7, %r12d	#, ivtmp_879
	movaps	%xmm0, 64(%rsp)	# tmp618, %sfp
# /usr/include/c++/15/bits/stl_algo.h:4841:       std::__sort(__first, __last, __gnu_cxx::__ops::__iter_less_iter());
	call	_ZSt6__sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEENS0_5__ops15_Iter_less_iterEEvT_S9_T0_.isra.0	#
# week04_practice/dispatch_bench.cpp:43:     return v[reps / 2];
	movq	240(%rsp), %rax	# MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_start, MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_start
# /usr/include/c++/15/bits/stl_vector.h:805:       }
	movq	40(%rsp), %rdi	# %sfp,
# week04_practice/dispatch_bench.cpp:43:     return v[reps / 2];
	movsd	24(%rax), %xmm7	# MEM[(value_type &)_223 + 24], _226
	movsd	%xmm7, 104(%rsp)	# _226, %sfp
# /usr/include/c++/15/bits/stl_vector.h:805:       }
	call	_ZNSt12_Vector_baseIdSaIdEED2Ev	#
# week04_practice/dispatch_bench.cpp:77:     double t_virt4r = run([&](double a, long i) {
	movdqa	64(%rsp), %xmm0	# %sfp, tmp618
	movdqa	48(%rsp), %xmm5	# %sfp, _343
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	movq	$0, 224(%rsp)	#, MEM[(struct vector *)_346]
	movq	24(%rsp), %rsi	# %sfp, pretmp_98
	movq	32(%rsp), %rdx	# %sfp, prephitmp_108
	movq	%rbx, %rax	# _931, prephitmp_109
# week04_practice/dispatch_bench.cpp:61:         long i = 0;
	xorl	%ebx, %ebx	# i
# week04_practice/dispatch_bench.cpp:77:     double t_virt4r = run([&](double a, long i) {
	movaps	%xmm0, 240(%rsp)	# tmp618, MEM <vector(2) long unsigned int> [(void *)_1063]
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	movq	(%rsp), %rdi	# %sfp, pretmp_118
	pxor	%xmm0, %xmm0	# tmp622
# week04_practice/dispatch_bench.cpp:77:     double t_virt4r = run([&](double a, long i) {
	movaps	%xmm5, 256(%rsp)	# _343, MEM <vector(2) long unsigned int> [(void *)_1063 + 16B]
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	movaps	%xmm0, 208(%rsp)	# tmp622, MEM[(struct vector *)_346]
	.p2align 4
	.p2align 3
.L194:
	leaq	2000001(%rbx), %r14	#, _36
	jmp	.L205	#
	.p2align 4,,10
	.p2align 3
.L196:
# week04_practice/dispatch_bench.cpp:78:         return four[pat[i & 4095]]->on_book(bid, ask, a);
	movq	240(%rsp), %rdi	# MEM[(struct ._anon_180 *)_1063].__four, pretmp_118
# week04_practice/dispatch_bench.cpp:78:         return four[pat[i & 4095]]->on_book(bid, ask, a);
	movq	248(%rsp), %rax	# MEM[(struct ._anon_180 *)_1063].__pat, prephitmp_109
# week04_practice/dispatch_bench.cpp:64:             ++i;
	movq	%r15, %rbx	# _396, i
# week04_practice/dispatch_bench.cpp:78:         return four[pat[i & 4095]]->on_book(bid, ask, a);
	movq	264(%rsp), %rdx	# MEM[(struct ._anon_180 *)_1063].__ask, prephitmp_108
	movq	256(%rsp), %rsi	# MEM[(struct ._anon_180 *)_1063].__bid, pretmp_98
.L205:
	movq	(%rax), %rax	# prephitmp_109->D.174220._M_impl.D.173558._M_start, prephitmp_109->D.174220._M_impl.D.173558._M_start
# week04_practice/dispatch_bench.cpp:78:         return four[pat[i & 4095]]->on_book(bid, ask, a);
	movq	%rbx, %rcx	# i, _370
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	pxor	%xmm2, %xmm2	# _357
# week04_practice/dispatch_bench.cpp:78:         return four[pat[i & 4095]]->on_book(bid, ask, a);
	movsd	(%rsi), %xmm0	# *prephitmp_99, *prephitmp_99
# week04_practice/dispatch_bench.cpp:78:         return four[pat[i & 4095]]->on_book(bid, ask, a);
	andl	$4095, %ecx	#, _370
# week04_practice/dispatch_bench.cpp:78:         return four[pat[i & 4095]]->on_book(bid, ask, a);
	movsd	(%rdx), %xmm1	# *prephitmp_108,
# week04_practice/dispatch_bench.cpp:78:         return four[pat[i & 4095]]->on_book(bid, ask, a);
	movzbl	(%rax,%rcx), %eax	# *_373, _375
	movq	(%rdi,%rax,8), %rdi	# (*prephitmp_119)[_375], _376
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	movq	%rbx, %rax	# i, _356
	andl	$7, %eax	#, _356
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	cvtsi2sdq	%rax, %xmm2	# _356, _357
# week04_practice/dispatch_bench.cpp:78:         return four[pat[i & 4095]]->on_book(bid, ask, a);
	movq	(%rdi), %rax	# _376->_vptr.Strategy, _376->_vptr.Strategy
	mulsd	.LC4(%rip), %xmm2	#,
.LEHB3:
	call	*16(%rax)	# MEM[(int (*) () *)_377 + 16B]
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	movq	%r13, %xmm6	# acc, acc
# week04_practice/dispatch_bench.cpp:64:             ++i;
	leaq	1(%rbx), %r15	#, _396
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	addsd	%xmm0, %xmm6	# _383, acc
	movq	%xmm6, %r13	# acc, acc
# week04_practice/../tests/bench.hpp:16:     asm volatile("" : : "g"(v) : "memory");
# week04_practice/dispatch_bench.cpp:66:             g_sink = acc;
	movsd	%xmm6, _ZL6g_sink(%rip)	# acc, g_sink
# week04_practice/../tests/bench.hpp:71:     for (long i = 0; i < iters / 10 + 1; ++i) f();          // warm up
	cmpq	%r15, %r14	# _396, _36
	jne	.L196	#,
# week04_practice/../tests/bench.hpp:72:     auto t0 = std::chrono::steady_clock::now();
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT	#
	addq	$20000001, %rbx	#, _39
	movq	%rax, %r14	#, t0
	.p2align 4
	.p2align 3
.L197:
# week04_practice/dispatch_bench.cpp:78:         return four[pat[i & 4095]]->on_book(bid, ask, a);
	movq	248(%rsp), %rdx	# MEM[(struct ._anon_180 *)_1063].__pat, MEM[(struct ._anon_180 *)_1063].__pat
# week04_practice/dispatch_bench.cpp:78:         return four[pat[i & 4095]]->on_book(bid, ask, a);
	movq	%r15, %rax	# _396, _401
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	pxor	%xmm2, %xmm2	# _388
# week04_practice/dispatch_bench.cpp:78:         return four[pat[i & 4095]]->on_book(bid, ask, a);
	andl	$4095, %eax	#, _401
# week04_practice/dispatch_bench.cpp:78:         return four[pat[i & 4095]]->on_book(bid, ask, a);
	movq	(%rdx), %rdx	# _400->D.174220._M_impl.D.173558._M_start, _400->D.174220._M_impl.D.173558._M_start
# week04_practice/dispatch_bench.cpp:78:         return four[pat[i & 4095]]->on_book(bid, ask, a);
	movzbl	(%rdx,%rax), %edx	# *_404, _406
	movq	240(%rsp), %rax	# MEM[(struct ._anon_180 *)_1063].__four, MEM[(struct ._anon_180 *)_1063].__four
	movq	(%rax,%rdx,8), %rdi	# (*_399)[_406], _407
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	movq	%r15, %rax	# _396, _387
# week04_practice/dispatch_bench.cpp:78:         return four[pat[i & 4095]]->on_book(bid, ask, a);
	movq	264(%rsp), %rdx	# MEM[(struct ._anon_180 *)_1063].__ask, MEM[(struct ._anon_180 *)_1063].__ask
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	andl	$7, %eax	#, _387
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	cvtsi2sdq	%rax, %xmm2	# _387, _388
# week04_practice/dispatch_bench.cpp:78:         return four[pat[i & 4095]]->on_book(bid, ask, a);
	movq	256(%rsp), %rax	# MEM[(struct ._anon_180 *)_1063].__bid, MEM[(struct ._anon_180 *)_1063].__bid
	movsd	(%rdx), %xmm1	# *_410,
	mulsd	.LC4(%rip), %xmm2	#,
	movsd	(%rax), %xmm0	# *_412, *_412
	movq	(%rdi), %rax	# _407->_vptr.Strategy, _407->_vptr.Strategy
	call	*16(%rax)	# MEM[(int (*) () *)_408 + 16B]
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	movq	%r13, %xmm7	# acc, acc
# week04_practice/dispatch_bench.cpp:64:             ++i;
	addq	$1, %r15	#, _396
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	addsd	%xmm0, %xmm7	# _414, acc
	movq	%xmm7, %r13	# acc, acc
# week04_practice/../tests/bench.hpp:16:     asm volatile("" : : "g"(v) : "memory");
# week04_practice/dispatch_bench.cpp:66:             g_sink = acc;
	movsd	%xmm7, _ZL6g_sink(%rip)	# acc, g_sink
# week04_practice/../tests/bench.hpp:73:     for (long i = 0; i < iters; ++i) f();
	cmpq	%r15, %rbx	# _396, _39
	jne	.L197	#,
# week04_practice/../tests/bench.hpp:74:     auto t1 = std::chrono::steady_clock::now();
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT	#
# /usr/include/c++/15/bits/chrono.h:205: 	    return _ToDur(static_cast<__to_rep>(__d.count()));
	pxor	%xmm0, %xmm0	# _350
# /usr/include/c++/15/bits/vector.tcc:114: 	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
	movq	224(%rsp), %rsi	# MEM[(struct vector *)_346].D.173016._M_impl.D.172354._M_end_of_storage, prephitmp_101
# /usr/include/c++/15/bits/chrono.h:720: 	return __cd(__cd(__lhs).count() - __cd(__rhs).count());
	subq	%r14, %rax	# t0, _349
# /usr/include/c++/15/bits/chrono.h:205: 	    return _ToDur(static_cast<__to_rep>(__d.count()));
	cvtsi2sdq	%rax, %xmm0	# _349, _350
# /usr/include/c++/15/bits/vector.tcc:114: 	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
	movq	216(%rsp), %rax	# MEM[(struct vector *)_346].D.173016._M_impl.D.172354._M_finish, _415
# week04_practice/../tests/bench.hpp:75:     return std::chrono::duration<double, std::nano>(t1 - t0).count() / iters;
	divsd	.LC5(%rip), %xmm0	#, _352
# /usr/include/c++/15/bits/vector.tcc:114: 	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
	cmpq	%rsi, %rax	# prephitmp_101, _415
	je	.L198	#,
# /usr/include/c++/15/bits/stl_construct.h:110: 	return ::new(__loc) _Tp(std::forward<_Args>(__args)...);
	movsd	%xmm0, (%rax)	# _352, *_415
# /usr/include/c++/15/bits/vector.tcc:119: 	    ++this->_M_impl._M_finish;
	addq	$8, %rax	#, tmp657
	movq	%rax, 216(%rsp)	# tmp657, MEM[(struct vector *)_346].D.173016._M_impl.D.172354._M_finish
# week04_practice/dispatch_bench.cpp:41:     for (int i = 0; i < reps; ++i) v.push_back(ns_per_op(f, N));
	subl	$1, %r12d	#, ivtmp_879
	je	.L204	#,
.L308:
# week04_practice/dispatch_bench.cpp:78:         return four[pat[i & 4095]]->on_book(bid, ask, a);
	movq	240(%rsp), %rdi	# MEM[(struct ._anon_180 *)_1063].__four, pretmp_118
# week04_practice/dispatch_bench.cpp:78:         return four[pat[i & 4095]]->on_book(bid, ask, a);
	movq	248(%rsp), %rax	# MEM[(struct ._anon_180 *)_1063].__pat, prephitmp_109
# week04_practice/dispatch_bench.cpp:64:             ++i;
	movq	%r15, %rbx	# _396, i
# week04_practice/dispatch_bench.cpp:78:         return four[pat[i & 4095]]->on_book(bid, ask, a);
	movq	264(%rsp), %rdx	# MEM[(struct ._anon_180 *)_1063].__ask, prephitmp_108
	movq	256(%rsp), %rsi	# MEM[(struct ._anon_180 *)_1063].__bid, pretmp_98
	jmp	.L194	#
	.p2align 4,,10
	.p2align 3
.L198:
	movq	208(%rsp), %r8	# MEM[(double * *)_346], _439
# /usr/include/c++/15/bits/stl_vector.h:2204: 	if (max_size() - size() < __n)
	movabsq	$1152921504606846975, %rcx	#, tmp913
# /usr/include/c++/15/bits/stl_vector.h:1119: 	ptrdiff_t __dif = this->_M_impl._M_finish - this->_M_impl._M_start;
	subq	%r8, %rax	# _439, _415
	movq	%rax, %r14	# _415, _443
# /usr/include/c++/15/bits/stl_vector.h:1119: 	ptrdiff_t __dif = this->_M_impl._M_finish - this->_M_impl._M_start;
	sarq	$3, %rax	#, __dif_444
# /usr/include/c++/15/bits/stl_vector.h:2204: 	if (max_size() - size() < __n)
	cmpq	%rcx, %rax	# tmp913, __dif_444
	je	.L298	#,
# /usr/include/c++/15/bits/stl_algobase.h:263:       if (__a < __b)
	testq	%rax, %rax	# __dif_444
	movl	$1, %ebx	#, tmp838
	movq	%r8, 88(%rsp)	# _439, %sfp
	cmovne	%rax, %rbx	# __dif_444,, _680
	movq	%rsi, 48(%rsp)	# prephitmp_101, %sfp
	movsd	%xmm0, 64(%rsp)	# _352, %sfp
# /usr/include/c++/15/bits/stl_vector.h:2207: 	const size_type __len = size() + (std::max)(size(), __n);
	addq	%rax, %rbx	# __dif_444, __len_681
# /usr/include/c++/15/bits/stl_vector.h:2208: 	return (__len < size() || __len > max_size()) ? max_size() : __len;
	movabsq	$1152921504606846975, %rax	#, tmp839
	cmpq	%rax, %rbx	# tmp839, __len_681
	cmova	%rax, %rbx	# __len_681,, tmp839, __len_681
# /usr/include/c++/15/bits/new_allocator.h:151: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	salq	$3, %rbx	#, _454
	movq	%rbx, %rdi	# _454,
	call	_Znwm@PLT	#
.LEHE3:
# /usr/include/c++/15/bits/stl_uninitialized.h:1331:       if (__count > 0)
	testq	%r14, %r14	# _443
	movq	48(%rsp), %rsi	# %sfp, prephitmp_101
	movq	88(%rsp), %r8	# %sfp, _439
# /usr/include/c++/15/bits/new_allocator.h:151: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	movq	%rax, %rbp	#, _455
# /usr/include/c++/15/bits/stl_construct.h:110: 	return ::new(__loc) _Tp(std::forward<_Args>(__args)...);
	movsd	64(%rsp), %xmm0	# %sfp, _352
	movsd	%xmm0, (%rax,%r14)	# _352, *_429
# /usr/include/c++/15/bits/stl_uninitialized.h:1331:       if (__count > 0)
	je	.L202	#,
# /usr/include/c++/15/bits/stl_uninitialized.h:1343: 	  __builtin_memcpy(__result, __first, __count * sizeof(_Tp));
	movq	%r8, %rsi	# _439,
	movq	%r14, %rdx	# _443,
	movq	%rax, %rdi	# _455,
	movq	%r8, 48(%rsp)	# _439, %sfp
	call	memcpy@PLT	#
# /usr/include/c++/15/bits/vector.tcc:639: 	__guard._M_len = this->_M_impl._M_end_of_storage - __old_start;
	movq	224(%rsp), %rsi	# MEM[(struct vector *)_346].D.173016._M_impl.D.172354._M_end_of_storage, prephitmp_101
	movq	48(%rsp), %r8	# %sfp, _439
.L202:
# /usr/include/c++/15/bits/vector.tcc:601: 	    ++__new_finish;
	leaq	8(%rbp,%r14), %r14	#, __new_finish
# /usr/include/c++/15/bits/stl_vector.h:1882: 	  if (_M_storage)
	testq	%r8, %r8	# _439
	je	.L203	#,
# /usr/include/c++/15/bits/vector.tcc:639: 	__guard._M_len = this->_M_impl._M_end_of_storage - __old_start;
	subq	%r8, %rsi	# _439, _434
# /usr/include/c++/15/bits/new_allocator.h:172: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	movq	%r8, %rdi	# _439,
	call	_ZdlPvm@PLT	#
.L203:
# /usr/include/c++/15/bits/vector.tcc:646:       this->_M_impl._M_end_of_storage = __new_start + __len;
	leaq	0(%rbp,%rbx), %r9	#, tmp672
# /usr/include/c++/15/bits/vector.tcc:644:       this->_M_impl._M_start = __new_start;
	movq	%rbp, 208(%rsp)	# _455, MEM[(struct vector *)_346].D.173016._M_impl.D.172354._M_start
# /usr/include/c++/15/bits/vector.tcc:645:       this->_M_impl._M_finish = __new_finish;
	movq	%r14, 216(%rsp)	# __new_finish, MEM[(struct vector *)_346].D.173016._M_impl.D.172354._M_finish
# /usr/include/c++/15/bits/vector.tcc:646:       this->_M_impl._M_end_of_storage = __new_start + __len;
	movq	%r9, 224(%rsp)	# tmp672, MEM[(struct vector *)_346].D.173016._M_impl.D.172354._M_end_of_storage
# week04_practice/dispatch_bench.cpp:41:     for (int i = 0; i < reps; ++i) v.push_back(ns_per_op(f, N));
	subl	$1, %r12d	#, ivtmp_879
	jne	.L308	#,
	.p2align 4
	.p2align 3
.L204:
# /usr/include/c++/15/bits/stl_algo.h:4841:       std::__sort(__first, __last, __gnu_cxx::__ops::__iter_less_iter());
	movq	216(%rsp), %rsi	# MEM[(double * const &)_346 + 8],
	movq	208(%rsp), %rdi	# MEM[(double * const &)_346],
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	movl	$7, %r12d	#, ivtmp_909
# week04_practice/dispatch_bench.cpp:61:         long i = 0;
	xorl	%ebx, %ebx	# i
	movq	(%rsp), %xmm0	# %sfp, tmp673
	movhps	24(%rsp), %xmm0	# %sfp, tmp673
	movaps	%xmm0, 48(%rsp)	# tmp673, %sfp
# week04_practice/dispatch_bench.cpp:60:         double acc = 0.0;
	xorl	%r14d, %r14d	# acc
# /usr/include/c++/15/bits/stl_algo.h:4841:       std::__sort(__first, __last, __gnu_cxx::__ops::__iter_less_iter());
	call	_ZSt6__sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEENS0_5__ops15_Iter_less_iterEEvT_S9_T0_.isra.0	#
# week04_practice/dispatch_bench.cpp:43:     return v[reps / 2];
	movq	208(%rsp), %rax	# MEM[(struct vector *)_346].D.173016._M_impl.D.172354._M_start, MEM[(struct vector *)_346].D.173016._M_impl.D.172354._M_start
# /usr/include/c++/15/bits/stl_vector.h:805:       }
	leaq	208(%rsp), %rdi	#, tmp675
# week04_practice/dispatch_bench.cpp:43:     return v[reps / 2];
	movsd	24(%rax), %xmm6	# MEM[(value_type &)_338 + 24], _341
	movsd	%xmm6, 64(%rsp)	# _341, %sfp
# /usr/include/c++/15/bits/stl_vector.h:805:       }
	call	_ZNSt12_Vector_baseIdSaIdEED2Ev	#
# week04_practice/dispatch_bench.cpp:80:     double t_virt4p = run([&](double a, long i) {
	movq	32(%rsp), %rdx	# %sfp, tmp796
	movdqa	48(%rsp), %xmm0	# %sfp, tmp673
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	movq	$0, 256(%rsp)	#, MEM[(struct vector *)_1063]
	movq	24(%rsp), %rsi	# %sfp, pretmp_19
	movq	(%rsp), %rbp	# %sfp, prephitmp_34
# week04_practice/dispatch_bench.cpp:80:     double t_virt4p = run([&](double a, long i) {
	movq	%rdx, 224(%rsp)	# tmp796, MEM[(struct ._anon_182 *)_346].__ask
	movaps	%xmm0, 208(%rsp)	# tmp673, MEM <vector(2) long unsigned int> [(void *)_346]
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	pxor	%xmm0, %xmm0	# tmp677
	movaps	%xmm0, 240(%rsp)	# tmp677, MEM[(struct vector *)_1063]
	.p2align 4
	.p2align 3
.L206:
	leaq	2000001(%rbx), %r15	#, _737
	jmp	.L217	#
	.p2align 4,,10
	.p2align 3
.L208:
# week04_practice/dispatch_bench.cpp:81:         return four[i & 3]->on_book(bid, ask, a);
	movq	208(%rsp), %rbp	# MEM[(struct ._anon_182 *)_346].__four, prephitmp_34
# week04_practice/dispatch_bench.cpp:81:         return four[i & 3]->on_book(bid, ask, a);
	movq	224(%rsp), %rdx	# MEM[(struct ._anon_182 *)_346].__ask, pretmp_27
# week04_practice/dispatch_bench.cpp:64:             ++i;
	movq	%r13, %rbx	# _519, i
# week04_practice/dispatch_bench.cpp:81:         return four[i & 3]->on_book(bid, ask, a);
	movq	216(%rsp), %rsi	# MEM[(struct ._anon_182 *)_346].__bid, pretmp_19
.L217:
# week04_practice/dispatch_bench.cpp:81:         return four[i & 3]->on_book(bid, ask, a);
	movq	%rbx, %rax	# i, _498
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	pxor	%xmm2, %xmm2	# _486
# week04_practice/dispatch_bench.cpp:81:         return four[i & 3]->on_book(bid, ask, a);
	movsd	(%rsi), %xmm0	# *prephitmp_1031, *prephitmp_1031
	movsd	(%rdx), %xmm1	# *prephitmp_66,
# week04_practice/dispatch_bench.cpp:81:         return four[i & 3]->on_book(bid, ask, a);
	andl	$3, %eax	#, _498
# week04_practice/dispatch_bench.cpp:81:         return four[i & 3]->on_book(bid, ask, a);
	movq	0(%rbp,%rax,8), %rdi	# (*prephitmp_34)[_498], _499
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	movq	%rbx, %rax	# i, _485
	andl	$7, %eax	#, _485
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	cvtsi2sdq	%rax, %xmm2	# _485, _486
# week04_practice/dispatch_bench.cpp:81:         return four[i & 3]->on_book(bid, ask, a);
	movq	(%rdi), %rax	# _499->_vptr.Strategy, _499->_vptr.Strategy
	mulsd	.LC4(%rip), %xmm2	#,
.LEHB4:
	call	*16(%rax)	# MEM[(int (*) () *)_500 + 16B]
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	movq	%r14, %xmm3	# acc, acc
# week04_practice/dispatch_bench.cpp:64:             ++i;
	leaq	1(%rbx), %r13	#, _519
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	addsd	%xmm0, %xmm3	# _506, acc
	movq	%xmm3, %r14	# acc, acc
# week04_practice/../tests/bench.hpp:16:     asm volatile("" : : "g"(v) : "memory");
# week04_practice/dispatch_bench.cpp:66:             g_sink = acc;
	movsd	%xmm3, _ZL6g_sink(%rip)	# acc, g_sink
# week04_practice/../tests/bench.hpp:71:     for (long i = 0; i < iters / 10 + 1; ++i) f();          // warm up
	cmpq	%r15, %r13	# _737, _519
	jne	.L208	#,
# week04_practice/../tests/bench.hpp:72:     auto t0 = std::chrono::steady_clock::now();
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT	#
	addq	$20000001, %rbx	#, _301
	movq	%rax, %rbp	#, t0
	.p2align 4
	.p2align 3
.L209:
# week04_practice/dispatch_bench.cpp:81:         return four[i & 3]->on_book(bid, ask, a);
	movq	208(%rsp), %rax	# MEM[(struct ._anon_182 *)_346].__four, MEM[(struct ._anon_182 *)_346].__four
# week04_practice/dispatch_bench.cpp:81:         return four[i & 3]->on_book(bid, ask, a);
	movq	%r13, %rdx	# _519, _523
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	pxor	%xmm2, %xmm2	# _511
# week04_practice/dispatch_bench.cpp:81:         return four[i & 3]->on_book(bid, ask, a);
	andl	$3, %edx	#, _523
# week04_practice/dispatch_bench.cpp:81:         return four[i & 3]->on_book(bid, ask, a);
	movq	(%rax,%rdx,8), %rdi	# (*_522)[_523], _524
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	movq	%r13, %rax	# _519, _510
# week04_practice/dispatch_bench.cpp:81:         return four[i & 3]->on_book(bid, ask, a);
	movq	224(%rsp), %rdx	# MEM[(struct ._anon_182 *)_346].__ask, MEM[(struct ._anon_182 *)_346].__ask
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	andl	$7, %eax	#, _510
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	cvtsi2sdq	%rax, %xmm2	# _510, _511
# week04_practice/dispatch_bench.cpp:81:         return four[i & 3]->on_book(bid, ask, a);
	movq	216(%rsp), %rax	# MEM[(struct ._anon_182 *)_346].__bid, MEM[(struct ._anon_182 *)_346].__bid
	movsd	(%rdx), %xmm1	# *_527,
	mulsd	.LC4(%rip), %xmm2	#,
	movsd	(%rax), %xmm0	# *_529, *_529
	movq	(%rdi), %rax	# _524->_vptr.Strategy, _524->_vptr.Strategy
	call	*16(%rax)	# MEM[(int (*) () *)_525 + 16B]
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	movq	%r14, %xmm4	# acc, acc
# week04_practice/dispatch_bench.cpp:64:             ++i;
	addq	$1, %r13	#, _519
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	addsd	%xmm0, %xmm4	# _531, acc
	movq	%xmm4, %r14	# acc, acc
# week04_practice/../tests/bench.hpp:16:     asm volatile("" : : "g"(v) : "memory");
# week04_practice/dispatch_bench.cpp:66:             g_sink = acc;
	movsd	%xmm4, _ZL6g_sink(%rip)	# acc, g_sink
# week04_practice/../tests/bench.hpp:73:     for (long i = 0; i < iters; ++i) f();
	cmpq	%r13, %rbx	# _519, _301
	jne	.L209	#,
# week04_practice/../tests/bench.hpp:74:     auto t1 = std::chrono::steady_clock::now();
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT	#
# /usr/include/c++/15/bits/chrono.h:205: 	    return _ToDur(static_cast<__to_rep>(__d.count()));
	pxor	%xmm0, %xmm0	# _479
# /usr/include/c++/15/bits/vector.tcc:114: 	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
	movq	256(%rsp), %rsi	# MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_end_of_storage, _533
# /usr/include/c++/15/bits/chrono.h:720: 	return __cd(__cd(__lhs).count() - __cd(__rhs).count());
	subq	%rbp, %rax	# t0, _478
# /usr/include/c++/15/bits/chrono.h:205: 	    return _ToDur(static_cast<__to_rep>(__d.count()));
	cvtsi2sdq	%rax, %xmm0	# _478, _479
# /usr/include/c++/15/bits/vector.tcc:114: 	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
	movq	248(%rsp), %rax	# MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_finish, _532
# week04_practice/../tests/bench.hpp:75:     return std::chrono::duration<double, std::nano>(t1 - t0).count() / iters;
	divsd	.LC5(%rip), %xmm0	#, _481
# /usr/include/c++/15/bits/vector.tcc:114: 	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
	cmpq	%rsi, %rax	# _533, _532
	je	.L210	#,
# /usr/include/c++/15/bits/stl_construct.h:110: 	return ::new(__loc) _Tp(std::forward<_Args>(__args)...);
	movsd	%xmm0, (%rax)	# _481, *_532
# /usr/include/c++/15/bits/vector.tcc:119: 	    ++this->_M_impl._M_finish;
	addq	$8, %rax	#, tmp705
	movq	%rax, 248(%rsp)	# tmp705, MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_finish
# week04_practice/dispatch_bench.cpp:41:     for (int i = 0; i < reps; ++i) v.push_back(ns_per_op(f, N));
	subl	$1, %r12d	#, ivtmp_909
	je	.L216	#,
.L309:
# week04_practice/dispatch_bench.cpp:81:         return four[i & 3]->on_book(bid, ask, a);
	movq	208(%rsp), %rbp	# MEM[(struct ._anon_182 *)_346].__four, prephitmp_34
# week04_practice/dispatch_bench.cpp:81:         return four[i & 3]->on_book(bid, ask, a);
	movq	224(%rsp), %rdx	# MEM[(struct ._anon_182 *)_346].__ask, pretmp_27
# week04_practice/dispatch_bench.cpp:64:             ++i;
	movq	%r13, %rbx	# _519, i
# week04_practice/dispatch_bench.cpp:81:         return four[i & 3]->on_book(bid, ask, a);
	movq	216(%rsp), %rsi	# MEM[(struct ._anon_182 *)_346].__bid, pretmp_19
	jmp	.L206	#
	.p2align 4,,10
	.p2align 3
.L210:
	movq	240(%rsp), %r15	# MEM[(double * *)_1063], _556
# /usr/include/c++/15/bits/stl_vector.h:2204: 	if (max_size() - size() < __n)
	movabsq	$1152921504606846975, %rcx	#, tmp925
# /usr/include/c++/15/bits/stl_vector.h:1119: 	ptrdiff_t __dif = this->_M_impl._M_finish - this->_M_impl._M_start;
	subq	%r15, %rax	# _556, _532
	movq	%rax, %rbp	# _532, _560
# /usr/include/c++/15/bits/stl_vector.h:1119: 	ptrdiff_t __dif = this->_M_impl._M_finish - this->_M_impl._M_start;
	sarq	$3, %rax	#, __dif_561
# /usr/include/c++/15/bits/stl_vector.h:2204: 	if (max_size() - size() < __n)
	cmpq	%rcx, %rax	# tmp925, __dif_561
	je	.L299	#,
# /usr/include/c++/15/bits/stl_algobase.h:263:       if (__a < __b)
	testq	%rax, %rax	# __dif_561
	movl	$1, %ebx	#, tmp836
	movq	%rsi, 48(%rsp)	# _533, %sfp
	cmovne	%rax, %rbx	# __dif_561,, _646
	movsd	%xmm0, (%rsp)	# _481, %sfp
# /usr/include/c++/15/bits/stl_vector.h:2207: 	const size_type __len = size() + (std::max)(size(), __n);
	addq	%rax, %rbx	# __dif_561, __len_647
# /usr/include/c++/15/bits/stl_vector.h:2208: 	return (__len < size() || __len > max_size()) ? max_size() : __len;
	movabsq	$1152921504606846975, %rax	#, tmp837
	cmpq	%rax, %rbx	# tmp837, __len_647
	cmova	%rax, %rbx	# __len_647,, tmp837, __len_647
# /usr/include/c++/15/bits/new_allocator.h:151: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	salq	$3, %rbx	#, _571
	movq	%rbx, %rdi	# _571,
	call	_Znwm@PLT	#
.LEHE4:
# /usr/include/c++/15/bits/stl_construct.h:110: 	return ::new(__loc) _Tp(std::forward<_Args>(__args)...);
	movsd	(%rsp), %xmm0	# %sfp, _481
# /usr/include/c++/15/bits/stl_uninitialized.h:1331:       if (__count > 0)
	testq	%rbp, %rbp	# _560
	movq	48(%rsp), %rsi	# %sfp, _533
# /usr/include/c++/15/bits/new_allocator.h:151: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	movq	%rax, %r8	#, _572
# /usr/include/c++/15/bits/stl_construct.h:110: 	return ::new(__loc) _Tp(std::forward<_Args>(__args)...);
	movsd	%xmm0, (%rax,%rbp)	# _481, *_546
# /usr/include/c++/15/bits/stl_uninitialized.h:1331:       if (__count > 0)
	je	.L214	#,
# /usr/include/c++/15/bits/stl_uninitialized.h:1343: 	  __builtin_memcpy(__result, __first, __count * sizeof(_Tp));
	movq	%r15, %rsi	# _556,
	movq	%rbp, %rdx	# _560,
	movq	%rax, %rdi	# _572,
	call	memcpy@PLT	#
# /usr/include/c++/15/bits/vector.tcc:639: 	__guard._M_len = this->_M_impl._M_end_of_storage - __old_start;
	movq	256(%rsp), %rsi	# MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_end_of_storage, _533
# /usr/include/c++/15/bits/stl_uninitialized.h:1343: 	  __builtin_memcpy(__result, __first, __count * sizeof(_Tp));
	movq	%rax, %r8	#, _572
.L214:
# /usr/include/c++/15/bits/vector.tcc:601: 	    ++__new_finish;
	leaq	8(%r8,%rbp), %rbp	#, __new_finish
# /usr/include/c++/15/bits/stl_vector.h:1882: 	  if (_M_storage)
	testq	%r15, %r15	# _556
	je	.L215	#,
# /usr/include/c++/15/bits/vector.tcc:639: 	__guard._M_len = this->_M_impl._M_end_of_storage - __old_start;
	subq	%r15, %rsi	# _556, _551
# /usr/include/c++/15/bits/new_allocator.h:172: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	movq	%r15, %rdi	# _556,
	movq	%r8, (%rsp)	# _572, %sfp
	call	_ZdlPvm@PLT	#
	movq	(%rsp), %r8	# %sfp, _572
.L215:
# /usr/include/c++/15/bits/vector.tcc:644:       this->_M_impl._M_start = __new_start;
	movq	%r8, 240(%rsp)	# _572, MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_start
# /usr/include/c++/15/bits/vector.tcc:646:       this->_M_impl._M_end_of_storage = __new_start + __len;
	addq	%rbx, %r8	# _571, tmp720
# /usr/include/c++/15/bits/vector.tcc:645:       this->_M_impl._M_finish = __new_finish;
	movq	%rbp, 248(%rsp)	# __new_finish, MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_finish
# /usr/include/c++/15/bits/vector.tcc:646:       this->_M_impl._M_end_of_storage = __new_start + __len;
	movq	%r8, 256(%rsp)	# tmp720, MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_end_of_storage
# week04_practice/dispatch_bench.cpp:41:     for (int i = 0; i < reps; ++i) v.push_back(ns_per_op(f, N));
	subl	$1, %r12d	#, ivtmp_909
	jne	.L309	#,
	.p2align 4
	.p2align 3
.L216:
# /usr/include/c++/15/bits/stl_algo.h:4841:       std::__sort(__first, __last, __gnu_cxx::__ops::__iter_less_iter());
	movq	248(%rsp), %rsi	# MEM[(double * const &)_1063 + 8],
	movq	240(%rsp), %rdi	# MEM[(double * const &)_1063],
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	xorl	%ebp, %ebp	# ivtmp.667
	leaq	168(%rsp), %rbx	#, _829
	movq	%rbx, %xmm0	# _829, tmp721
	movhps	24(%rsp), %xmm0	# %sfp, tmp721
	movaps	%xmm0, (%rsp)	# tmp721, %sfp
	movl	$2000001, %r14d	#, ivtmp.679
# /usr/include/c++/15/bits/stl_algo.h:4841:       std::__sort(__first, __last, __gnu_cxx::__ops::__iter_less_iter());
	call	_ZSt6__sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEENS0_5__ops15_Iter_less_iterEEvT_S9_T0_.isra.0	#
# /usr/include/c++/15/bits/stl_vector.h:805:       }
	movq	40(%rsp), %rdi	# %sfp,
# week04_practice/dispatch_bench.cpp:43:     return v[reps / 2];
	movq	240(%rsp), %rax	# MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_start, MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_start
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	movl	$22000001, %r15d	#, ivtmp.677
# week04_practice/dispatch_bench.cpp:43:     return v[reps / 2];
	movsd	24(%rax), %xmm7	# MEM[(value_type &)_467 + 24], _470
	movsd	%xmm7, 88(%rsp)	# _470, %sfp
# /usr/include/c++/15/bits/stl_vector.h:805:       }
	call	_ZNSt12_Vector_baseIdSaIdEED2Ev	#
# week04_practice/dispatch_bench.cpp:84:     double t_final = run([&](double a, long) {
	movq	32(%rsp), %r13	# %sfp, tmp796
# week04_practice/dispatch_bench.cpp:83:     S0* volatile hide0 = &s0;
	movq	80(%rsp), %rax	# %sfp, tmp794
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	movq	$0, 256(%rsp)	#, MEM[(struct vector *)_1063]
# week04_practice/dispatch_bench.cpp:84:     double t_final = run([&](double a, long) {
	movdqa	(%rsp), %xmm0	# %sfp, tmp721
	movq	%r13, 224(%rsp)	# tmp796, MEM[(struct ._anon_184 *)_346].__ask
# week04_practice/dispatch_bench.cpp:83:     S0* volatile hide0 = &s0;
	movq	%rax, 168(%rsp)	# tmp794, hide0
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	movq	24(%rsp), %rax	# %sfp, prephitmp_953
# week04_practice/dispatch_bench.cpp:84:     double t_final = run([&](double a, long) {
	movaps	%xmm0, 208(%rsp)	# tmp721, MEM <vector(2) long unsigned int> [(void *)_346]
# week04_practice/dispatch_bench.cpp:40:     std::vector<double> v;
	pxor	%xmm0, %xmm0	# tmp728
	movaps	%xmm0, 240(%rsp)	# tmp728, MEM[(struct vector *)_1063]
# week04_practice/dispatch_bench.cpp:60:         double acc = 0.0;
	pxor	%xmm0, %xmm0	# acc
	.p2align 4
	.p2align 3
.L218:
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	pxor	%xmm2, %xmm2	# _817
# week04_practice/dispatch_bench.cpp:12:         return o*(a - b);
	movsd	0(%r13), %xmm1	# *prephitmp_971, *prephitmp_971
	subsd	(%rax), %xmm1	# *prephitmp_953, _808
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	cvtsi2sdq	%rbp, %xmm2	# ivtmp.667, _817
	mulsd	.LC4(%rip), %xmm2	#, _816
# week04_practice/dispatch_bench.cpp:85:         return hide0->on_book(bid, ask, a);
	movq	(%rbx), %rdx	# *prephitmp_1009, _815
# week04_practice/dispatch_bench.cpp:12:         return o*(a - b);
	mulsd	%xmm2, %xmm1	# _816, _805
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	addsd	%xmm1, %xmm0	# _805, acc
# week04_practice/../tests/bench.hpp:16:     asm volatile("" : : "g"(v) : "memory");
	movq	%xmm0, %rax	# acc, acc
# week04_practice/dispatch_bench.cpp:66:             g_sink = acc;
	movsd	%xmm0, _ZL6g_sink(%rip)	# acc, g_sink
	leaq	-22000000(%r15), %rax	#, ivtmp.662
	.p2align 4
	.p2align 3
.L220:
# week04_practice/dispatch_bench.cpp:85:         return hide0->on_book(bid, ask, a);
	movq	208(%rsp), %rdx	# MEM[(struct ._anon_184 *)_346].__hide0, pretmp_950
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	pxor	%xmm2, %xmm2	# _609
# week04_practice/dispatch_bench.cpp:85:         return hide0->on_book(bid, ask, a);
	movq	(%rdx), %rdx	# *pretmp_950, _612
# week04_practice/dispatch_bench.cpp:12:         return o*(a - b);
	movq	224(%rsp), %rdx	# MEM[(struct ._anon_184 *)_346].__ask, MEM[(struct ._anon_184 *)_346].__ask
	movsd	(%rdx), %xmm1	# *pretmp_908, *pretmp_908
	movq	216(%rsp), %rdx	# MEM[(struct ._anon_184 *)_346].__bid, MEM[(struct ._anon_184 *)_346].__bid
	subsd	(%rdx), %xmm1	# *pretmp_890, _617
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	movq	%rax, %rdx	# ivtmp.662, _941
	andl	$7, %edx	#, _941
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	cvtsi2sdq	%rdx, %xmm2	# _941, _609
	mulsd	.LC4(%rip), %xmm2	#, _610
# week04_practice/dispatch_bench.cpp:12:         return o*(a - b);
	mulsd	%xmm2, %xmm1	# _610, _618
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	addsd	%xmm1, %xmm0	# _618, acc
# week04_practice/../tests/bench.hpp:16:     asm volatile("" : : "g"(v) : "memory");
	movq	%xmm0, %rcx	# acc, acc
# week04_practice/../tests/bench.hpp:71:     for (long i = 0; i < iters / 10 + 1; ++i) f();          // warm up
	addq	$1, %rax	#, ivtmp.662
# week04_practice/dispatch_bench.cpp:66:             g_sink = acc;
	movsd	%xmm0, _ZL6g_sink(%rip)	# acc, g_sink
# week04_practice/../tests/bench.hpp:71:     for (long i = 0; i < iters / 10 + 1; ++i) f();          // warm up
	cmpq	%r14, %rax	# ivtmp.679, ivtmp.662
	jne	.L220	#,
	movsd	%xmm0, (%rsp)	# acc, %sfp
	movq	%r14, %r13	# ivtmp.679, i
# week04_practice/../tests/bench.hpp:72:     auto t0 = std::chrono::steady_clock::now();
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT	#
	movsd	(%rsp), %xmm0	# %sfp, acc
	movq	%rax, %rbx	#, t0
	.p2align 4
	.p2align 3
.L221:
# week04_practice/dispatch_bench.cpp:85:         return hide0->on_book(bid, ask, a);
	movq	208(%rsp), %rax	# MEM[(struct ._anon_184 *)_346].__hide0, _631
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	pxor	%xmm2, %xmm2	# _629
# week04_practice/dispatch_bench.cpp:85:         return hide0->on_book(bid, ask, a);
	movq	(%rax), %rax	# *_631, _632
# week04_practice/dispatch_bench.cpp:12:         return o*(a - b);
	movq	224(%rsp), %rax	# MEM[(struct ._anon_184 *)_346].__ask, MEM[(struct ._anon_184 *)_346].__ask
	movsd	(%rax), %xmm1	# *_633, *_633
	movq	216(%rsp), %rax	# MEM[(struct ._anon_184 *)_346].__bid, MEM[(struct ._anon_184 *)_346].__bid
	subsd	(%rax), %xmm1	# *_635, _637
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	movq	%r13, %rax	# i, _628
# week04_practice/dispatch_bench.cpp:64:             ++i;
	addq	$1, %r13	#, i
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	andl	$7, %eax	#, _628
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	cvtsi2sdq	%rax, %xmm2	# _628, _629
	mulsd	.LC4(%rip), %xmm2	#, _630
# week04_practice/dispatch_bench.cpp:12:         return o*(a - b);
	mulsd	%xmm2, %xmm1	# _630, _638
# week04_practice/dispatch_bench.cpp:63:             acc += body((i & 7) * 0.1, i);
	addsd	%xmm1, %xmm0	# _638, acc
# week04_practice/../tests/bench.hpp:16:     asm volatile("" : : "g"(v) : "memory");
	movq	%xmm0, %rax	# acc, acc
# week04_practice/dispatch_bench.cpp:66:             g_sink = acc;
	movsd	%xmm0, _ZL6g_sink(%rip)	# acc, g_sink
# week04_practice/../tests/bench.hpp:73:     for (long i = 0; i < iters; ++i) f();
	cmpq	%r13, %r15	# i, ivtmp.677
	jne	.L221	#,
# week04_practice/../tests/bench.hpp:74:     auto t1 = std::chrono::steady_clock::now();
	movsd	%xmm0, (%rsp)	# acc, %sfp
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT	#
# /usr/include/c++/15/bits/chrono.h:205: 	    return _ToDur(static_cast<__to_rep>(__d.count()));
	pxor	%xmm1, %xmm1	# _602
# /usr/include/c++/15/bits/vector.tcc:114: 	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
	movsd	(%rsp), %xmm0	# %sfp, acc
# /usr/include/c++/15/bits/vector.tcc:114: 	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
	movq	248(%rsp), %r13	# MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_finish, _588
# /usr/include/c++/15/bits/vector.tcc:114: 	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
	movq	256(%rsp), %rsi	# MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_end_of_storage, _589
# /usr/include/c++/15/bits/chrono.h:720: 	return __cd(__cd(__lhs).count() - __cd(__rhs).count());
	subq	%rbx, %rax	# t0, _601
# /usr/include/c++/15/bits/chrono.h:205: 	    return _ToDur(static_cast<__to_rep>(__d.count()));
	cvtsi2sdq	%rax, %xmm1	# _601, _602
# week04_practice/../tests/bench.hpp:75:     return std::chrono::duration<double, std::nano>(t1 - t0).count() / iters;
	divsd	.LC5(%rip), %xmm1	#, _604
# /usr/include/c++/15/bits/vector.tcc:114: 	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
	cmpq	%rsi, %r13	# _589, _588
	je	.L222	#,
# /usr/include/c++/15/bits/stl_construct.h:110: 	return ::new(__loc) _Tp(std::forward<_Args>(__args)...);
	movsd	%xmm1, 0(%r13)	# _604, *_588
# week04_practice/dispatch_bench.cpp:41:     for (int i = 0; i < reps; ++i) v.push_back(ns_per_op(f, N));
	addq	$22000001, %r15	#, ivtmp.677
# /usr/include/c++/15/bits/vector.tcc:119: 	    ++this->_M_impl._M_finish;
	addq	$8, %r13	#, tmp753
	movq	%r13, 248(%rsp)	# tmp753, MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_finish
# week04_practice/dispatch_bench.cpp:41:     for (int i = 0; i < reps; ++i) v.push_back(ns_per_op(f, N));
	cmpq	$176000008, %r15	#, ivtmp.677
	je	.L228	#,
.L310:
# week04_practice/dispatch_bench.cpp:85:         return hide0->on_book(bid, ask, a);
	movq	208(%rsp), %rbx	# MEM[(struct ._anon_184 *)_346].__hide0, prephitmp_1009
	movq	224(%rsp), %r13	# MEM[(struct ._anon_184 *)_346].__ask, prephitmp_971
# week04_practice/dispatch_bench.cpp:41:     for (int i = 0; i < reps; ++i) v.push_back(ns_per_op(f, N));
	addq	$1, %rbp	#, ivtmp.667
	addq	$22000001, %r14	#, ivtmp.679
# week04_practice/dispatch_bench.cpp:85:         return hide0->on_book(bid, ask, a);
	movq	216(%rsp), %rax	# MEM[(struct ._anon_184 *)_346].__bid, prephitmp_953
	jmp	.L218	#
	.p2align 4,,10
	.p2align 3
.L222:
	movq	240(%rsp), %r9	# MEM[(double * *)_1063], _663
# /usr/include/c++/15/bits/stl_vector.h:2204: 	if (max_size() - size() < __n)
	movabsq	$1152921504606846975, %rcx	#, tmp935
# /usr/include/c++/15/bits/stl_vector.h:1119: 	ptrdiff_t __dif = this->_M_impl._M_finish - this->_M_impl._M_start;
	subq	%r9, %r13	# _663, _667
# /usr/include/c++/15/bits/stl_vector.h:1119: 	ptrdiff_t __dif = this->_M_impl._M_finish - this->_M_impl._M_start;
	movq	%r13, %rax	# _667, __dif_668
	sarq	$3, %rax	#, __dif_668
# /usr/include/c++/15/bits/stl_vector.h:2204: 	if (max_size() - size() < __n)
	cmpq	%rcx, %rax	# tmp935, __dif_668
	je	.L300	#,
# /usr/include/c++/15/bits/stl_algobase.h:263:       if (__a < __b)
	testq	%rax, %rax	# __dif_668
	movl	$1, %ebx	#, tmp834
	movq	%r9, 48(%rsp)	# _663, %sfp
	cmovne	%rax, %rbx	# __dif_668,, _111
	movq	%rsi, (%rsp)	# _589, %sfp
	movsd	%xmm0, 32(%rsp)	# acc, %sfp
# /usr/include/c++/15/bits/stl_vector.h:2207: 	const size_type __len = size() + (std::max)(size(), __n);
	addq	%rax, %rbx	# __dif_668, __len_75
	movsd	%xmm1, 24(%rsp)	# _604, %sfp
# /usr/include/c++/15/bits/stl_vector.h:2208: 	return (__len < size() || __len > max_size()) ? max_size() : __len;
	movabsq	$1152921504606846975, %rax	#, tmp835
	cmpq	%rax, %rbx	# tmp835, __len_75
	cmova	%rax, %rbx	# __len_75,, tmp835, __len_75
# /usr/include/c++/15/bits/new_allocator.h:151: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	salq	$3, %rbx	#, _678
	movq	%rbx, %rdi	# _678,
.LEHB5:
	call	_Znwm@PLT	#
.LEHE5:
# /usr/include/c++/15/bits/stl_construct.h:110: 	return ::new(__loc) _Tp(std::forward<_Args>(__args)...);
	movsd	24(%rsp), %xmm1	# %sfp, _604
# /usr/include/c++/15/bits/stl_uninitialized.h:1331:       if (__count > 0)
	testq	%r13, %r13	# _667
	movq	(%rsp), %rsi	# %sfp, _589
# /usr/include/c++/15/bits/new_allocator.h:151: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	movq	%rax, %r12	#, _679
# /usr/include/c++/15/bits/stl_uninitialized.h:1331:       if (__count > 0)
	movsd	32(%rsp), %xmm0	# %sfp, acc
	movq	48(%rsp), %r9	# %sfp, _663
# /usr/include/c++/15/bits/stl_construct.h:110: 	return ::new(__loc) _Tp(std::forward<_Args>(__args)...);
	movsd	%xmm1, (%rax,%r13)	# _604, *_653
# /usr/include/c++/15/bits/stl_uninitialized.h:1331:       if (__count > 0)
	je	.L226	#,
# /usr/include/c++/15/bits/stl_uninitialized.h:1343: 	  __builtin_memcpy(__result, __first, __count * sizeof(_Tp));
	movq	%r9, %rsi	# _663,
	movq	%r13, %rdx	# _667,
	movq	%rax, %rdi	# _679,
	movq	%r9, (%rsp)	# _663, %sfp
	movsd	%xmm0, 24(%rsp)	# acc, %sfp
	call	memcpy@PLT	#
# /usr/include/c++/15/bits/vector.tcc:639: 	__guard._M_len = this->_M_impl._M_end_of_storage - __old_start;
	movsd	24(%rsp), %xmm0	# %sfp, acc
	movq	(%rsp), %r9	# %sfp, _663
	movq	256(%rsp), %rsi	# MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_end_of_storage, _589
.L226:
# /usr/include/c++/15/bits/vector.tcc:601: 	    ++__new_finish;
	leaq	8(%r12,%r13), %r13	#, __new_finish
# /usr/include/c++/15/bits/stl_vector.h:1882: 	  if (_M_storage)
	testq	%r9, %r9	# _663
	je	.L227	#,
# /usr/include/c++/15/bits/vector.tcc:639: 	__guard._M_len = this->_M_impl._M_end_of_storage - __old_start;
	subq	%r9, %rsi	# _663, _658
# /usr/include/c++/15/bits/new_allocator.h:172: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	movq	%r9, %rdi	# _663,
	movsd	%xmm0, (%rsp)	# acc, %sfp
	call	_ZdlPvm@PLT	#
	movsd	(%rsp), %xmm0	# %sfp, acc
.L227:
# /usr/include/c++/15/bits/vector.tcc:646:       this->_M_impl._M_end_of_storage = __new_start + __len;
	leaq	(%r12,%rbx), %r8	#, tmp768
# week04_practice/dispatch_bench.cpp:41:     for (int i = 0; i < reps; ++i) v.push_back(ns_per_op(f, N));
	addq	$22000001, %r15	#, ivtmp.677
# /usr/include/c++/15/bits/vector.tcc:644:       this->_M_impl._M_start = __new_start;
	movq	%r12, 240(%rsp)	# _679, MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_start
# /usr/include/c++/15/bits/vector.tcc:645:       this->_M_impl._M_finish = __new_finish;
	movq	%r13, 248(%rsp)	# __new_finish, MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_finish
# /usr/include/c++/15/bits/vector.tcc:646:       this->_M_impl._M_end_of_storage = __new_start + __len;
	movq	%r8, 256(%rsp)	# tmp768, MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_end_of_storage
# week04_practice/dispatch_bench.cpp:41:     for (int i = 0; i < reps; ++i) v.push_back(ns_per_op(f, N));
	cmpq	$176000008, %r15	#, ivtmp.677
	jne	.L310	#,
	.p2align 4
	.p2align 3
.L228:
# /usr/include/c++/15/bits/stl_algo.h:4841:       std::__sort(__first, __last, __gnu_cxx::__ops::__iter_less_iter());
	movq	248(%rsp), %rsi	# MEM[(double * const &)_1063 + 8],
	movq	240(%rsp), %rdi	# MEM[(double * const &)_1063],
	call	_ZSt6__sortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEENS0_5__ops15_Iter_less_iterEEvT_S9_T0_.isra.0	#
# week04_practice/dispatch_bench.cpp:43:     return v[reps / 2];
	movq	240(%rsp), %rax	# MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_start, MEM[(struct vector *)_1063].D.173016._M_impl.D.172354._M_start
# /usr/include/c++/15/bits/stl_vector.h:805:       }
	movq	40(%rsp), %rdi	# %sfp,
# week04_practice/dispatch_bench.cpp:43:     return v[reps / 2];
	movq	24(%rax), %rbx	# MEM[(value_type &)_584 + 24], _587
# /usr/include/c++/15/bits/stl_vector.h:805:       }
	call	_ZNSt12_Vector_baseIdSaIdEED2Ev	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:118:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movsd	96(%rsp), %xmm0	# %sfp,
	movl	$2, %edi	#,
	leaq	.LC7(%rip), %rsi	#,
	movl	$1, %eax	#,
.LEHB6:
	call	__printf_chk@PLT	#
	movsd	104(%rsp), %xmm0	# %sfp,
	movl	$2, %edi	#,
	movl	$1, %eax	#,
	leaq	.LC8(%rip), %rsi	#,
	call	__printf_chk@PLT	#
	movsd	88(%rsp), %xmm0	# %sfp,
	movl	$2, %edi	#,
	movl	$1, %eax	#,
	leaq	.LC9(%rip), %rsi	#,
	call	__printf_chk@PLT	#
	movsd	64(%rsp), %xmm0	# %sfp,
	movl	$2, %edi	#,
	movl	$1, %eax	#,
	leaq	.LC10(%rip), %rsi	#,
	call	__printf_chk@PLT	#
	movq	%rbx, %xmm0	# _587,
	movl	$2, %edi	#,
	movl	$1, %eax	#,
	leaq	.LC11(%rip), %rsi	#,
	call	__printf_chk@PLT	#
	movsd	_ZL6g_sink(%rip), %xmm0	# g_sink,
	movl	$2, %edi	#,
	movl	$1, %eax	#,
	leaq	.LC12(%rip), %rsi	#,
	call	__printf_chk@PLT	#
.LEHE6:
# /usr/include/c++/15/bits/stl_vector.h:376: 		      _M_impl._M_end_of_storage - _M_impl._M_start);
	movq	176(%rsp), %rdi	# pat._M_impl.D.173558._M_start, _684
# /usr/include/c++/15/bits/stl_vector.h:395: 	if (__p)
	testq	%rdi, %rdi	# _684
	je	.L231	#,
# /usr/include/c++/15/bits/stl_vector.h:376: 		      _M_impl._M_end_of_storage - _M_impl._M_start);
	movq	192(%rsp), %rsi	# pat._M_impl.D.173558._M_end_of_storage, _685
	subq	%rdi, %rsi	# _684, _685
# /usr/include/c++/15/bits/new_allocator.h:172: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	call	_ZdlPvm@PLT	#
.L231:
# week04_practice/dispatch_bench.cpp:94: }
	movq	312(%rsp), %rax	# D.219688, tmp849
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp849
	jne	.L311	#,
	addq	$328, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax	#
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
	ret
.L311:
	.cfi_restore_state
	call	__stack_chk_fail@PLT	#
.L235:
	endbr64
# /usr/include/c++/15/bits/stl_vector.h:376: 		      _M_impl._M_end_of_storage - _M_impl._M_start);
	movq	%rax, %rbx	# tmp833, tmp577
	jmp	.L183	#
.L294:
	endbr64
	jmp	.L295	#
.L288:
	endbr64
	jmp	.L295	#
.L286:
	endbr64
	jmp	.L287	#
.L292:
	endbr64
	jmp	.L295	#
.L290:
	endbr64
	jmp	.L291	#
	.section	.gcc_except_table,"a",@progbits
.LLSDA13162:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE13162-.LLSDACSB13162
.LLSDACSB13162:
	.uleb128 .LEHB0-.LFB13162
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB13162
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L286-.LFB13162
	.uleb128 0
	.uleb128 .LEHB2-.LFB13162
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L288-.LFB13162
	.uleb128 0
	.uleb128 .LEHB3-.LFB13162
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L290-.LFB13162
	.uleb128 0
	.uleb128 .LEHB4-.LFB13162
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L292-.LFB13162
	.uleb128 0
	.uleb128 .LEHB5-.LFB13162
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L294-.LFB13162
	.uleb128 0
	.uleb128 .LEHB6-.LFB13162
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L235-.LFB13162
	.uleb128 0
.LLSDACSE13162:
	.section	.text.startup
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC13162
	.type	main.cold, @function
main.cold:
.LFSB13162:
.L300:
	.cfi_def_cfa_offset 384
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
# /usr/include/c++/15/bits/stl_vector.h:2205: 	  __throw_length_error(__N(__s));
	movq	312(%rsp), %rax	# D.219688, tmp848
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp848
	jne	.L312	#,
	leaq	.LC6(%rip), %rdi	#,
.LEHB7:
	call	_ZSt20__throw_length_errorPKc@PLT	#
.LEHE7:
.L240:
	endbr64
.L295:
# /usr/include/c++/15/bits/stl_vector.h:805:       }
	movq	40(%rsp), %rdi	# %sfp,
	movq	%rax, %rbx	#, tmp832
	call	_ZNSt12_Vector_baseIdSaIdEED2Ev	#
.L183:
# /usr/include/c++/15/bits/stl_vector.h:376: 		      _M_impl._M_end_of_storage - _M_impl._M_start);
	movq	176(%rsp), %rdi	# pat._M_impl.D.173558._M_start, _688
# /usr/include/c++/15/bits/stl_vector.h:395: 	if (__p)
	testq	%rdi, %rdi	# _688
	je	.L232	#,
# /usr/include/c++/15/bits/stl_vector.h:376: 		      _M_impl._M_end_of_storage - _M_impl._M_start);
	movq	192(%rsp), %rsi	# pat._M_impl.D.173558._M_end_of_storage, _689
	subq	%rdi, %rsi	# _688, _689
# /usr/include/c++/15/bits/new_allocator.h:172: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	call	_ZdlPvm@PLT	#
.L232:
	movq	312(%rsp), %rax	# D.219688, tmp850
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp850
	jne	.L313	#,
	movq	%rbx, %rdi	# tmp577,
.LEHB8:
	call	_Unwind_Resume@PLT	#
.LEHE8:
.L313:
	call	__stack_chk_fail@PLT	#
.L312:
# /usr/include/c++/15/bits/stl_vector.h:2205: 	  __throw_length_error(__N(__s));
	call	__stack_chk_fail@PLT	#
.L299:
	movq	312(%rsp), %rax	# D.219688, tmp847
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp847
	jne	.L314	#,
	leaq	.LC6(%rip), %rdi	#,
.LEHB9:
	call	_ZSt20__throw_length_errorPKc@PLT	#
.LEHE9:
.L297:
	movq	312(%rsp), %rax	# D.219688, tmp845
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp845
	jne	.L315	#,
	leaq	.LC6(%rip), %rdi	#,
.LEHB10:
	call	_ZSt20__throw_length_errorPKc@PLT	#
.LEHE10:
.L315:
	call	__stack_chk_fail@PLT	#
.L298:
	movq	312(%rsp), %rax	# D.219688, tmp846
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp846
	jne	.L316	#,
	leaq	.LC6(%rip), %rdi	#,
.LEHB11:
	call	_ZSt20__throw_length_errorPKc@PLT	#
.LEHE11:
.L296:
	movq	312(%rsp), %rax	# D.219688, tmp844
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp844
	jne	.L317	#,
	leaq	.LC6(%rip), %rdi	#,
.LEHB12:
	call	_ZSt20__throw_length_errorPKc@PLT	#
.LEHE12:
.L236:
	endbr64
.L287:
# /usr/include/c++/15/bits/stl_vector.h:805:       }
	leaq	240(%rsp), %rdi	#, tmp576
	movq	%rax, %rbx	#, tmp810
	call	_ZNSt12_Vector_baseIdSaIdEED2Ev	#
	jmp	.L183	#
.L317:
# /usr/include/c++/15/bits/stl_vector.h:2205: 	  __throw_length_error(__N(__s));
	call	__stack_chk_fail@PLT	#
.L314:
	call	__stack_chk_fail@PLT	#
.L316:
	call	__stack_chk_fail@PLT	#
.L239:
	endbr64
	jmp	.L295	#
.L238:
	endbr64
.L291:
# /usr/include/c++/15/bits/stl_vector.h:805:       }
	leaq	208(%rsp), %rdi	#, tmp678
	movq	%rax, %rbx	#, tmp822
	call	_ZNSt12_Vector_baseIdSaIdEED2Ev	#
	jmp	.L183	#
.L237:
	endbr64
	jmp	.L295	#
	.cfi_endproc
.LFE13162:
	.section	.gcc_except_table
.LLSDAC13162:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC13162-.LLSDACSBC13162
.LLSDACSBC13162:
	.uleb128 .LEHB7-.LCOLDB14
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L240-.LCOLDB14
	.uleb128 0
	.uleb128 .LEHB8-.LCOLDB14
	.uleb128 .LEHE8-.LEHB8
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB9-.LCOLDB14
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L239-.LCOLDB14
	.uleb128 0
	.uleb128 .LEHB10-.LCOLDB14
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L237-.LCOLDB14
	.uleb128 0
	.uleb128 .LEHB11-.LCOLDB14
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L238-.LCOLDB14
	.uleb128 0
	.uleb128 .LEHB12-.LCOLDB14
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L236-.LCOLDB14
	.uleb128 0
.LLSDACSEC13162:
	.section	.text.unlikely
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE14:
	.section	.text.startup
.LHOTE14:
	.weak	_ZTS8Strategy
	.section	.rodata._ZTS8Strategy,"aG",@progbits,_ZTS8Strategy,comdat
	.align 8
	.type	_ZTS8Strategy, @object
	.size	_ZTS8Strategy, 10
_ZTS8Strategy:
	.string	"8Strategy"
	.weak	_ZTI8Strategy
	.section	.data.rel.ro._ZTI8Strategy,"awG",@progbits,_ZTI8Strategy,comdat
	.align 8
	.type	_ZTI8Strategy, @object
	.size	_ZTI8Strategy, 16
_ZTI8Strategy:
# <anonymous>:
# <anonymous>:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
# <anonymous>:
	.quad	_ZTS8Strategy
	.weak	_ZTS2S0
	.section	.rodata._ZTS2S0,"aG",@progbits,_ZTS2S0,comdat
	.type	_ZTS2S0, @object
	.size	_ZTS2S0, 4
_ZTS2S0:
	.string	"2S0"
	.weak	_ZTI2S0
	.section	.data.rel.ro._ZTI2S0,"awG",@progbits,_ZTI2S0,comdat
	.align 8
	.type	_ZTI2S0, @object
	.size	_ZTI2S0, 24
_ZTI2S0:
# <anonymous>:
# <anonymous>:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
# <anonymous>:
	.quad	_ZTS2S0
# <anonymous>:
	.quad	_ZTI8Strategy
	.weak	_ZTS2S1
	.section	.rodata._ZTS2S1,"aG",@progbits,_ZTS2S1,comdat
	.type	_ZTS2S1, @object
	.size	_ZTS2S1, 4
_ZTS2S1:
	.string	"2S1"
	.weak	_ZTI2S1
	.section	.data.rel.ro._ZTI2S1,"awG",@progbits,_ZTI2S1,comdat
	.align 8
	.type	_ZTI2S1, @object
	.size	_ZTI2S1, 24
_ZTI2S1:
# <anonymous>:
# <anonymous>:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
# <anonymous>:
	.quad	_ZTS2S1
# <anonymous>:
	.quad	_ZTI8Strategy
	.weak	_ZTS2S2
	.section	.rodata._ZTS2S2,"aG",@progbits,_ZTS2S2,comdat
	.type	_ZTS2S2, @object
	.size	_ZTS2S2, 4
_ZTS2S2:
	.string	"2S2"
	.weak	_ZTI2S2
	.section	.data.rel.ro._ZTI2S2,"awG",@progbits,_ZTI2S2,comdat
	.align 8
	.type	_ZTI2S2, @object
	.size	_ZTI2S2, 24
_ZTI2S2:
# <anonymous>:
# <anonymous>:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
# <anonymous>:
	.quad	_ZTS2S2
# <anonymous>:
	.quad	_ZTI8Strategy
	.weak	_ZTS2S3
	.section	.rodata._ZTS2S3,"aG",@progbits,_ZTS2S3,comdat
	.type	_ZTS2S3, @object
	.size	_ZTS2S3, 4
_ZTS2S3:
	.string	"2S3"
	.weak	_ZTI2S3
	.section	.data.rel.ro._ZTI2S3,"awG",@progbits,_ZTI2S3,comdat
	.align 8
	.type	_ZTI2S3, @object
	.size	_ZTI2S3, 24
_ZTI2S3:
# <anonymous>:
# <anonymous>:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
# <anonymous>:
	.quad	_ZTS2S3
# <anonymous>:
	.quad	_ZTI8Strategy
	.weak	_ZTV2S0
	.section	.data.rel.ro.local._ZTV2S0,"awG",@progbits,_ZTV2S0,comdat
	.align 8
	.type	_ZTV2S0, @object
	.size	_ZTV2S0, 40
_ZTV2S0:
	.quad	0
	.quad	_ZTI2S0
	.quad	_ZN2S0D1Ev
	.quad	_ZN2S0D0Ev
	.quad	_ZN2S07on_bookEddd
	.weak	_ZTV2S1
	.section	.data.rel.ro.local._ZTV2S1,"awG",@progbits,_ZTV2S1,comdat
	.align 8
	.type	_ZTV2S1, @object
	.size	_ZTV2S1, 40
_ZTV2S1:
	.quad	0
	.quad	_ZTI2S1
	.quad	_ZN2S1D1Ev
	.quad	_ZN2S1D0Ev
	.quad	_ZN2S17on_bookEddd
	.weak	_ZTV2S2
	.section	.data.rel.ro.local._ZTV2S2,"awG",@progbits,_ZTV2S2,comdat
	.align 8
	.type	_ZTV2S2, @object
	.size	_ZTV2S2, 40
_ZTV2S2:
	.quad	0
	.quad	_ZTI2S2
	.quad	_ZN2S2D1Ev
	.quad	_ZN2S2D0Ev
	.quad	_ZN2S27on_bookEddd
	.weak	_ZTV2S3
	.section	.data.rel.ro.local._ZTV2S3,"awG",@progbits,_ZTV2S3,comdat
	.align 8
	.type	_ZTV2S3, @object
	.size	_ZTV2S3, 40
_ZTV2S3:
	.quad	0
	.quad	_ZTI2S3
	.quad	_ZN2S3D1Ev
	.quad	_ZN2S3D0Ev
	.quad	_ZN2S37on_bookEddd
	.local	_ZL6g_sink
	.comm	_ZL6g_sink,8,8
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1071644672
	.align 8
.LC1:
	.long	0
	.long	1079574528
	.align 8
.LC2:
	.long	-1374389535
	.long	1079574855
	.align 8
.LC4:
	.long	-1717986918
	.long	1069128089
	.align 8
.LC5:
	.long	0
	.long	1098060496
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.globl	__gxx_personality_v0
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
