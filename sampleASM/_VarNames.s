valid/variables/_VarNames.wacc
calling the reference compiler on valid/variables/_VarNames.wacc
-- Test: _VarNames.wacc

-- Uploaded file: 
---------------------------------------------------------------
# variable can have _ in their names

# Output:
# #empty#

# Exit:
# 19

# Program:

begin
  int an_underscore = 19 ;
  exit an_underscore
end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
_VarNames.s contents are:
===========================================================
0	.text
1	
2	.global main
3	main:
4		PUSH {lr}
5		SUB sp, sp, #4
6		LDR r4, =19
7		STR r4, [sp]
8		LDR r4, [sp]
9		MOV r0, r4
10		BL exit
11		ADD sp, sp, #4
12		LDR r0, =0
13		POP {pc}
14		.ltorg
15	
===========================================================
-- Finished

