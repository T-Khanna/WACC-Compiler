valid/variables/capCharDeclaration.wacc
calling the reference compiler on valid/variables/capCharDeclaration.wacc
-- Test: capCharDeclaration.wacc

-- Uploaded file: 
---------------------------------------------------------------
# simple capital character variable declaration

# Output:
# #empty#

# Program:

begin
  char c = 'M'
end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
capCharDeclaration.s contents are:
===========================================================
0	.text
1	
2	.global main
3	main:
4		PUSH {lr}
5		SUB sp, sp, #1
6		MOV r4, #'M'
7		STRB r4, [sp]
8		ADD sp, sp, #1
9		LDR r0, =0
10		POP {pc}
11		.ltorg
12	
===========================================================
-- Finished

