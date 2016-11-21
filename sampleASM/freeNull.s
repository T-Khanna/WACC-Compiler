valid/runtimeErr/nullDereference/freeNull.wacc
calling the reference compiler on valid/runtimeErr/nullDereference/freeNull.wacc
-- Test: freeNull.wacc

-- Uploaded file: 
---------------------------------------------------------------
# Create and free a null pair

# Output:
# #runtime_error#

# Exit:
# 255

# Program:

begin
  pair(pair, pair) a = null ;
  free a
end

---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
freeNull.s contents are:
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
17		LDR r4, [sp]
18		MOV r0, r4
19		BL p_free_pair
20		ADD sp, sp, #4
21		LDR r0, =0
22		POP {pc}
23		.ltorg
24	p_free_pair:
25		PUSH {lr}
26		CMP r0, #0
27		LDREQ r0, =msg_0
28		BEQ p_throw_runtime_error
29		PUSH {r0}
30		LDR r0, [r0]
31		BL free
32		LDR r0, [sp]
33		LDR r0, [r0, #4]
34		BL free
35		POP {r0}
36		BL free
37		POP {pc}
38	p_throw_runtime_error:
39		BL p_print_string
40		MOV r0, #-1
41		BL exit
42	p_print_string:
43		PUSH {lr}
44		LDR r1, [r0]
45		ADD r2, r0, #4
46		LDR r0, =msg_1
47		ADD r0, r0, #4
48		BL printf
49		MOV r0, #0
50		BL fflush
51		POP {pc}
52	
===========================================================
-- Finished

