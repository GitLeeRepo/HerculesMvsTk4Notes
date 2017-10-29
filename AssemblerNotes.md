# Overview

Notes on System/370 assembly language

# References

* [s/370 Assembler Tutorial](http://cbttape.org/~jmorrison/s370asm/html/tut-mvs-001.html)

# Terminology

* **CSECT** - Control Section.  Instructions in this section are allocated memory.  It is a relocatable module that can be link edited and executed.  Refer to **DSECT**.
* **DSECT** - Dummy Section.  Describes memory but doesn't allocated it. Refer to **CSECT**.

# Format of Assembly Language Program

Format   | Name  | Operation | Operands and commends | Continuation Field       
---------|-------|-----------|-----------------------|--------------------
Position | 1-8   | 10-14     | 16-71                 | 72

* **Name** - the symbolic names used for references
* **Operation** - the **mnemonic opration code**, which are the assembly language and compiler instructions
* **Operands** - the operands used by the **Operation** instructions
* **Comments** - any comments must follow the Operand with at least one space in between
* **Continuation** - indicates the instruction is continued on the next line

# Instruction Set

## Instruction Set Overview

The Assesmbly language instruction set goes in the **Operation** column, they can be broken down into four groups:

* Data movement instructions
* Arithmetic instructions
* Logical instructions
* Input/output instructions

## Data Movement Instructions

* **MVC** - Move Character.  Moves data from the second operand to the first.  Ex., `MVC   op1,op2`
* **MVI** - Move Immediate. Moves a byte into storage
* **ED** - Edit. Used to change numeric data in a **packed decimal** prior to printing it.  Uses patterns to do such things as suppress leading zeros
* **PACK** - Converts EBCDIC into packed decimal or binary.
* **UNPK** - Unpack.  Converts packed decimal into EBCDIC

# Arithmetic Instructions

In a business environment most arithmetic is done using **packed decimal** fields rather than **binary** numbers since the conversion is simpler.  The five basic decimal instructions are **add, subtract, multiply, divide, and zero-and-add**.

* **AP** - Add decimal.  The operand 2 is added to operand 1 with the result stored in operand 1.  Ex., `AP     op1,op2`
* **SP** - Subtract decimal.  Operand 2  is subtracted from operand 1 with the result stored in operand 1.  Ex., `SP    op1,op2`
* **MP** - Multiply decimal - Operand 1 and 2 are multiplied with the result placed in operand 1. Ex., `MP    op1,op2`
* **DP** - Divide decimal - Operand 2 (the divisor) is divided into Operand 1 (the dividend) with the result being placed into Operand 1.  This result contains both the quotient and the remainder.  The remainder is in the right most bytes of operand 1 (which can be up to 16 bytes).  The remainder is alway the same size as the divisor in operand 2 which can be up to 8 bytes long.
* **ZAP** - Zero-and-add.  Operand 1 is zeroed out, and then operand 2 is added to it.




* **


