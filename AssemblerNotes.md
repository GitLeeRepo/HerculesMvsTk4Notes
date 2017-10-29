# Overview

Notes on System/370 assembly language

# References

* [s/370 Assembler Tutorial](http://cbttape.org/~jmorrison/s370asm/html/tut-mvs-001.html)

# Terminology

* **CSECT** - Control Section.  Instructions in this section are allocated memory.  It is a relocatable module that can be link edited and executed.  Refer to **DSECT**.
* **DSECT** - Dummy Section.  Describes memory but doesn't allocated it. Refer to **CSECT**.

# Format of Assembly Language Program

Format   |Name  | Operation | Operands and commends | Continuation Field
---------|------|-----------|-----------------------|--------------------
Position | 1-8  | 10-14     | 16-71                 | 72

# Instruction Set

## Instruction Set Overview

Instruction sets are broken down into four groups:

* Data movement instructions
* Arithmetic instructions
* Logical instructions
* Input/output instructions

## Data Movement Instructions

* **MVC** - Move Character.  Moves data from the second operand to the first
