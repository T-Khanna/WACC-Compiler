valid/expressions/intExpr1.wacc
calling the reference compiler on valid/expressions/intExpr1.wacc
-- Test: intExpr1.wacc

-- Uploaded file: 
---------------------------------------------------------------
# evaluating a moderately complex integer expression

# Output:
# Correct

# Program:

begin
  int a = ( 10 * 1 + 2 * 15 );
  if a == 40 then
    println "Correct"
  else
    println "Wrong"
  fi
end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
intExpr1.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 7
4		.ascii	"Correct"
5	msg_1:
6		.word 5
7		.ascii	"Wrong"
8	msg_2:
9		.word 82
10		.ascii	"OverflowError: the result is too small/large to store in a 4-byte signed-integer.\n"
11	msg_3:
12		.word 5
13		.ascii	"%.*s\0"
14	msg_4:
15		.word 1
16		.ascii	"\0"
17	
18	.text
19	
20	.global main
21	main:
22		PUSH {lr}
23		SUB sp, sp, #4
24		LDR r4, =10
25		LDR r5, =1
26		SMULL r4, r5, r4, r5
27		CMP r5, r4, ASR #31
28		BLNE p_throw_overflow_error
29		LDR r5, =2
30		LDR r6, =15
31		SMULL r5, r6, r5, r6
32		CMP r6, r5, ASR #31
33		BLNE p_throw_overflow_error
34		ADDS r4, r4, r5
35		BLVS p_throw_overflow_error
36		STR r4, [sp]
37		LDR r4, [sp]
38		LDR r5, =40
39		CMP r4, r5
40		MOVEQ r4, #1
41		MOVNE r4, #0
42		CMP r4, #0
43		BEQ L0
44		LDR r4, =msg_0
45		MOV r0, r4
46		BL p_print_string
47		BL p_print_ln
48		B L1
49	L0:
50		LDR r4, =msg_1
51		MOV r0, r4
52		BL p_print_string
53		BL p_print_ln
54	L1:
55		ADD sp, sp, #4
56		LDR r0, =0
57		POP {pc}
58		.ltorg
59	p_throw_overflow_error:
60		LDR r0, =msg_2
61		BL p_throw_runtime_error
62	p_print_string:
63		PUSH {lr}
64		LDR r1, [r0]
65		ADD r2, r0, #4
66		LDR r0, =msg_3
67		ADD r0, r0, #4
68		BL printf
69		MOV r0, #0
70		BL fflush
71		POP {pc}
72	p_print_ln:
73		PUSH {lr}
74		LDR r0, =msg_4
75		ADD r0, r0, #4
76		BL puts
77		MOV r0, #0
78		BL fflush
79		POP {pc}
80	p_throw_runtime_error:
81		BL p_print_string
82		MOV r0, #-1
83		BL exit
84	
===========================================================
-- Finished

