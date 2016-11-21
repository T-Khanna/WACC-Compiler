valid/pairs/printNull.wacc
calling the reference compiler on valid/pairs/printNull.wacc
-- Test: printNull.wacc

-- Uploaded file: 
---------------------------------------------------------------
# print the null reference

# Output:
# (nil)

# Program:

begin
  println null
end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
printNull.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 3
4		.ascii	"%p\0"
5	msg_1:
6		.word 1
7		.ascii	"\0"
8	
9	.text
10	
11	.global main
12	main:
13		PUSH {lr}
14		LDR r4, =0
15		MOV r0, r4
16		BL p_print_reference
17		BL p_print_ln
18		LDR r0, =0
19		POP {pc}
20		.ltorg
21	p_print_reference:
22		PUSH {lr}
23		MOV r1, r0
24		LDR r0, =msg_0
25		ADD r0, r0, #4
26		BL printf
27		MOV r0, #0
28		BL fflush
29		POP {pc}
30	p_print_ln:
31		PUSH {lr}
32		LDR r0, =msg_1
33		ADD r0, r0, #4
34		BL puts
35		MOV r0, #0
36		BL fflush
37		POP {pc}
38	
===========================================================
-- Finished

