valid/IO/print/stringAssignmentWithPrint.wacc
calling the reference compiler on valid/IO/print/stringAssignmentWithPrint.wacc
-- Test: stringAssignmentWithPrint.wacc

-- Uploaded file: 
---------------------------------------------------------------
# string assignment followed by print

# Output:
# foo
# bar

# Program:

begin
  string s = "foo" ;
  println s ;
  s = "bar" ;
  println s
end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
stringAssignmentWithPrint.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 3
4		.ascii	"foo"
5	msg_1:
6		.word 3
7		.ascii	"bar"
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
20		SUB sp, sp, #4
21		LDR r4, =msg_0
22		STR r4, [sp]
23		LDR r4, [sp]
24		MOV r0, r4
25		BL p_print_string
26		BL p_print_ln
27		LDR r4, =msg_1
28		STR r4, [sp]
29		LDR r4, [sp]
30		MOV r0, r4
31		BL p_print_string
32		BL p_print_ln
33		ADD sp, sp, #4
34		LDR r0, =0
35		POP {pc}
36		.ltorg
37	p_print_string:
38		PUSH {lr}
39		LDR r1, [r0]
40		ADD r2, r0, #4
41		LDR r0, =msg_2
42		ADD r0, r0, #4
43		BL printf
44		MOV r0, #0
45		BL fflush
46		POP {pc}
47	p_print_ln:
48		PUSH {lr}
49		LDR r0, =msg_3
50		ADD r0, r0, #4
51		BL puts
52		MOV r0, #0
53		BL fflush
54		POP {pc}
55	
===========================================================
-- Finished

