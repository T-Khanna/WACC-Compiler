valid/IO/IOSequence.wacc
calling the reference compiler on valid/IO/IOSequence.wacc
-- Test: IOSequence.wacc

-- Uploaded file: 
---------------------------------------------------------------
# basic input/output sequence

# Output:
# Please input an integer: #input#
# You input: #output#

# Program:

begin 
  int x = 0 ;
  print "Please input an integer: " ;
  read x ;
  print "You input: " ;
  println x
end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
IOSequence.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 25
4		.ascii	"Please input an integer: "
5	msg_1:
6		.word 11
7		.ascii	"You input: "
8	msg_2:
9		.word 5
10		.ascii	"%.*s\0"
11	msg_3:
12		.word 3
13		.ascii	"%d\0"
14	msg_4:
15		.word 3
16		.ascii	"%d\0"
17	msg_5:
18		.word 1
19		.ascii	"\0"
20	
21	.text
22	
23	.global main
24	main:
25		PUSH {lr}
26		SUB sp, sp, #4
27		LDR r4, =0
28		STR r4, [sp]
29		LDR r4, =msg_0
30		MOV r0, r4
31		BL p_print_string
32		ADD r4, sp, #0
33		MOV r0, r4
34		BL p_read_int
35		LDR r4, =msg_1
36		MOV r0, r4
37		BL p_print_string
38		LDR r4, [sp]
39		MOV r0, r4
40		BL p_print_int
41		BL p_print_ln
42		ADD sp, sp, #4
43		LDR r0, =0
44		POP {pc}
45		.ltorg
46	p_print_string:
47		PUSH {lr}
48		LDR r1, [r0]
49		ADD r2, r0, #4
50		LDR r0, =msg_2
51		ADD r0, r0, #4
52		BL printf
53		MOV r0, #0
54		BL fflush
55		POP {pc}
56	p_read_int:
57		PUSH {lr}
58		MOV r1, r0
59		LDR r0, =msg_3
60		ADD r0, r0, #4
61		BL scanf
62		POP {pc}
63	p_print_int:
64		PUSH {lr}
65		MOV r1, r0
66		LDR r0, =msg_4
67		ADD r0, r0, #4
68		BL printf
69		MOV r0, #0
70		BL fflush
71		POP {pc}
72	p_print_ln:
73		PUSH {lr}
74		LDR r0, =msg_5
75		ADD r0, r0, #4
76		BL puts
77		MOV r0, #0
78		BL fflush
79		POP {pc}
80	
===========================================================
-- Finished

