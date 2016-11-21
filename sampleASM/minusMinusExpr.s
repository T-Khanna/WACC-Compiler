valid/expressions/minusMinusExpr.wacc
calling the reference compiler on valid/expressions/minusMinusExpr.wacc
-- Test: minusMinusExpr.wacc

-- Uploaded file: 
---------------------------------------------------------------
# -- should be recognised as two separate symbols

# Output:
# 3

# Program:

begin
  println 1--2
end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
minusMinusExpr.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 82
4		.ascii	"OverflowError: the result is too small/large to store in a 4-byte signed-integer.\n"
5	msg_1:
6		.word 3
7		.ascii	"%d\0"
8	msg_2:
9		.word 1
10		.ascii	"\0"
11	msg_3:
12		.word 5
13		.ascii	"%.*s\0"
14	
15	.text
16	
17	.global main
18	main:
19		PUSH {lr}
20		LDR r4, =1
21		LDR r5, =-2
22		SUBS r4, r4, r5
23		BLVS p_throw_overflow_error
24		MOV r0, r4
25		BL p_print_int
26		BL p_print_ln
27		LDR r0, =0
28		POP {pc}
29		.ltorg
30	p_throw_overflow_error:
31		LDR r0, =msg_0
32		BL p_throw_runtime_error
33	p_print_int:
34		PUSH {lr}
35		MOV r1, r0
36		LDR r0, =msg_1
37		ADD r0, r0, #4
38		BL printf
39		MOV r0, #0
40		BL fflush
41		POP {pc}
42	p_print_ln:
43		PUSH {lr}
44		LDR r0, =msg_2
45		ADD r0, r0, #4
46		BL puts
47		MOV r0, #0
48		BL fflush
49		POP {pc}
50	p_throw_runtime_error:
51		BL p_print_string
52		MOV r0, #-1
53		BL exit
54	p_print_string:
55		PUSH {lr}
56		LDR r1, [r0]
57		ADD r2, r0, #4
58		LDR r0, =msg_3
59		ADD r0, r0, #4
60		BL printf
61		MOV r0, #0
62		BL fflush
63		POP {pc}
64	
===========================================================
-- Finished

