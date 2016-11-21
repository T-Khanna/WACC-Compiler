valid/array/arrayPrint.wacc
calling the reference compiler on valid/array/arrayPrint.wacc
-- Test: arrayPrint.wacc

-- Uploaded file: 
---------------------------------------------------------------
# print the contents of a simple array

# Output:
# #addrs# = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}

# Program:

begin
  int[] a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] ;
  int i = 0 ;
  print a ;
  print " = {" ;
  i = 0 ;
  while i < 10 
  do 
    print a[i] ;
    if i < 9
    then
      print ", "
    else
      skip
    fi ;
    i = i + 1
  done ;
  println "}"
end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
arrayPrint.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 4
4		.ascii	" = {"
5	msg_1:
6		.word 2
7		.ascii	", "
8	msg_2:
9		.word 1
10		.ascii	"}"
11	msg_3:
12		.word 3
13		.ascii	"%p\0"
14	msg_4:
15		.word 5
16		.ascii	"%.*s\0"
17	msg_5:
18		.word 44
19		.ascii	"ArrayIndexOutOfBoundsError: negative index\n\0"
20	msg_6:
21		.word 45
22		.ascii	"ArrayIndexOutOfBoundsError: index too large\n\0"
23	msg_7:
24		.word 3
25		.ascii	"%d\0"
26	msg_8:
27		.word 82
28		.ascii	"OverflowError: the result is too small/large to store in a 4-byte signed-integer.\n"
29	msg_9:
30		.word 1
31		.ascii	"\0"
32	
33	.text
34	
35	.global main
36	main:
37		PUSH {lr}
38		SUB sp, sp, #8
39		LDR r0, =44
40		BL malloc
41		MOV r4, r0
42		LDR r5, =0
43		STR r5, [r4, #4]
44		LDR r5, =1
45		STR r5, [r4, #8]
46		LDR r5, =2
47		STR r5, [r4, #12]
48		LDR r5, =3
49		STR r5, [r4, #16]
50		LDR r5, =4
51		STR r5, [r4, #20]
52		LDR r5, =5
53		STR r5, [r4, #24]
54		LDR r5, =6
55		STR r5, [r4, #28]
56		LDR r5, =7
57		STR r5, [r4, #32]
58		LDR r5, =8
59		STR r5, [r4, #36]
60		LDR r5, =9
61		STR r5, [r4, #40]
62		LDR r5, =10
63		STR r5, [r4]
64		STR r4, [sp, #4]
65		LDR r4, =0
66		STR r4, [sp]
67		LDR r4, [sp, #4]
68		MOV r0, r4
69		BL p_print_reference
70		LDR r4, =msg_0
71		MOV r0, r4
72		BL p_print_string
73		LDR r4, =0
74		STR r4, [sp]
75		B L0
76	L1:
77		ADD r4, sp, #4
78		LDR r5, [sp]
79		LDR r4, [r4]
80		MOV r0, r5
81		MOV r1, r4
82		BL p_check_array_bounds
83		ADD r4, r4, #4
84		ADD r4, r4, r5, LSL #2
85		LDR r4, [r4]
86		MOV r0, r4
87		BL p_print_int
88		LDR r4, [sp]
89		LDR r5, =9
90		CMP r4, r5
91		MOVLT r4, #1
92		MOVGE r4, #0
93		CMP r4, #0
94		BEQ L2
95		LDR r4, =msg_1
96		MOV r0, r4
97		BL p_print_string
98		B L3
99	L2:
100	L3:
101		LDR r4, [sp]
102		LDR r5, =1
103		ADDS r4, r4, r5
104		BLVS p_throw_overflow_error
105		STR r4, [sp]
106	L0:
107		LDR r4, [sp]
108		LDR r5, =10
109		CMP r4, r5
110		MOVLT r4, #1
111		MOVGE r4, #0
112		CMP r4, #1
113		BEQ L1
114		LDR r4, =msg_2
115		MOV r0, r4
116		BL p_print_string
117		BL p_print_ln
118		ADD sp, sp, #8
119		LDR r0, =0
120		POP {pc}
121		.ltorg
122	p_print_reference:
123		PUSH {lr}
124		MOV r1, r0
125		LDR r0, =msg_3
126		ADD r0, r0, #4
127		BL printf
128		MOV r0, #0
129		BL fflush
130		POP {pc}
131	p_print_string:
132		PUSH {lr}
133		LDR r1, [r0]
134		ADD r2, r0, #4
135		LDR r0, =msg_4
136		ADD r0, r0, #4
137		BL printf
138		MOV r0, #0
139		BL fflush
140		POP {pc}
141	p_check_array_bounds:
142		PUSH {lr}
143		CMP r0, #0
144		LDRLT r0, =msg_5
145		BLLT p_throw_runtime_error
146		LDR r1, [r1]
147		CMP r0, r1
148		LDRCS r0, =msg_6
149		BLCS p_throw_runtime_error
150		POP {pc}
151	p_print_int:
152		PUSH {lr}
153		MOV r1, r0
154		LDR r0, =msg_7
155		ADD r0, r0, #4
156		BL printf
157		MOV r0, #0
158		BL fflush
159		POP {pc}
160	p_throw_overflow_error:
161		LDR r0, =msg_8
162		BL p_throw_runtime_error
163	p_print_ln:
164		PUSH {lr}
165		LDR r0, =msg_9
166		ADD r0, r0, #4
167		BL puts
168		MOV r0, #0
169		BL fflush
170		POP {pc}
171	p_throw_runtime_error:
172		BL p_print_string
173		MOV r0, #-1
174		BL exit
175	
===========================================================
-- Finished

