# RISC-V
RISC5 data ( reference , source code , simulator runs ) 
  Iterative_multiplication.c : .c - Source code of performing multiplication iteratively 
  mul_iter.s : Assembly of iteratively multiplication of two numbers , a0 and s1 will contain results of the operands
  addi    a1, zero, 10  -- edit instruction to change the input values to desired ones and test it !
  addi    a1, zero, 20
  mul_recursive.s : Assembly of recursively multiplication of two numbers , a0 and s1 will contain results of the operands
  addi    a1, zero, 10  -- edit instruction to change the input values to desired ones and test it !
  addi    a1, zero, 20
  Recursive_multiplication.c : .c - Source code of performing multiplication recursively 

Use PIN for linux only !
Clone my project 
Go to root of PIN , and give it 777 access otherwise it wont be able to run some commands swiftly . 
Then it works as expected . 

Important PIN api reference : https://software.intel.com/sites/landingpage/pintool/docs/97998/Pin/html/group__INS__BASIC__API__GEN__IA32.html#ga3fdb434cd56a5b72be15dd0931a2b19c
