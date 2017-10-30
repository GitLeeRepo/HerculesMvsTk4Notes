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

## Arithmetic Instructions

In a business environment most arithmetic is done using **packed decimal** fields rather than **binary** numbers since the conversion is simpler.  The five basic decimal instructions are **add, subtract, multiply, divide, and zero-and-add**.

* **AP** - Add decimal.  The operand 2 is added to operand 1 with the result stored in operand 1.  Ex., `AP     op1,op2`
* **SP** - Subtract decimal.  Operand 2  is subtracted from operand 1 with the result stored in operand 1.  Ex., `SP    op1,op2`
* **MP** - Multiply decimal - Operand 1 and 2 are multiplied with the result placed in operand 1. Ex., `MP    op1,op2`
* **DP** - Divide decimal - Operand 2 (the divisor) is divided into Operand 1 (the dividend) with the result being placed into Operand 1.  This result contains both the quotient and the remainder.  The remainder is in the right most bytes of operand 1 (which can be up to 16 bytes).  The remainder is alway the same size as the divisor in operand 2 which can be up to 8 bytes long.
* **ZAP** - Zero-and-add.  Operand 1 is zeroed out, and then operand 2 is added to it.

## Logical Instructions

* **CP** - Compare decimal.  Two decimal fields are compared.  It uses 4 bits in the CPU to store the results so the branch instruction that follows it can know what to do.  If bit 0 is on they are equal, if bit 1 is on operand 1 is less than operand 2, if bit 2 is on operand 1 is greater than operand 2.  Bit 3 isn't used for this instruction.
* **BC** - Branch-on-condition.  Uses a **mask** in bits 8-11 to compare to the condition code.  If it matches the condition code it branches to the address in bits 12-31, otherwise it continues with the next instruction.  If the prior **CP** compares two equal operands it will have **condition code** bits **1000** so if the mask is also **1000** (testing for equality) it will branch.  If operand 1 is less than operand 2 it will have a **condition code** **0100** so it will need an equivellent mask if branching is desired in this case.  If less than or equal is what is desired for the comparison the the mask would be **1100** or **1010** for operand 1 being greater than or equal to operand 2.
* **BALR** - Branch-and-link-register.  A two byte instruction that places the address of the next instruction in the first register specified and then branches to the address of the second register specified. This allows control to return to the next statement after the branch has completed its instructions. There are also cases when the second register is set to zero and no branch takes place.

## I/O Instructions

I/O instructions are not handled directly by the user program, but instead delegated to the MVS Supervisor Program.  During read operations the data is stored in a designated **input area**.  Data that is to be output (printer, disk, etc) is stored in an **output area**.  Numeric output data must be first converted to EBCDIC.

# Program Housekeeping

Here is a typical set of housekeeping instructions to save the registers of the calling program, and the base address of the current program.

```
PROGNAME START 0     
BEGIN    SAVE  (14,12)                   Save registers 0-12 and 14-15                
         BALR  3,0                       Store the         
         USING *,3                          Base address of Program (zero)
         ST    13,SAVE+4                 Store the calling programs registers, along with...
         LA    13,SAVE                   the current programs registers in the SAVE area
```



