valid/runtimeErr/nullDereference/setNull1.wacc
calling the reference compiler on valid/runtimeErr/nullDereference/setNull1.wacc
-- Test: setNull1.wacc

-- Uploaded file: 
---------------------------------------------------------------
# attempt dereference of a null pair by setting an element of it

# Output:
# #runtime_error#

# Exit:
# 255

# Program:

begin
	pair(int, int) p = null ;
	fst p = 1
end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
setNull1.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 50
4		.ascii	"NullReferenceError: dereference a null reference\n\0"
5	msg_1:
6		.word 5
7		.ascii	"%.*s\0"
8	
9	.text
10	
11	.global main
12	main:
13		PUSH {lr}
14		SUB sp, sp, #4
15		LDR r4, =0
16		STR r4, [sp]
17		LDR r4, =1
18		LDR r5, [sp]
19		MOV r0, r5
20		BL p_check_null_pointer
21		LDR r5, [r5]
22		STR r4, [r5]
23		ADD sp, sp, #4
24		LDR r0, =0
25		POP {pc}
26		.ltorg
27	p_check_null_pointer:
28		PUSH {lr}
29		CMP r0, #0
30		LDREQ r0, =msg_0
31		BLEQ p_throw_runtime_error
32		POP {pc}
33	p_throw_runtime_error:
34		BL p_print_string
35		MOV r0, #-1
36		BL exit
37	p_print_string:
38		PUSH {lr}
39		LDR r1, [r0]
40		ADD r2, r0, #4
41		LDR r0, =msg_1
42		ADD r0, r0, #4
43		BL printf
44		MOV r0, #0
45		BL fflush
46		POP {pc}
47	
===========================================================
-- Finished

