valid/runtimeErr/integerOverflow/intUnderflow.wacc
calling the reference compiler on valid/runtimeErr/integerOverflow/intUnderflow.wacc
-- Test: intUnderflow.wacc

-- Uploaded file: 
---------------------------------------------------------------
# integer overflow

# Output:
# -2147483647
# -2147483648
# #runtime_error#

# Exit:
# 255

# Program:

begin
  int x = -2147483647 ;
  println x ;
  x = x - 1 ;
  println x ;
  x = x - 1 ;
  println x
end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
intUnderflow.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 3
4		.ascii	"%d\0"
5	msg_1:
6		.word 1
7		.ascii	"\0"
8	msg_2:
9		.word 82
10		.ascii	"OverflowError: the result is too small/large to store in a 4-byte signed-integer.\n"
11	msg_3:
12		.word 5
13		.ascii	"%.*s\0"
14	
15	.text
16	
17	.global main
18	main:
19		PUSH {lr}
20		SUB sp, sp, #4
21		LDR r4, =-2147483647
22		STR r4, [sp]
23		LDR r4, [sp]
24		MOV r0, r4
25		BL p_print_int
26		BL p_print_ln
27		LDR r4, [sp]
28		LDR r5, =1
29		SUBS r4, r4, r5
30		BLVS p_throw_overflow_error
31		STR r4, [sp]
32		LDR r4, [sp]
33		MOV r0, r4
34		BL p_print_int
35		BL p_print_ln
36		LDR r4, [sp]
37		LDR r5, =1
38		SUBS r4, r4, r5
39		BLVS p_throw_overflow_error
40		STR r4, [sp]
41		LDR r4, [sp]
42		MOV r0, r4
43		BL p_print_int
44		BL p_print_ln
45		ADD sp, sp, #4
46		LDR r0, =0
47		POP {pc}
48		.ltorg
49	p_print_int:
50		PUSH {lr}
51		MOV r1, r0
52		LDR r0, =msg_0
53		ADD r0, r0, #4
54		BL printf
55		MOV r0, #0
56		BL fflush
57		POP {pc}
58	p_print_ln:
59		PUSH {lr}
60		LDR r0, =msg_1
61		ADD r0, r0, #4
62		BL puts
63		MOV r0, #0
64		BL fflush
65		POP {pc}
66	p_throw_overflow_error:
67		LDR r0, =msg_2
68		BL p_throw_runtime_error
69	p_throw_runtime_error:
70		BL p_print_string
71		MOV r0, #-1
72		BL exit
73	p_print_string:
74		PUSH {lr}
75		LDR r1, [r0]
76		ADD r2, r0, #4
77		LDR r0, =msg_3
78		ADD r0, r0, #4
79		BL printf
80		MOV r0, #0
81		BL fflush
82		POP {pc}
83	
===========================================================
-- Finished

