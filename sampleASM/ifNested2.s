valid/scope/ifNested2.wacc
calling the reference compiler on valid/scope/ifNested2.wacc
-- Test: ifNested2.wacc

-- Uploaded file: 
---------------------------------------------------------------
# Deeply nested conditional statement

# Output:
# correct

# Program:

begin
  int a = 13;	
  if a == 13 
  then 
    if a > 5
    then
      if a < 10
      then 
        println "incorrect"
      else
        if a > 12
        then
          if a > 13
          then
            println "incorrect"
          else
            println "correct"
          fi
        else 
          println "incorrect"
        fi
      fi
    else
      println "incorrect"
    fi
  else 
    println "incorrect"
  fi
end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
ifNested2.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 9
4		.ascii	"incorrect"
5	msg_1:
6		.word 9
7		.ascii	"incorrect"
8	msg_2:
9		.word 7
10		.ascii	"correct"
11	msg_3:
12		.word 9
13		.ascii	"incorrect"
14	msg_4:
15		.word 9
16		.ascii	"incorrect"
17	msg_5:
18		.word 9
19		.ascii	"incorrect"
20	msg_6:
21		.word 5
22		.ascii	"%.*s\0"
23	msg_7:
24		.word 1
25		.ascii	"\0"
26	
27	.text
28	
29	.global main
30	main:
31		PUSH {lr}
32		SUB sp, sp, #4
33		LDR r4, =13
34		STR r4, [sp]
35		LDR r4, [sp]
36		LDR r5, =13
37		CMP r4, r5
38		MOVEQ r4, #1
39		MOVNE r4, #0
40		CMP r4, #0
41		BEQ L0
42		LDR r4, [sp]
43		LDR r5, =5
44		CMP r4, r5
45		MOVGT r4, #1
46		MOVLE r4, #0
47		CMP r4, #0
48		BEQ L2
49		LDR r4, [sp]
50		LDR r5, =10
51		CMP r4, r5
52		MOVLT r4, #1
53		MOVGE r4, #0
54		CMP r4, #0
55		BEQ L4
56		LDR r4, =msg_0
57		MOV r0, r4
58		BL p_print_string
59		BL p_print_ln
60		B L5
61	L4:
62		LDR r4, [sp]
63		LDR r5, =12
64		CMP r4, r5
65		MOVGT r4, #1
66		MOVLE r4, #0
67		CMP r4, #0
68		BEQ L6
69		LDR r4, [sp]
70		LDR r5, =13
71		CMP r4, r5
72		MOVGT r4, #1
73		MOVLE r4, #0
74		CMP r4, #0
75		BEQ L8
76		LDR r4, =msg_1
77		MOV r0, r4
78		BL p_print_string
79		BL p_print_ln
80		B L9
81	L8:
82		LDR r4, =msg_2
83		MOV r0, r4
84		BL p_print_string
85		BL p_print_ln
86	L9:
87		B L7
88	L6:
89		LDR r4, =msg_3
90		MOV r0, r4
91		BL p_print_string
92		BL p_print_ln
93	L7:
94	L5:
95		B L3
96	L2:
97		LDR r4, =msg_4
98		MOV r0, r4
99		BL p_print_string
100		BL p_print_ln
101	L3:
102		B L1
103	L0:
104		LDR r4, =msg_5
105		MOV r0, r4
106		BL p_print_string
107		BL p_print_ln
108	L1:
109		ADD sp, sp, #4
110		LDR r0, =0
111		POP {pc}
112		.ltorg
113	p_print_string:
114		PUSH {lr}
115		LDR r1, [r0]
116		ADD r2, r0, #4
117		LDR r0, =msg_6
118		ADD r0, r0, #4
119		BL printf
120		MOV r0, #0
121		BL fflush
122		POP {pc}
123	p_print_ln:
124		PUSH {lr}
125		LDR r0, =msg_7
126		ADD r0, r0, #4
127		BL puts
128		MOV r0, #0
129		BL fflush
130		POP {pc}
131	
===========================================================
-- Finished

