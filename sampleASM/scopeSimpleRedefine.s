valid/scope/scopeSimpleRedefine.wacc
calling the reference compiler on valid/scope/scopeSimpleRedefine.wacc
-- Test: scopeSimpleRedefine.wacc

-- Uploaded file: 
---------------------------------------------------------------
# variable scoping test that redefines a variable

# Output:
# true
# 12

# Program:

begin
  int x = 12 ;
  begin
    bool x = true ;
    println x
  end ;
  println x 
end

---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
scopeSimpleRedefine.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 5
4		.ascii	"true\0"
5	msg_1:
6		.word 6
7		.ascii	"false\0"
8	msg_2:
9		.word 1
10		.ascii	"\0"
11	msg_3:
12		.word 3
13		.ascii	"%d\0"
14	
15	.text
16	
17	.global main
18	main:
19		PUSH {lr}
20		SUB sp, sp, #4
21		LDR r4, =12
22		STR r4, [sp]
23		SUB sp, sp, #1
24		MOV r4, #1
25		STRB r4, [sp]
26		LDRSB r4, [sp]
27		MOV r0, r4
28		BL p_print_bool
29		BL p_print_ln
30		ADD sp, sp, #1
31		LDR r4, [sp]
32		MOV r0, r4
33		BL p_print_int
34		BL p_print_ln
35		ADD sp, sp, #4
36		LDR r0, =0
37		POP {pc}
38		.ltorg
39	p_print_bool:
40		PUSH {lr}
41		CMP r0, #0
42		LDRNE r0, =msg_0
43		LDREQ r0, =msg_1
44		ADD r0, r0, #4
45		BL printf
46		MOV r0, #0
47		BL fflush
48		POP {pc}
49	p_print_ln:
50		PUSH {lr}
51		LDR r0, =msg_2
52		ADD r0, r0, #4
53		BL puts
54		MOV r0, #0
55		BL fflush
56		POP {pc}
57	p_print_int:
58		PUSH {lr}
59		MOV r1, r0
60		LDR r0, =msg_3
61		ADD r0, r0, #4
62		BL printf
63		MOV r0, #0
64		BL fflush
65		POP {pc}
66	
===========================================================
-- Finished

