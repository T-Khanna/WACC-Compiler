valid/variables/stringDeclaration.wacc
calling the reference compiler on valid/variables/stringDeclaration.wacc
-- Test: stringDeclaration.wacc

-- Uploaded file: 
---------------------------------------------------------------
# simple string variable declaration

# Output:
# #empty#

# Program:

begin
  string s = "Hello World!"
end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
stringDeclaration.s contents are:
===========================================================
0	.data
1	
2	msg_0:
3		.word 12
4		.ascii	"Hello World!"
5	
6	.text
7	
8	.global main
9	main:
10		PUSH {lr}
11		SUB sp, sp, #4
12		LDR r4, =msg_0
13		STR r4, [sp]
14		ADD sp, sp, #4
15		LDR r0, =0
16		POP {pc}
17		.ltorg
18	
===========================================================
-- Finished

