valid/while/rmStyleAddIO.wacc
calling the reference compiler on valid/while/rmStyleAddIO.wacc
-- Test: rmStyleAddIO.wacc

-- Uploaded file: 
---------------------------------------------------------------
# register machine style addition

# Output:
# Enter the first number: #input# Enter the second number: #input# Initial value of x: #output#
# #output#
# final value of x: #output

# Program:

begin
  int x = 0 ;
  int y = 0 ;
  print "Enter the first number: " ;
  read x ;
  print "Enter the second number: " ;
  read y ;
  print "Initial value of x: " ;
  println x ;
  while y > 0 do
    print "(+)" ;
    x = x + 1 ;
    y = y - 1
  done ;
  println "" ;
  print "final value of x: " ;
  println x
end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
rmStyleAddIO.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 24
4		.ascii	"Enter the first number: "
5	msg_1:
6		.word 25
7		.ascii	"Enter the second number: "
8	msg_2:
9		.word 20
10		.ascii	"Initial value of x: "
11	msg_3:
12		.word 3
13		.ascii	"(+)"
14	msg_4:
15		.word 0
16		.ascii	""
17	msg_5:
18		.word 18
19		.ascii	"final value of x: "
20	msg_6:
21		.word 5
22		.ascii	"%.*s\0"
23	msg_7:
24		.word 3
25		.ascii	"%d\0"
26	msg_8:
27		.word 3
28		.ascii	"%d\0"
29	msg_9:
30		.word 1
31		.ascii	"\0"
32	msg_10:
33		.word 82
34		.ascii	"OverflowError: the result is too small/large to store in a 4-byte signed-integer.\n"
35	
36	.text
37	
38	.global main
39	main:
40		PUSH {lr}
41		SUB sp, sp, #8
42		LDR r4, =0
43		STR r4, [sp, #4]
44		LDR r4, =0
45		STR r4, [sp]
46		LDR r4, =msg_0
47		MOV r0, r4
48		BL p_print_string
49		ADD r4, sp, #4
50		MOV r0, r4
51		BL p_read_int
52		LDR r4, =msg_1
53		MOV r0, r4
54		BL p_print_string
55		ADD r4, sp, #0
56		MOV r0, r4
57		BL p_read_int
58		LDR r4, =msg_2
59		MOV r0, r4
60		BL p_print_string
61		LDR r4, [sp, #4]
62		MOV r0, r4
63		BL p_print_int
64		BL p_print_ln
65		B L0
66	L1:
67		LDR r4, =msg_3
68		MOV r0, r4
69		BL p_print_string
70		LDR r4, [sp, #4]
71		LDR r5, =1
72		ADDS r4, r4, r5
73		BLVS p_throw_overflow_error
74		STR r4, [sp, #4]
75		LDR r4, [sp]
76		LDR r5, =1
77		SUBS r4, r4, r5
78		BLVS p_throw_overflow_error
79		STR r4, [sp]
80	L0:
81		LDR r4, [sp]
82		LDR r5, =0
83		CMP r4, r5
84		MOVGT r4, #1
85		MOVLE r4, #0
86		CMP r4, #1
87		BEQ L1
88		LDR r4, =msg_4
89		MOV r0, r4
90		BL p_print_string
91		BL p_print_ln
92		LDR r4, =msg_5
93		MOV r0, r4
94		BL p_print_string
95		LDR r4, [sp, #4]
96		MOV r0, r4
97		BL p_print_int
98		BL p_print_ln
99		ADD sp, sp, #8
100		LDR r0, =0
101		POP {pc}
102		.ltorg
103	p_print_string:
104		PUSH {lr}
105		LDR r1, [r0]
106		ADD r2, r0, #4
107		LDR r0, =msg_6
108		ADD r0, r0, #4
109		BL printf
110		MOV r0, #0
111		BL fflush
112		POP {pc}
113	p_read_int:
114		PUSH {lr}
115		MOV r1, r0
116		LDR r0, =msg_7
117		ADD r0, r0, #4
118		BL scanf
119		POP {pc}
120	p_print_int:
121		PUSH {lr}
122		MOV r1, r0
123		LDR r0, =msg_8
124		ADD r0, r0, #4
125		BL printf
126		MOV r0, #0
127		BL fflush
128		POP {pc}
129	p_print_ln:
130		PUSH {lr}
131		LDR r0, =msg_9
132		ADD r0, r0, #4
133		BL puts
134		MOV r0, #0
135		BL fflush
136		POP {pc}
137	p_throw_overflow_error:
138		LDR r0, =msg_10
139		BL p_throw_runtime_error
140	p_throw_runtime_error:
141		BL p_print_string
142		MOV r0, #-1
143		BL exit
144	
===========================================================
-- Finished

