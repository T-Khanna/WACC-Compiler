valid/runtimeErr/divideByZero/divideByZero.wacc
calling the reference compiler on valid/runtimeErr/divideByZero/divideByZero.wacc
-- Test: divideByZero.wacc

-- Uploaded file: 
---------------------------------------------------------------
# attempt divide by zero

# Output:
# #runtime_error#

# Exit:
# 255

# Program:

begin
	int x = 10 ;
	int y = 0 ;
	print x / y
end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
divideByZero.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 45
4		.ascii	"DivideByZeroError: divide or modulo by zero\n\0"
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
17		SUB sp, sp, #8
18		LDR r4, =10
19		STR r4, [sp, #4]
20		LDR r4, =0
21		STR r4, [sp]
22		LDR r4, [sp, #4]
23		LDR r5, [sp]
24		MOV r0, r4
25		MOV r1, r5
26		BL p_check_divide_by_zero
27		BL __aeabi_idiv
28		MOV r4, r0
29		MOV r0, r4
30		BL p_print_int
31		ADD sp, sp, #8
32		LDR r0, =0
33		POP {pc}
34		.ltorg
35	p_check_divide_by_zero:
36		PUSH {lr}
37		CMP r1, #0
38		LDREQ r0, =msg_0
39		BLEQ p_throw_runtime_error
40		POP {pc}
41	p_print_int:
42		PUSH {lr}
43		MOV r1, r0
44		LDR r0, =msg_1
45		ADD r0, r0, #4
46		BL printf
47		MOV r0, #0
48		BL fflush
49		POP {pc}
50	p_throw_runtime_error:
51		BL p_print_string
52		MOV r0, #-1
53		BL exit
54	p_print_string:
55		PUSH {lr}
56		LDR r1, [r0]
57		ADD r2, r0, #4
58		LDR r0, =msg_2
59		ADD r0, r0, #4
60		BL printf
61		MOV r0, #0
62		BL fflush
63		POP {pc}
64	
===========================================================
-- Finished

