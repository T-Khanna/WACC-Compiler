valid/expressions/charComparisonExpr.wacc
calling the reference compiler on valid/expressions/charComparisonExpr.wacc
-- Test: charComparisonExpr.wacc

-- Uploaded file: 
---------------------------------------------------------------
# detailed battery of character comparison tests

# Output:
# false
# true
# true
# true
# false
# false

# Program:

begin
  char c1 = 'a' ;
  char c2 = 'z' ;
  println c1 == c2 ;
  println c1 != c2 ;
  println c1 < c2 ;
  println c1 <= c2 ;
  println c1 > c2 ;
  println c1 >= c2
end

---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
charComparisonExpr.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 5
4		.ascii	"true\0"
5	msg_1:
6		.word 6
7		.ascii	"false\0"
8	msg_2:
9		.word 1
10		.ascii	"\0"
11	
12	.text
13	
14	.global main
15	main:
16		PUSH {lr}
17		SUB sp, sp, #2
18		MOV r4, #'a'
19		STRB r4, [sp, #1]
20		MOV r4, #'z'
21		STRB r4, [sp]
22		LDRSB r4, [sp, #1]
23		LDRSB r5, [sp]
24		CMP r4, r5
25		MOVEQ r4, #1
26		MOVNE r4, #0
27		MOV r0, r4
28		BL p_print_bool
29		BL p_print_ln
30		LDRSB r4, [sp, #1]
31		LDRSB r5, [sp]
32		CMP r4, r5
33		MOVNE r4, #1
34		MOVEQ r4, #0
35		MOV r0, r4
36		BL p_print_bool
37		BL p_print_ln
38		LDRSB r4, [sp, #1]
39		LDRSB r5, [sp]
40		CMP r4, r5
41		MOVLT r4, #1
42		MOVGE r4, #0
43		MOV r0, r4
44		BL p_print_bool
45		BL p_print_ln
46		LDRSB r4, [sp, #1]
47		LDRSB r5, [sp]
48		CMP r4, r5
49		MOVLE r4, #1
50		MOVGT r4, #0
51		MOV r0, r4
52		BL p_print_bool
53		BL p_print_ln
54		LDRSB r4, [sp, #1]
55		LDRSB r5, [sp]
56		CMP r4, r5
57		MOVGT r4, #1
58		MOVLE r4, #0
59		MOV r0, r4
60		BL p_print_bool
61		BL p_print_ln
62		LDRSB r4, [sp, #1]
63		LDRSB r5, [sp]
64		CMP r4, r5
65		MOVGE r4, #1
66		MOVLT r4, #0
67		MOV r0, r4
68		BL p_print_bool
69		BL p_print_ln
70		ADD sp, sp, #2
71		LDR r0, =0
72		POP {pc}
73		.ltorg
74	p_print_bool:
75		PUSH {lr}
76		CMP r0, #0
77		LDRNE r0, =msg_0
78		LDREQ r0, =msg_1
79		ADD r0, r0, #4
80		BL printf
81		MOV r0, #0
82		BL fflush
83		POP {pc}
84	p_print_ln:
85		PUSH {lr}
86		LDR r0, =msg_2
87		ADD r0, r0, #4
88		BL puts
89		MOV r0, #0
90		BL fflush
91		POP {pc}
92	
===========================================================
-- Finished

