valid/basic/exit/exitBasic2.wacc
calling the reference compiler on valid/basic/exit/exitBasic2.wacc
-- Test: exitBasic2.wacc

-- Uploaded file: 
---------------------------------------------------------------
# basic exit statement

# Output:
# #empty#

# Exit:
# 42

# Program:

begin
  exit 42
end
---------------------------------------------------------------

-- Compiler Output:
-- Compiling...
-- Printing Assembly...
exitBasic2.s contents are:
===========================================================
0	.text
1	
2	.global main
3	main:
4		PUSH {lr}
5		LDR r4, =42
6		MOV r0, r4
7		BL exit
8		LDR r0, =0
9		POP {pc}
10		.ltorg
11	
===========================================================
-- Finished

