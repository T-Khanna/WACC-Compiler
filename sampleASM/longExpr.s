valid/expressions/longExpr.wacc
calling the reference compiler on valid/expressions/longExpr.wacc
-- Test: longExpr.wacc

-- Uploaded file: 
---------------------------------------------------------------
# tests whether the compiler can handle long expressions

# Output:
# #empty#

# Exit:
# 153

begin

  int x = 1 + (2 + (3 + (4 + (5 + (6 + (7 + (8 + (9 + (10 + (11 + (12 + (13 + (14 + (15 + (16 + 17)))))))))))))));
  exit x

end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
longExpr.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 82
4		.ascii	"OverflowError: the result is too small/large to store in a 4-byte signed-integer.\n"
5	msg_1:
6		.word 5
7		.ascii	"%.*s\0"
8	
9	.text
10	
11	.global main
12	main:
13		PUSH {lr}
14		SUB sp, sp, #4
15		LDR r4, =1
16		LDR r5, =2
17		LDR r6, =3
18		LDR r7, =4
19		LDR r8, =5
20		LDR r9, =6
21		LDR r10, =7
22		PUSH {r10}
23		LDR r10, =8
24		PUSH {r10}
25		LDR r10, =9
26		PUSH {r10}
27		LDR r10, =10
28		PUSH {r10}
29		LDR r10, =11
30		PUSH {r10}
31		LDR r10, =12
32		PUSH {r10}
33		LDR r10, =13
34		PUSH {r10}
35		LDR r10, =14
36		PUSH {r10}
37		LDR r10, =15
38		PUSH {r10}
39		LDR r10, =16
40		PUSH {r10}
41		LDR r10, =17
42		POP {r11}
43		ADDS r10, r11, r10
44		BLVS p_throw_overflow_error
45		POP {r11}
46		ADDS r10, r11, r10
47		BLVS p_throw_overflow_error
48		POP {r11}
49		ADDS r10, r11, r10
50		BLVS p_throw_overflow_error
51		POP {r11}
52		ADDS r10, r11, r10
53		BLVS p_throw_overflow_error
54		POP {r11}
55		ADDS r10, r11, r10
56		BLVS p_throw_overflow_error
57		POP {r11}
58		ADDS r10, r11, r10
59		BLVS p_throw_overflow_error
60		POP {r11}
61		ADDS r10, r11, r10
62		BLVS p_throw_overflow_error
63		POP {r11}
64		ADDS r10, r11, r10
65		BLVS p_throw_overflow_error
66		POP {r11}
67		ADDS r10, r11, r10
68		BLVS p_throw_overflow_error
69		POP {r11}
70		ADDS r10, r11, r10
71		BLVS p_throw_overflow_error
72		ADDS r9, r9, r10
73		BLVS p_throw_overflow_error
74		ADDS r8, r8, r9
75		BLVS p_throw_overflow_error
76		ADDS r7, r7, r8
77		BLVS p_throw_overflow_error
78		ADDS r6, r6, r7
79		BLVS p_throw_overflow_error
80		ADDS r5, r5, r6
81		BLVS p_throw_overflow_error
82		ADDS r4, r4, r5
83		BLVS p_throw_overflow_error
84		STR r4, [sp]
85		LDR r4, [sp]
86		MOV r0, r4
87		BL exit
88		ADD sp, sp, #4
89		LDR r0, =0
90		POP {pc}
91		.ltorg
92	p_throw_overflow_error:
93		LDR r0, =msg_0
94		BL p_throw_runtime_error
95	p_throw_runtime_error:
96		BL p_print_string
97		MOV r0, #-1
98		BL exit
99	p_print_string:
100		PUSH {lr}
101		LDR r1, [r0]
102		ADD r2, r0, #4
103		LDR r0, =msg_1
104		ADD r0, r0, #4
105		BL printf
106		MOV r0, #0
107		BL fflush
108		POP {pc}
109	
===========================================================
-- Finished

