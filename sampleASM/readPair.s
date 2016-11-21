valid/pairs/readPair.wacc
calling the reference compiler on valid/pairs/readPair.wacc
-- Test: readPair.wacc

-- Uploaded file: 
---------------------------------------------------------------
# construct a pair from supplied user input

# Output:
# Please enter the first element (char): #input#
# Please enter the second element (int): #input#
# The first element was #output#
# The second element was #output#

# Program:

begin
	pair(char, int) p = newpair('\0', 0) ;
	print "Please enter the first element (char): " ;
  	char c = '0';
	read c ;
  	fst p = c ;
	print "Please enter the second element (int): " ;
	int i = 0 ;
	read i ;
	snd p = i ;
	# Clear the value for c and i
	c = '\0' ;
	i = -1 ;
	print "The first element was " ;
	c = fst p ;
	println c ;
	print "The second element was " ;
	i = snd p ;
	println i 
end 
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
readPair.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 39
4		.ascii	"Please enter the first element (char): "
5	msg_1:
6		.word 39
7		.ascii	"Please enter the second element (int): "
8	msg_2:
9		.word 22
10		.ascii	"The first element was "
11	msg_3:
12		.word 23
13		.ascii	"The second element was "
14	msg_4:
15		.word 5
16		.ascii	"%.*s\0"
17	msg_5:
18		.word 4
19		.ascii	" %c\0"
20	msg_6:
21		.word 50
22		.ascii	"NullReferenceError: dereference a null reference\n\0"
23	msg_7:
24		.word 3
25		.ascii	"%d\0"
26	msg_8:
27		.word 1
28		.ascii	"\0"
29	msg_9:
30		.word 3
31		.ascii	"%d\0"
32	
33	.text
34	
35	.global main
36	main:
37		PUSH {lr}
38		SUB sp, sp, #9
39		LDR r0, =8
40		BL malloc
41		MOV r4, r0
42		MOV r5, #0
43		LDR r0, =1
44		BL malloc
45		STRB r5, [r0]
46		STR r0, [r4]
47		LDR r5, =0
48		LDR r0, =4
49		BL malloc
50		STR r5, [r0]
51		STR r0, [r4, #4]
52		STR r4, [sp, #5]
53		LDR r4, =msg_0
54		MOV r0, r4
55		BL p_print_string
56		MOV r4, #'0'
57		STRB r4, [sp, #4]
58		ADD r4, sp, #4
59		MOV r0, r4
60		BL p_read_char
61		LDRSB r4, [sp, #4]
62		LDR r5, [sp, #5]
63		MOV r0, r5
64		BL p_check_null_pointer
65		LDR r5, [r5]
66		STRB r4, [r5]
67		LDR r4, =msg_1
68		MOV r0, r4
69		BL p_print_string
70		LDR r4, =0
71		STR r4, [sp]
72		ADD r4, sp, #0
73		MOV r0, r4
74		BL p_read_int
75		LDR r4, [sp]
76		LDR r5, [sp, #5]
77		MOV r0, r5
78		BL p_check_null_pointer
79		LDR r5, [r5, #4]
80		STR r4, [r5]
81		MOV r4, #0
82		STRB r4, [sp, #4]
83		LDR r4, =-1
84		STR r4, [sp]
85		LDR r4, =msg_2
86		MOV r0, r4
87		BL p_print_string
88		LDR r4, [sp, #5]
89		MOV r0, r4
90		BL p_check_null_pointer
91		LDR r4, [r4]
92		LDRSB r4, [r4]
93		STRB r4, [sp, #4]
94		LDRSB r4, [sp, #4]
95		MOV r0, r4
96		BL putchar
97		BL p_print_ln
98		LDR r4, =msg_3
99		MOV r0, r4
100		BL p_print_string
101		LDR r4, [sp, #5]
102		MOV r0, r4
103		BL p_check_null_pointer
104		LDR r4, [r4, #4]
105		LDR r4, [r4]
106		STR r4, [sp]
107		LDR r4, [sp]
108		MOV r0, r4
109		BL p_print_int
110		BL p_print_ln
111		ADD sp, sp, #9
112		LDR r0, =0
113		POP {pc}
114		.ltorg
115	p_print_string:
116		PUSH {lr}
117		LDR r1, [r0]
118		ADD r2, r0, #4
119		LDR r0, =msg_4
120		ADD r0, r0, #4
121		BL printf
122		MOV r0, #0
123		BL fflush
124		POP {pc}
125	p_read_char:
126		PUSH {lr}
127		MOV r1, r0
128		LDR r0, =msg_5
129		ADD r0, r0, #4
130		BL scanf
131		POP {pc}
132	p_check_null_pointer:
133		PUSH {lr}
134		CMP r0, #0
135		LDREQ r0, =msg_6
136		BLEQ p_throw_runtime_error
137		POP {pc}
138	p_read_int:
139		PUSH {lr}
140		MOV r1, r0
141		LDR r0, =msg_7
142		ADD r0, r0, #4
143		BL scanf
144		POP {pc}
145	p_print_ln:
146		PUSH {lr}
147		LDR r0, =msg_8
148		ADD r0, r0, #4
149		BL puts
150		MOV r0, #0
151		BL fflush
152		POP {pc}
153	p_print_int:
154		PUSH {lr}
155		MOV r1, r0
156		LDR r0, =msg_9
157		ADD r0, r0, #4
158		BL printf
159		MOV r0, #0
160		BL fflush
161		POP {pc}
162	p_throw_runtime_error:
163		BL p_print_string
164		MOV r0, #-1
165		BL exit
166	
===========================================================
-- Finished

