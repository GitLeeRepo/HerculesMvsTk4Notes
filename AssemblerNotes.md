# Overview

Notes on System/370 assembly language

# References

* [s/370 Assembler Tutorial](http://cbttape.org/~jmorrison/s370asm/html/tut-mvs-001.html)

# Terminology and Concepts

* **\*** - References the address of the current instruction.  Example, **USING \*,3** load the current line as the location for the base register (since USING is an assembler directive it isn't in memory so it is the following statement that is used).
* **=** - Used to specify a literal, for example **AP LINECNT,=P'1'** adds 1 to LINECNT
* **Base/Displacement Addressing** - relocateable addressing is achieved the the use of a base address (usually the address where the program begins) being stored in a **Base Register** and added to a **Displacement** value to address a particular memory location.  The displacement is the number of bytes distance from the base address in the base register.  It is often the symbolic address label that is used to reference the memory location, but it can also be a literal value such as **8** meaning an 8 byte displacement.  It can also be a combination of both as in **ST 13,SAVE+4** which uses both a symbolic name **SAVE** and a literal **4**.  On Sys/370 **displacement** values are 12 bit for specifying up to a 4,096 displacement.  Multiple base addresses/registers can be specified to extend the amount of memory that can be addressed.  Later versions of the OS extended this to 20-bit displacement offsets.
* **Base Address/Register** - refer to **Base/Displacement Addressing**
* **CSECT** - Control Section.  Instructions in this section are allocated memory.  It is a relocatable module that can be link edited and executed. This is where your typical execution type instructions go (**MVC**, **AP**, **B**, etc). Refer to **DSECT**.
* **DSECT** - Dummy Section.  Describes memory but doesn't allocated it. These are the **DS** and **DC** type of operations. Refer to **CSECT**.
* **Displacement** - Refer to the **Base/Displacement Addressing** entry.
* **Field** - An area of memory that contains one item.  It is referenced by the left most postion of its memory location, along with a length.
* **Immediate** - a byte constant that is part of the instruction itself.  For example, **MVI MYCHAR,C'A'** the immediate value 'A' is move to the memory location identified by MYCHAR.
* **Opcode** - the machine level instruction code or the mnemonic that represents it.
* **Relative Addresses** - addresses relative to another address such as, **ST 13,SAVE+4** where the **SAVE+4** is specifying a relative address.
* **Subfield** - when refering to an operand subfield they must be enclosed in parenthesis.  When there are multiple subfields they must be separated by commas within the parenthesis.  Subfields in operands can be used to specify explicit lengths, for example **MVC MYFIELD(80),OTHER** will move in 80 characters, even if MYFIELD is declared as 120 characters.  The term subfield is also used to refer to the components of a **DS** or **DC** type definition (the repeat factor, the type code, the qualifier, etc).  In this case the parenthesis are not used.

# Format of Assembly Language Program

Format   | Name  | Operation | Operands and commends | Continuation Field       
---------|-------|-----------|-----------------------|--------------------
Position | 1-8   | 10-14     | 16-71                 | 72

* **Name** - the symbolic names used for references
* **Operation** - a specific instruction (machine instruction mnemonic, macro instruction, or assembler command)
* **Operands** - the operands used by the **Operation** instructions
* **Comments** - any comments must follow the Operand with at least one space in between
* **Continuation** - indicates the instruction is continued on the next line

# Registers

* The **General Purpose Registers** are numbered 0 through 15.
* Registers 0, 2, 4, and 6 are used for floating point operations
* Even number registers must be used for double-shift instructions, fullword multiply and divide, move long and compare logical instructions. The odd number register that follows is used as part of the operation.
* **Base Registers** hold the base address used by a program (generally near the start of the program).  They are used, along with a **displacement** value to identify a memory location.  They are specified with the **USING** assembler directive.  Registers 0-3 are not suitable for base registers.  Register 3-13, and 15 are generally suitable for base registers.  Multiple base registers can be specified.
* For **LM** (load multiple registers) and **STM** (store multiple registers) two registers are specified, in which those two registers and any registers between them are used for the operation.
* The **control program** of the system/370 uses registers 0, 1, 13, 14, and 15
* **Register 0** is a special case in that when **0** (zero) is specified for an Index or Base register, it means no Index or Base register is used.  In the case of **branch** statements it means don't branch.
* The **Index Register** is rarely used, even though the **RX** format type instructions refer to them.  They are normally ommitted or set to zero.  When they are used they are used in the same way an index in an array is used in other languages.

## Explicit Base Registers and Displacement Addressing

You can specify a relocatable address by using the address of the base register in addition to the displacement from that address to specify another address location (typically identified with a symbolic name.  The are a number of different formats that are used that a dependent on the format type of the instructions (RR, RX, RS, SS, SI, etc).  One example format is **D(L,B)** where D=Displacement, L=length, and B=Base Register.

* **PACK 0(3,6),0(3,6)** specifies a displacement of zero to pack a 3 byte field at the address in base register 6 (since there was zero displacement) in both operands 1 and 2.
* **AP WKLYHRS,5(3,6)** has a displacement of 5 from the address at base register 6 with a length of 3.

There are other formats which can be used, with the format used being dependent on the instructions format type (RR, RX, RS, SS, SI, etc).  The **RX** format use Index Registers in addition to or in place of Base Registers, using the format is **D(X,B)** where D=Displacement, X=Index Register, and B=Base Register.  It is typical to specify zero for the index register.

* **A 4,8(0,5)** - has a displacement of 8 from the address in base register 5.  The index is zero
* **A 4,8(,5)** - same as the above.  By not specifying the Index Register it is the same as setting it to zero.
* **A 4,8(5)** - here 5 is the index register, not the base register.  You don't need the comma when the last item is excluded.

In **Implicit Addressing** the subfield qualifiers can be ommitted and a default will be assumed.  For example **SS** (storage-storage) instructions have a format of **OpCode D1(L1,B1),D2(L2,B2)** the subfields can be ommitted **OpCode D1,D2** with the base address being provided by the assembler (if multiple base register addresses are used, the one with the smallest offset is assume) .  For Example, **MVC PRTPRICE,INPRICE**  Or you can specify some, but not all of the subfields as in **MVC PRTDESCR(50),INDESCR** which includes the length in the first operand, but doesn't include the base register, and the second operand doesn't specify either.  For every symoblic label defined in a program the assembler tracks its length, which is why it knows what to use when it is not specified.

### Explicit Operand Formats based on Instruction Type

Type | Operand Format
-----|------------------------------
RR   | Operation R1,R2
RR   | Operation M1,R2
RX   | Operation R1,D2(X2,B2)
RX   | Operation M1,D2(X2,B2)
RS   | Operation R1,R3,D2(B2)
RS   | Operation R1,M3,D2(B2)
SI   | Operation D1(L1,B2),I2
SS   | Operation D1(L1,B1),D2(L2,B2)

Where R-Register, S=Storage, D=Displacement, L=length, B=Base Register, X=Index Register, I=Immediate, and M=Mask


# Instruction Set

## Instruction Set Overview

The instruction set listed here consists of the following types of instructins:
* Machine Instructions (nemonic) - translates directly to machines code using a mnemonic name (easy to remember name)
* Macro Instruction - an instruction which represents multiple individual Machine Instructions to accomplish a task
* Assembler Command (Directive) - provides the assembler with processing instructions, but doesn't get allocated in the object code

At the byte and bit level **machine instructions** are either two, four, or six bytes long.  The first 8 bits consists of the opcode itself (the binary identifier that is represented by mnemonic instructions such as MVC, B, AP, etc.).  The remaining bits are for the operands (8 remain for two byte instructions, 24 bits remain for operands in four byte instructions, and 40 bits remain for operands in six byte instructions.  So for **RR** (register to register) instructions, the general register number itself is represent by 4 bits (16 for 16 GP registers), and since two registers are specified that is a total of 8 bits, which when added to the 8 bits of the opcode shows why this is a two byte instruction.

Using an **RX** type of instruction, which has a format of **OpCode RX R1,D2(X2,B2)**, as an example of a four byte instruction, the opcode uses 8 bits, R1 uses 4 bits, D2 uses 12bits, X2 uses 4 bits, and B2 use 4 bits, for a total of the 32 bits in a four byte instruction.

The instructions (whether the machine mnemonic, macro, or assembler directives) are placed in the **Operation** column in the source file.  These instructions can be broken down into four primary groups:

* Data movement and storage instructions
* Arithmetic instructions
* Logical instructions
* Input/output instructions

Along with a few miscellaneous instructions that don't clearly fall in the above groups

In most operations the **second operand** is moved/added/subtracted/etc into the **first operand** where the result is stored.

## Data Movement and Storage Instructions

Key for **Operands** below (R=Register; D=Displacement from Base Register address; L=Length; B=Base Register; X=Index Register; I=Immediate Instruction; and M=Mask.

Operator   | Description                                                          | Format   | Operands
-----------|----------------------------------------------------------------------|----------|--------------------
**DC**     | Define Constant.  Used in a **Data Definition** section to define an area in the object code for a constant value that can be referenced by a symbolic label.  Used in conjunction with **Type Code** operands that define the type of the constant, along with the constant itself. | AsmDir |N/A
**DS**     | Define Storage.  Used in a **Data Definition** section to define a data storage area that can be referenced by a symbolic label.  Used in conjunction with **Type Code** operands that define the type of data stored at the location. | AsmDir | N/A
**ED**     | Edit. Used to change numeric data in a **packed decimal** prior to printing it.  Uses patterns to do such things as suppress leading zeros.  Some of the Hex patterns include: 20=digit selector; 21=start significant; 22=field separater; 40=blank; 4B=period; 5B=dolar sign; 5C=astrisk; 6B=comma | SS | D1(L1,B1),D2(B2)
**L**      | Load | RX | R1,D2(X2,B2)
**LA**     | Load Address. | RX | R1,D2(X2,B2)
**MVC**    | Move Character.  Moves data from the second operand to the first.  Ex., `MVC   op1,op2` | SS | D1(L1,B1),D2(B2)
**MVI**    | Move Immediate. Moves a byte into storage | SI | D1(B1),I2 
**PACK**   | Converts EBCDIC into packed decimal or binary. | SS | D1(L1,B1),D2(L2,B2)
**RETURN** | Macro that restores the specified registers for the calling program and returns to the calling program.  Example, **RETURN (14,12)** restores registers 0-12, and 14-15. | Macro | N/A
**ST**     | Store | RX | R1,D2(X2,B2)
**UNPK**   | Unpack.  Converts packed decimal into EBCDIC   | SS | D1(L1,B1),D2(L2,B2)

## Arithmetic Instructions

In a business environment most arithmetic is done using **packed decimal** fields rather than **binary** numbers since the conversion is simpler.  The five basic decimal instructions are **add, subtract, multiply, divide, and zero-and-add**.

Operator   | Description                                                          | Format   | Operands
-----------|----------------------------------------------------------------------|----------|--------------------
**AP**     | Add decimal.  The operand 2 is added to operand 1 with the result stored in operand 1.  Ex., `AP     op1,op2` | SS | D1(L1,B1),D2(L2,B2)
**DP**     | Divide decimal - Operand 2 (the divisor) is divided into Operand 1 (the dividend) with the result being placed into Operand 1.  This result contains both the quotient and the remainder.  The remainder is in the right most bytes of operand 1 (which can be up to 16 bytes).  The remainder is alway the same size as the divisor in operand 2 which can be up to 8 bytes long. | SS | D1(L1,B1),D2(L2,B2)
**MP**     | Multiply decimal - Operand 1 and 2 are multiplied with the result placed in operand 1. Ex., `MP    op1,op2` | SS | D1(L1,B1),D2(L2,B2)
**SP**     | Subtract decimal.  Operand 2  is subtracted from operand 1 with the result stored in operand 1.  Ex., `SP    op1,op2` | SS | D1(L1,B1),D2(L2,B2)
**ZAP**    | Zero-and-add.  Operand 1 is zeroed out, and then operand 2 is added to it. | SS | D1(L1,B1),D2(L2,B2)


## Logical Instructions

Operator   | Description                                                          | Format   | Operands
-----------|----------------------------------------------------------------------|----------|--------------------
**B**      | Unconditional Branch | RX/RR | R1,D2(X2,B2)
**BALR**    | Branch-and-link-register.  A two byte instruction that places the address of the next instruction in the first register specified and then branches to the address of the second register specified. This allows control to return to the next statement after the branch has completed its instructions. There are also cases when the second register is set to zero and no branch takes place. | RR | R1,R2
**BC**     | Branch-on-condition.  Uses a **mask** in bits 8-11 to compare to the condition code.  If it matches the condition code it branches to the address in bits 12-31, otherwise it continues with the next instruction.  If the prior **CP** compares two equal operands it will have **condition code** bits **1000** so if the mask is also **1000** (testing for equality) it will branch.  If operand 1 is less than operand 2 it will have a **condition code** **0100** so it will need an equivellent mask if branching is desired in this case.  If less than or equal is what is desired for the comparison the the mask would be **1100** or **1010** for operand 1 being greater than or equal to operand 2. | SS | M1,D2(X2,B2)
**BE**     | Branch on operand 1 and operand 2 being equal.  Used after a compare instruction. | RX/RR | R1,D2(X2,B2)
**BH**     | Branch on operand 1 being higher than operand 2.  Used after a compare instruction. | RX/RR | R1,D2(X2,B2)
**BL**     | Branch on operand 1 being lower than operand 2.  Used after a compare instruction. | RX/RR | R1,D2(X2,B2)
**BM**     | Branch on minus.  Used after an arithmetic instruction. | RX/RR | R1,D2(X2,B2) 
**BNE**    | Branch on operand 1 and operand 2 NOT being equal.  Used after a compare instruction. | RX/RR | R1,D2(X2,B2)
**BNH**    | Branch on operand 1 NOT being higher than operand 2.  Used after a compare instruction. | RX/RR | R1,D2(X2,B2)
**BNL**    | Branch on operand 1 NOT being lower than operand 2.  Used after a compare instruction. | RX/RR | R1,D2(X2,B2)
**BNP**    | Branch on not plus.  Used after an arithmetic instruction. | RX/RR | R1,D2(X2,B2)
**BNM**    | Branch on not minus.  Used after an arithmetic instruction. | RX/RR | R1,D2(X2,B2)
**BNZ**    | Branch on not zero.  Used after an arithmetic instruction. | RX/RR | R1,D2(X2,B2)
**BO**     | Branch on overflow.  Used after an arithmetic instruction. | RX/RR | R1,D2(X2,B2)
**BP**     | Branch on plus.  Used after an arithmetic instruction. | RX/RR | R1,D2(X2,B2)
**BZ**     | Branch on zero.  Used after an arithmetic instruction. | RX/RR | R1,D2(X2,B2)
**CP**     | Compare decimal.  Two decimal fields are compared.  It uses 4 bits in the CPU to store the results so the branch instruction that follows it can know what to do.  If bit 0 is on they are equal, if bit 1 is on operand 1 is less than operand 2, if bit 2 is on operand 1 is greater than operand 2.  Bit 3 isn't used for this instruction. | SS | D1(L1,B1),D2(L2,B2)

  
Note: For the Branch Commands with the RX/RR format, only the RX format is shown.  The RR format for these is R1,R2.

## I/O Instructions

I/O instructions are not handled directly by the user program, but instead delegated to the MVS Supervisor Program (through macros).  During read operations the data is stored in a designated **input area**.  Data that is to be output (printer, disk, etc) is stored in an **output area**.  Numeric output data must be first converted to EBCDIC.

**Macro Instruction**

Operator   | Description                                                          | Format  | Operands
-----------|----------------------------------------------------------------------|---------|--------------------
**CLOSE**  | format: **CLOSE(DBCName, option, DCBName, option,...)**.  Closes the data sets that were opened for input and/or output.  The option (Input, Output) can be ommitted but a placeholder comma must be included if it is not the last one specified, **CLOSE(MyDataset,,PrtOut)** for example. | Macro | N/A
**DCB**    | Data Control Block (record formats, record lengths, block sizes, data set names). For example: `INVMAST  DCB DSORG=PS,RECFM=F,MACRF=GM,BLKSIZE=50,LRECL=50, DDNAME=INVMAST,EODAD=INVEOF'.  The **MACRF=GM** specifies this is for a **GET** operation in which the record buffer is **moved** into a defined program buffer. | Macro | N/A
**GET**    | reads a record from a data set.  Format: **GET DCBName, WorkArea)** with the DCBName being the Symbolic Reference name for a DCB Statement that defines the data set, and the optional WorkArea for the data to be stored in.  It is optional in that you can use either the programs own work area (in which you want to specify it here) or the MVS buffer area provided by the Supervisor program (in which case you don't need to specify a work area here).  This is determined by **MACRF** parameter on the **DCB** definition.  **MACRF=GM** indicates the buffer should be **moved** to the designated work area in the user program for the **GET** operation, while **MACRF=GL** indicates it should use the **local** MVS Supervisor provided buffer for the **GET** operation. | Macro | N/A
**OPEN**   | format: **OPEN (DCBName, option, DCBName, option,...)** with the DCBName being the Symbolic Reference name for a DCB Statement that defines the data set. | Macro |N/A
**PUT**   | writes a record to a data set.  Format: **PUT DCBName, WorkArea)** with the DCBName being the Symbolic Reference name for a DCB Statement that defines the data set, and the optional WorkArea for the data to be stored in.  As with the **GET** operation the work area can either be specified as a user defined symbolic storage area, or ommitted when using a **MVS Supervisor** provided buffer.  As with the **GET** this is specified with the **MACRF** parameter of the **DCB** statement. | Macro | N/A

## Miscellaneous Instructions

* **END** - End assembly
* **START** - an assembler command that signals the where the start of the object code should begin.  **START 0** tells the assembler to use zero as the starting reference point (this is relative since before the program is loaded into memory the actual starting address is unknown.  The **label name** for the **START** instruction becomes the name of the program.
* **USING** - an assembler command that tells the assembler which register is going to be used as the base address register.  The first operand specifies the address, while the second operand specifies the register to store this base address.  The starting address is usually either a label name near the start of the program, or an astricks which signals starting now (which would be the address of the following statement since the **USING** assembler command is just a directive without any storage location in the object code.

# Machine Code Format Types

* **RR** - Register-Register (2 byte) instructions - **R1,R2**, with another variation using a mask **M1,R2** for **BCR** branch on condition operations
* **RX** - Register-Index (4 byte) instructions. a virtual storage to register operations that include a refernce to an Index Register when referencing the storage location **R1,D2(X2,B2)**, with another variation using a mask **M1,D2(X2,B2)** for **BC** branch on condition operations.
* **RS** - Register-Storage (4 byte) instructions.  Uses multiple register and a single storage location **R1,R3,D2(B2)**.  There is also a variation that uses a mask **R1,M3,D2(B2)**.
* **SI** - Storage-Immediate (4 byte) instructions.  Moves immediate byte data (constant that is part of the instruction itself) into virtual storage **D1(L1,B2),I2**
* **S** - used to perform I/O and other system instructions **D2(B2)**
* **SS** - Storage-Storage (6 byte) instructions.  Comes with two varieties of operands: one with a single 8-bit **length** field **D1(L1,B1),D2(B2)** and another with two 4-bit **length** fields **D1(L1,B1),**D2(L2,B2)**.  

Where R=Register, S=Storage, D=Displacement, L=length, B=Base Register, X=Index Register, I=Immediate, and M=Mask

# DCB Definitions

**DCB** - Data Control Block (record formats, record lengths, block sizes, data set names). For example:
```
INVMAST  DCB   DSORG=PS,RECFM=F,MACRF=GM,BLKSIZE=50,LRECL=50,          X
               DDNAME=INVMAST,EODAD=INVEOF
```
The **MACRF=GM** specifies this is for a **GET** operation in which the record buffer is **moved** into a defined program buffer.

# Data Definition

Memory Storage through Symbolic Names

Specifies labels that are external symbols (can be referenced external to the program, by the link editor), along with the **type codes** of data stored there (EBCDIC characters, packed decimals, zoned decimals, etc)


## Type Codes

Type codes are part of the **operand** for **DS** and **DC** statements which consists of 3 parts: 1) the repeat factor; 2) the type code itself; 3) the length modifier.  The **type code** consists of:

* **A** - **Address**.  Normally a fullword.  For example, **A(MYNAME)** returns the address of the storage for symbol MYNAME
* **B** - **Binary** data, for example B'11111111', which is decimal 255.
* **C** - **Character set** data (EBCDIC, ASCII) of a specified link, **CL20** for example, which specifies a 20 byte character string
* **P** - **Packed Decimal** data of a specified length, **PL3** for example, which specifies a 3 byte packed decimal
* **Z** - **Zone Decimal** data of a specified length, **PL5** for example, which specified a 5 byte zoned decimal
* **H** - **Halfword** a signed fix point binary value with a length of 2 bytes.  Typically not followed by a length, but may be proceeded by a repeat factor, **6H** for examble.
* **F** - **Fullword** a signed fix point binary value with a length of 4 bytes.  Typically not followed by a length, but may be proceeded by a repeat factor, **18F** for examble.
* **X** - **Hexadecimal** - a **Hexadecimal** value in which two hex numbers are stored as one byte
* **E** - Short Floating Point.  Normally a fullword
* **D** - Long Floating Point.  Normally a doubleword (two fullwords)
* **L** - Extended Floating Point.  Normally two doublewords (four fullwords).
* **Y** - Address.  Normally a halfword
* **S** - Address.  Base register and displacement value.  Normally a halfword
* **V** - Address.  Space reserved for external symbol.  Normally a fullword
* **Q** - Address. Space reserved for external dummy section offset

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

