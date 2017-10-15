# Overview

Notes on the COBOL programming languages as it applies to the MVS mainframe environment, with an emphasis on the older compiler versions as found on the **Hecules with TK4-** emulator environment.

# References

* [IBM COBOL for VSE/VME Programming Guide](http://publibz.boulder.ibm.com/cgi-bin/bookmgr_OS390/download/IGYVA002.pdf?DT=20041222113748) - for the IBM OS/370 environment, supporting COBOL 85 Standard
* [Compiler Languages available on Hercules](http://www.jaymoseley.com/hercules/compilers/list_of.htm)

# COBOL Compilers on the **Hercules with TK3-** emulator environment

* **CB545 V2 LVL78 01May1972** - **COBUCG on the JCL EXEC** - and **s/360** pre COBOL 1974 Standard compiler

# COBOL Program Structure

## Page Column Layout

1 thru 6 | 7 | 8 thru 11 | 12 thru 72 | 73 thru 80
---------|---|-----------|------------|-----------
seq numb | C | Area A    | Area B     | Comment

Column 7 is for a special purposes character
* **\*** - Marks the remainder of a line as a comment
* **/** - Printing new line
* **-** - Continuation of the prior line

## Program Divisions

### INDENTIFICATION DIVISION

### ENVIROMENT DIVISION

### DATA DIVISION

### PROCEDURE DIVISION
