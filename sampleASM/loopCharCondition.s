valid/while/loopCharCondition.wacc
calling the reference compiler on valid/while/loopCharCondition.wacc
-- Test: loopCharCondition.wacc

-- Uploaded file: 
---------------------------------------------------------------
# Use a character as a loop condition. Enter the loop once only, then exit the loop.

# Output:
# Change c
# Should print "Change c" once before.

# Program:

begin
	char c = '\0' ;
	while c == '\0' do
		c = 'a' ;
		println "Change c"
	done ;
	println "Should print \"Change c\" once before."
end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
loopCharCondition.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 8
4		.ascii	"Change c"
5	msg_1:
6		.word 36
7		.ascii	"Should print \"Change c\" once before."
8	msg_2:
9		.word 5
10		.ascii	"%.*s\0"
11	msg_3:
12		.word 1
13		.ascii	"\0"
14	
15	.text
16	
17	.global main
18	main:
19		PUSH {lr}
20		SUB sp, sp, #1
21		MOV r4, #0
22		STRB r4, [sp]
23		B L0
24	L1:
25		MOV r4, #'a'
26		STRB r4, [sp]
27		LDR r4, =msg_0
28		MOV r0, r4
29		BL p_print_string
30		BL p_print_ln
31	L0:
32		LDRSB r4, [sp]
33		MOV r5, #0
34		CMP r4, r5
35		MOVEQ r4, #1
36		MOVNE r4, #0
37		CMP r4, #1
38		BEQ L1
39		LDR r4, =msg_1
40		MOV r0, r4
41		BL p_print_string
42		BL p_print_ln
43		ADD sp, sp, #1
44		LDR r0, =0
45		POP {pc}
46		.ltorg
47	p_print_string:
48		PUSH {lr}
49		LDR r1, [r0]
50		ADD r2, r0, #4
51		LDR r0, =msg_2
52		ADD r0, r0, #4
53		BL printf
54		MOV r0, #0
55		BL fflush
56		POP {pc}
57	p_print_ln:
58		PUSH {lr}
59		LDR r0, =msg_3
60		ADD r0, r0, #4
61		BL puts
62		MOV r0, #0
63		BL fflush
64		POP {pc}
65	
===========================================================
-- Finished

