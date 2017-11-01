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
* **Operation** - a specific instruction set instruction (machine and macro instructions, and assembler commands)
* **Operands** - the operands used by the **Operation** instructions
* **Comments** - any comments must follow the Operand with at least one space in between
* **Continuation** - indicates the instruction is continued on the next line

# Instruction Set

## Instruction Set Overview

The instruction set listed here consists of the following types of instructins:
* Machine Instructions (nemonic) - translates directly to machines code using a mnemonic name (easy to remember name)
* Macro Instruction - an instruction which represents multiple individual Machine Instructions to accomplish a task
* Assembler Command (Directive) - provides the assembler with processing instructions, but doesn't get allocated in the object code

The instructions are placed in the **Operation** column, they can be broken down into four primary groups:

* Data movement and storage instructions
* Arithmetic instructions
* Logical instructions
* Input/output instructions

Along with a few miscellaneous instructions that don't clearly fall in the above groups

## Data Movement and Storage Instructions
* **DS** - Define Storage.  Used in a **Data Definition** section to define a data storage area that can be referenced by a symbolic label.  Used in conjunction with **Type Code** operands that define the type of data stored at the location.
* **DC** - Define Constant.  Used in a **Data Definition** section to define an area in the object code for a constant value that can be referenced by a symbolic label.  Used in conjunction with **Type Code** operands that define the type of the constant, along with the constant itself.
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
* **Branch Instructions:**
  * **B** - Unconditional Branch
  * **BH** - Branch on operand 1 being higher than operand 2.  Used after a compare instruction.
  * **BL** - Branch on operand 1 being lower than operand 2.  Used after a compare instruction.
  * **BE** - Branch on operand 1 and operand 2 being equal.  Used after a compare instruction.
  * **BNH** - Branch on operand 1 NOT being higher than operand 2.  Used after a compare instruction.
  * **BNL** - Branch on operand 1 NOT being lower than operand 2.  Used after a compare instruction.
  * **BNE** - Branch on operand 1 and operand 2 NOT being equal.  Used after a compare instruction.
  * **BO** - Branch on overflow.  Used after an arithmetic instruction.
  * **BP** - Branch on plus.  Used after an arithmetic instruction.
  * **BM** - Branch on minus.  Used after an arithmetic instruction.  
  * **BZ** - Branch on zero.  Used after an arithmetic instruction.
  * **BNP** - Branch on not plus.  Used after an arithmetic instruction.
  * **BNM** - Branch on not minus.  Used after an arithmetic instruction. 
  * **BNZ** - Branch on not zero.  Used after an arithmetic instruction.
  * **BC** - Branch-on-condition.  Uses a **mask** in bits 8-11 to compare to the condition code.  If it matches the condition code it branches to the address in bits 12-31, otherwise it continues with the next instruction.  If the prior **CP** compares two equal operands it will have **condition code** bits **1000** so if the mask is also **1000** (testing for equality) it will branch.  If operand 1 is less than operand 2 it will have a **condition code** **0100** so it will need an equivellent mask if branching is desired in this case.  If less than or equal is what is desired for the comparison the the mask would be **1100** or **1010** for operand 1 being greater than or equal to operand 2.
  * **BALR** - Branch-and-link-register.  A two byte instruction that places the address of the next instruction in the first register specified and then branches to the address of the second register specified. This allows control to return to the next statement after the branch has completed its instructions. There are also cases when the second register is set to zero and no branch takes place.
  
## I/O Instructions

I/O instructions are not handled directly by the user program, but instead delegated to the MVS Supervisor Program (through macros).  During read operations the data is stored in a designated **input area**.  Data that is to be output (printer, disk, etc) is stored in an **output area**.  Numeric output data must be first converted to EBCDIC.

**Macro Instruction**

* **OPEN** - format: **OPEN (DCBName, option, DCBName, option,...)** with the DCBName being the Symbolic Reference name for a DCB Statement that defines the data set.
* **GET** - reads a record from a data set.  Format: **GET DCBName, WorkArea)** with the DCBName being the Symbolic Reference name for a DCB Statement that defines the data set, and the optional WorkArea for the data to be stored in.  It is optional in that you can use either the programs own work area (in which you want to specify it here) or the MVS buffer area provided by the Supervisor program (in which case you don't need to specify a work area here).  This is determined by **MACRF** parameter on the **DCB** definition.  **MACRF=GM** indicates the buffer should be **moved** to the designated work area in the user program for the **GET** operation, while **MACRF=GL** indicates it should use the **local** MVS Supervisor provided buffer for the **GET** operation.
* **PUT** - writes a record to a data set.  Format: **PUT DCBName, WorkArea)** with the DCBName being the Symbolic Reference name for a DCB Statement that defines the data set, and the optional WorkArea for the data to be stored in.  As with the **GET** operation the work area can either be specified as a user defined symbolic storage area, or ommitted when using a **MVS Supervisor** provided buffer.  As with the **GET** this is specified with the **MACRF** parameter of the **DCB** statement.
* **CLOSE** - format: **CLOSE(DBCName, option, DCBName, option,...)**.  Closes the data sets that were opened for input and/or output.  The option (Input, Output) can be ommitted but a placeholder comma must be included if it is not the last one specified, **CLOSE(MyDataset,,PrtOut)** for example.
**DCB** - Data Control Block (record formats, record lengths, block sizes, data set names). For example:
```
INVMAST  DCB   DSORG=PS,RECFM=F,MACRF=GM,BLKSIZE=50,LRECL=50,          X
               DDNAME=INVMAST,EODAD=INVEOF
```
The **MACRF=GM** specifies this is for a **GET** operation in which the record buffer is **moved** into a defined program buffer.

## Miscellaneous Instructions

* **START** - an assembler command that signals the where the start of the object code should begin.  **START 0** tells the assembler to use zero as the starting reference point (this is relative since before the program is loaded into memory the actual starting address is unknown.  The **label name** for the **START** instruction becomes the name of the program.
* **USING** - an assembler command that tells the assembler which register is going to be used as the base address register.  The first operand specifies the address, while the second operand specifies the register to store this base address.  The starting address is usually either a label name near the start of the program, or an astricks which signals starting now (which would be the address of the following statement since the **USING** assembler command is just a directive without any storage location in the object code.

# Memory Storage through Symbolic Names

Specifies labels that are external symbols (can be referenced external to the program, by the link editor), along with the **type codes** of data stored there (EBCDIC characters, packed decimals, zoned decimals, etc)

## Type Codes

Type codes are part of the **operand** for **DS** and **DC** statements which consists of 3 parts: 1) the repeat factor; 2) the type code itself; 3) the length modifier.  The **type code** consists of:

* **A** - **Address**.  For example, **A(MYNAME)** returns the address of the storage for symbol MYNAME
* **B** - **Binary** data, for example B'11111111', which is decimal 255.
* **C** - **Character set** data (EBCDIC, ASCII) of a specified link, **CL20** for example, which specifies a 20 byte character string
* **P** - **Packed Decimal** data of a specified length, **PL3** for example, which specifies a 3 byte packed decimal
* **Z** - **Zone Decimal** data of a specified length, **PL5** for example, which specified a 5 byte zoned decimal
* **H** - **Halfword** which is not followed by a length since a halfword is always 2 bytes, although it can be proceeded by a repeat factor indicating the number of fullwords desired **6H** for examble
* **F** - **Fullword** which is not followed by a length since a fullword is always 4 bytes, although it can be proceeded by a repeat factor indicating the number of fullwords desired **18F** for examble
* **X** - **Hexadecimal** - a **Hexadecimal** value in which two hex numbers are stored as one byte
* **E** - Floating Point
* **D** - Floating Point
* **L** - Floating Point
* **Y** - Address
* **S** - Address
* **V** - Address
* **Q** - Address

* Each of the above can be preceeded by a repeat factor indicating how many times that allocation unit should be repeated, **5P3** would indicate a 3 byte packed decimal shoud be repeated 5 times in memory storage.  When it is ommitted it is implied to be a repeat factor of one.

A **repeat factor of zero** is used to indicate an overall buffer that is followed by the declaration of individual symbolic names that make up that buffer.  For example,

```
INPUTAR  DS    0CL20     
FIELD1   DS    CL5  
FIELD2   DS    CL10   
FIELD3   DS    CL5
```
Defines an input area 20 bytes long that is divided into 3 fields, which total 20 types.  This way the overall input area can be referenced, or the individual fields can be referenced.

# Program Initialization and Termination

Here is a typical set of **intialization** instructions at the start of every program that is used to save the registers of the calling program (typically the MVS Supervisor program), and the base address of the current program.

```
PROGNAME START 0     
BEGIN    SAVE  (14,12)                   Save registers 0-12 and 14-15                
         BALR  3,0                       Store the         
         USING *,3                          Base address of Program (zero)
         ST    13,SAVE+4                 Store the calling programs registers, along with...
         LA    13,SAVE                   the current programs registers in the SAVE area
```

The saved registers of the calling program are restored prior to the program exiting:

```
         L     13,SAVE+4        
         RETURN (14,12),RC=0
```

