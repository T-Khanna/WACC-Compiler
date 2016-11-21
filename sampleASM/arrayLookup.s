valid/array/arrayLookup.wacc
calling the reference compiler on valid/array/arrayLookup.wacc
-- Test: arrayLookup.wacc

-- Uploaded file: 
---------------------------------------------------------------
# check first element of array

# Output:
# 43

# Program:

begin
  int[] a = [43, 2, 18, 1] ;
  println a[0]
end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
arrayLookup.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 44
4		.ascii	"ArrayIndexOutOfBoundsError: negative index\n\0"
5	msg_1:
6		.word 45
7		.ascii	"ArrayIndexOutOfBoundsError: index too large\n\0"
8	msg_2:
9		.word 3
10		.ascii	"%d\0"
11	msg_3:
12		.word 1
13		.ascii	"\0"
14	msg_4:
15		.word 5
16		.ascii	"%.*s\0"
17	
18	.text
19	
20	.global main
21	main:
22		PUSH {lr}
23		SUB sp, sp, #4
24		LDR r0, =20
25		BL malloc
26		MOV r4, r0
27		LDR r5, =43
28		STR r5, [r4, #4]
29		LDR r5, =2
30		STR r5, [r4, #8]
31		LDR r5, =18
32		STR r5, [r4, #12]
33		LDR r5, =1
34		STR r5, [r4, #16]
35		LDR r5, =4
36		STR r5, [r4]
37		STR r4, [sp]
38		ADD r4, sp, #0
39		LDR r5, =0
40		LDR r4, [r4]
41		MOV r0, r5
42		MOV r1, r4
43		BL p_check_array_bounds
44		ADD r4, r4, #4
45		ADD r4, r4, r5, LSL #2
46		LDR r4, [r4]
47		MOV r0, r4
48		BL p_print_int
49		BL p_print_ln
50		ADD sp, sp, #4
51		LDR r0, =0
52		POP {pc}
53		.ltorg
54	p_check_array_bounds:
55		PUSH {lr}
56		CMP r0, #0
57		LDRLT r0, =msg_0
58		BLLT p_throw_runtime_error
59		LDR r1, [r1]
60		CMP r0, r1
61		LDRCS r0, =msg_1
62		BLCS p_throw_runtime_error
63		POP {pc}
64	p_print_int:
65		PUSH {lr}
66		MOV r1, r0
67		LDR r0, =msg_2
68		ADD r0, r0, #4
69		BL printf
70		MOV r0, #0
71		BL fflush
72		POP {pc}
73	p_print_ln:
74		PUSH {lr}
75		LDR r0, =msg_3
76		ADD r0, r0, #4
77		BL puts
78		MOV r0, #0
79		BL fflush
80		POP {pc}
81	p_throw_runtime_error:
82		BL p_print_string
83		MOV r0, #-1
84		BL exit
85	p_print_string:
86		PUSH {lr}
87		LDR r1, [r0]
88		ADD r2, r0, #4
89		LDR r0, =msg_4
90		ADD r0, r0, #4
91		BL printf
92		MOV r0, #0
93		BL fflush
94		POP {pc}
95	
===========================================================
-- Finished

