valid/if/ifFalse.wacc
calling the reference compiler on valid/if/ifFalse.wacc
-- Test: ifFalse.wacc

-- Uploaded file: 
---------------------------------------------------------------
# simple false if statement 

# Output:
# here

# Program:

begin
  if false
  then
    println "not here"
  else
    println "here"
  fi
end

---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
ifFalse.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 8
4		.ascii	"not here"
5	msg_1:
6		.word 4
7		.ascii	"here"
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
20		MOV r4, #0
21		CMP r4, #0
22		BEQ L0
23		LDR r4, =msg_0
24		MOV r0, r4
25		BL p_print_string
26		BL p_print_ln
27		B L1
28	L0:
29		LDR r4, =msg_1
30		MOV r0, r4
31		BL p_print_string
32		BL p_print_ln
33	L1:
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

