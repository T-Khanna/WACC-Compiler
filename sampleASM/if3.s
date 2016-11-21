valid/if/if3.wacc
calling the reference compiler on valid/if/if3.wacc
-- Test: if3.wacc

-- Uploaded file: 
---------------------------------------------------------------
# Simple conditional statement with int comparison test

# Output:
# correct

# Program:

begin
  int a = 13;	
  int b = 37;
  if a < b 
  then 
    println "correct"
  else 
    println "incorrect"
  fi
end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
if3.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 7
4		.ascii	"correct"
5	msg_1:
6		.word 9
7		.ascii	"incorrect"
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
20		SUB sp, sp, #8
21		LDR r4, =13
22		STR r4, [sp, #4]
23		LDR r4, =37
24		STR r4, [sp]
25		LDR r4, [sp, #4]
26		LDR r5, [sp]
27		CMP r4, r5
28		MOVLT r4, #1
29		MOVGE r4, #0
30		CMP r4, #0
31		BEQ L0
32		LDR r4, =msg_0
33		MOV r0, r4
34		BL p_print_string
35		BL p_print_ln
36		B L1
37	L0:
38		LDR r4, =msg_1
39		MOV r0, r4
40		BL p_print_string
41		BL p_print_ln
42	L1:
43		ADD sp, sp, #8
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

