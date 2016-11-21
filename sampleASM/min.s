valid/while/min.wacc
calling the reference compiler on valid/while/min.wacc
-- Test: min.wacc

-- Uploaded file: 
---------------------------------------------------------------
# find the min of two numbers

# Output:
# min value = 10

# Program:

begin
  int i = 0 ;
  int x = 10 ;
  int y = 17 ;
  while y > 0 && x > 0 do
    x = x - 1 ;
    y = y - 1 ;
    i = i + 1
  done ;
  print "min value = " ;
  println i
end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
min.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 12
4		.ascii	"min value = "
5	msg_1:
6		.word 82
7		.ascii	"OverflowError: the result is too small/large to store in a 4-byte signed-integer.\n"
8	msg_2:
9		.word 5
10		.ascii	"%.*s\0"
11	msg_3:
12		.word 3
13		.ascii	"%d\0"
14	msg_4:
15		.word 1
16		.ascii	"\0"
17	
18	.text
19	
20	.global main
21	main:
22		PUSH {lr}
23		SUB sp, sp, #12
24		LDR r4, =0
25		STR r4, [sp, #8]
26		LDR r4, =10
27		STR r4, [sp, #4]
28		LDR r4, =17
29		STR r4, [sp]
30		B L0
31	L1:
32		LDR r4, [sp, #4]
33		LDR r5, =1
34		SUBS r4, r4, r5
35		BLVS p_throw_overflow_error
36		STR r4, [sp, #4]
37		LDR r4, [sp]
38		LDR r5, =1
39		SUBS r4, r4, r5
40		BLVS p_throw_overflow_error
41		STR r4, [sp]
42		LDR r4, [sp, #8]
43		LDR r5, =1
44		ADDS r4, r4, r5
45		BLVS p_throw_overflow_error
46		STR r4, [sp, #8]
47	L0:
48		LDR r4, [sp]
49		LDR r5, =0
50		CMP r4, r5
51		MOVGT r4, #1
52		MOVLE r4, #0
53		LDR r5, [sp, #4]
54		LDR r6, =0
55		CMP r5, r6
56		MOVGT r5, #1
57		MOVLE r5, #0
58		AND r4, r4, r5
59		CMP r4, #1
60		BEQ L1
61		LDR r4, =msg_0
62		MOV r0, r4
63		BL p_print_string
64		LDR r4, [sp, #8]
65		MOV r0, r4
66		BL p_print_int
67		BL p_print_ln
68		ADD sp, sp, #12
69		LDR r0, =0
70		POP {pc}
71		.ltorg
72	p_throw_overflow_error:
73		LDR r0, =msg_1
74		BL p_throw_runtime_error
75	p_print_string:
76		PUSH {lr}
77		LDR r1, [r0]
78		ADD r2, r0, #4
79		LDR r0, =msg_2
80		ADD r0, r0, #4
81		BL printf
82		MOV r0, #0
83		BL fflush
84		POP {pc}
85	p_print_int:
86		PUSH {lr}
87		MOV r1, r0
88		LDR r0, =msg_3
89		ADD r0, r0, #4
90		BL printf
91		MOV r0, #0
92		BL fflush
93		POP {pc}
94	p_print_ln:
95		PUSH {lr}
96		LDR r0, =msg_4
97		ADD r0, r0, #4
98		BL puts
99		MOV r0, #0
100		BL fflush
101		POP {pc}
102	p_throw_runtime_error:
103		BL p_print_string
104		MOV r0, #-1
105		BL exit
106	
===========================================================
-- Finished

