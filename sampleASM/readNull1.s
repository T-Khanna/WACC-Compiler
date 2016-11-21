valid/runtimeErr/nullDereference/readNull1.wacc
calling the reference compiler on valid/runtimeErr/nullDereference/readNull1.wacc
-- Test: readNull1.wacc

-- Uploaded file: 
---------------------------------------------------------------
# attempt dereference of a null pair by reading into an element of it

# Output:
# #runtime_error#

# Exit:
# 255

# Program:

begin
	pair(int, int) p = null ;
	read fst p
end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
readNull1.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 50
4		.ascii	"NullReferenceError: dereference a null reference\n\0"
5	msg_1:
6		.word 3
7		.ascii	"%d\0"
8	msg_2:
9		.word 5
10		.ascii	"%.*s\0"
11	
12	.text
13	
14	.global main
15	main:
16		PUSH {lr}
17		SUB sp, sp, #4
18		LDR r4, =0
19		STR r4, [sp]
20		LDR r4, [sp]
21		MOV r0, r4
22		BL p_check_null_pointer
23		LDR r4, [r4]
24		MOV r0, r4
25		BL p_read_int
26		ADD sp, sp, #4
27		LDR r0, =0
28		POP {pc}
29		.ltorg
30	p_check_null_pointer:
31		PUSH {lr}
32		CMP r0, #0
33		LDREQ r0, =msg_0
34		BLEQ p_throw_runtime_error
35		POP {pc}
36	p_read_int:
37		PUSH {lr}
38		MOV r1, r0
39		LDR r0, =msg_1
40		ADD r0, r0, #4
41		BL scanf
42		POP {pc}
43	p_throw_runtime_error:
44		BL p_print_string
45		MOV r0, #-1
46		BL exit
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
57	
===========================================================
-- Finished

