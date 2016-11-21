valid/pairs/printPair.wacc
calling the reference compiler on valid/pairs/printPair.wacc
-- Test: printPair.wacc

-- Uploaded file: 
---------------------------------------------------------------
# print pair program

# Output:
# #addrs# = (10, a)

# Program:

begin
  pair(int, char) p = newpair(10, 'a') ;
  print p ; 
  print " = (" ;
  int x = fst p ;
  print x ;
  print ", " ;
  char c = snd p ;
  print c ;
  println ')' 
end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
printPair.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 4
4		.ascii	" = ("
5	msg_1:
6		.word 2
7		.ascii	", "
8	msg_2:
9		.word 3
10		.ascii	"%p\0"
11	msg_3:
12		.word 5
13		.ascii	"%.*s\0"
14	msg_4:
15		.word 50
16		.ascii	"NullReferenceError: dereference a null reference\n\0"
17	msg_5:
18		.word 3
19		.ascii	"%d\0"
20	msg_6:
21		.word 1
22		.ascii	"\0"
23	
24	.text
25	
26	.global main
27	main:
28		PUSH {lr}
29		SUB sp, sp, #9
30		LDR r0, =8
31		BL malloc
32		MOV r4, r0
33		LDR r5, =10
34		LDR r0, =4
35		BL malloc
36		STR r5, [r0]
37		STR r0, [r4]
38		MOV r5, #'a'
39		LDR r0, =1
40		BL malloc
41		STRB r5, [r0]
42		STR r0, [r4, #4]
43		STR r4, [sp, #5]
44		LDR r4, [sp, #5]
45		MOV r0, r4
46		BL p_print_reference
47		LDR r4, =msg_0
48		MOV r0, r4
49		BL p_print_string
50		LDR r4, [sp, #5]
51		MOV r0, r4
52		BL p_check_null_pointer
53		LDR r4, [r4]
54		LDR r4, [r4]
55		STR r4, [sp, #1]
56		LDR r4, [sp, #1]
57		MOV r0, r4
58		BL p_print_int
59		LDR r4, =msg_1
60		MOV r0, r4
61		BL p_print_string
62		LDR r4, [sp, #5]
63		MOV r0, r4
64		BL p_check_null_pointer
65		LDR r4, [r4, #4]
66		LDRSB r4, [r4]
67		STRB r4, [sp]
68		LDRSB r4, [sp]
69		MOV r0, r4
70		BL putchar
71		MOV r4, #')'
72		MOV r0, r4
73		BL putchar
74		BL p_print_ln
75		ADD sp, sp, #9
76		LDR r0, =0
77		POP {pc}
78		.ltorg
79	p_print_reference:
80		PUSH {lr}
81		MOV r1, r0
82		LDR r0, =msg_2
83		ADD r0, r0, #4
84		BL printf
85		MOV r0, #0
86		BL fflush
87		POP {pc}
88	p_print_string:
89		PUSH {lr}
90		LDR r1, [r0]
91		ADD r2, r0, #4
92		LDR r0, =msg_3
93		ADD r0, r0, #4
94		BL printf
95		MOV r0, #0
96		BL fflush
97		POP {pc}
98	p_check_null_pointer:
99		PUSH {lr}
100		CMP r0, #0
101		LDREQ r0, =msg_4
102		BLEQ p_throw_runtime_error
103		POP {pc}
104	p_print_int:
105		PUSH {lr}
106		MOV r1, r0
107		LDR r0, =msg_5
108		ADD r0, r0, #4
109		BL printf
110		MOV r0, #0
111		BL fflush
112		POP {pc}
113	p_print_ln:
114		PUSH {lr}
115		LDR r0, =msg_6
116		ADD r0, r0, #4
117		BL puts
118		MOV r0, #0
119		BL fflush
120		POP {pc}
121	p_throw_runtime_error:
122		BL p_print_string
123		MOV r0, #-1
124		BL exit
125	
===========================================================
-- Finished

