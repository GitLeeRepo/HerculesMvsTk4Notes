# Overview

Notes on the COBOL programming languages as it applies to the MVS mainframe environment, with an emphasis on the older compiler versions as found on the **Hecules with TK4-** emulator environment.

# References

* [IBM COBOL for VSE/VME Programming Guide](http://publibz.boulder.ibm.com/cgi-bin/bookmgr_OS390/download/IGYVA002.pdf?DT=20041222113748) - for the IBM OS/370 environment, supporting COBOL 85 Standard
* [Compiler Languages available on Hercules](http://www.jaymoseley.com/hercules/compilers/list_of.htm)
* [COBOL Introduction](https://www.youtube.com/watch?v=DTyKHm92oI4) - YouTube video from which some of these notes came from.
* [Compiling, Linking,Loading](http://www.jaymoseley.com/hercules/compiling/how_to.htm#topic1) - From jaymoseley.com site
* [Another Compile/Link/Load](https://www.wisdomjobs.com/e-university/ibm-mainframe-tutorial-464/compile-link-edit-and-run-jcls-13602.html) - Good overview of the process, with key DD statement labels.

## Info on writing to a Data set

* [Appending Records to an Existing File](https://stackoverflow.com/questions/3226843/append-records-to-an-existing-file)

# COBOL Compilers on the **Hercules with TK3-** emulator environment

* **CB545 V2 LVL78 01May1972** - **COBUCG on the JCL EXEC** - and **s/360** pre COBOL 1974 Standard compiler

# COBOL Program Structure

## Page Column Layout

1 thru 6 | 7 | 8 thru 11 | 12 thru 72 | 73 thru 80
---------|---|-----------|------------|-----------
Seq \#s  | C | Area A    | Area B     | Comment

Column 7 is for a special purposes character
* **\*** - Marks the remainder of a line as a comment
* **/** - Printing new line
* **-** - Continuation of the prior line

**DIVISIONS, SECTIONS, AND PARAGRAPHS** start in Area A.

**SENTENCE, STATEMENT, CLAUSE, WORD, CHARACTER** start in Area B

**SENTENCEs** are made up of **STATEMENTs** and are terminated by **period**.  A SENTENCE can have one STATEMENT or multiple STATEMENTs.  The **period** is referred to as an **implicit scope terminator**.  Prior to **COBOL 75** (the Hercules 3.8 compiler i pre-COBOL 75) the **period** was used to terminate **IF** and **PERFORM** blocks, in addition to terminating statements.  **COBOL 75** introduced **END-IF**, **END-PEFORM** and **END-EVALUATE** **explicit scope terminators**. 

## Program Divisions

### IDENTIFICATION DIVISION

Contains the **PROGRAM-ID** which is mandatory.  It identifies the program name.

Also contains optional AUTHOR, DATE-WRITTEN, DATE-COMPILED, etc.

### ENVIRONMENT DIVISION

* **CONFIGURATION SECTION**
  * **SOURCE-COMPUTER**
  * **OBJECT-COMPUTER**

* **INPUT-OUTPUT SECTION**
  * **FILE-CONTROL**
 
* **I-O SECTION**

### DATA DIVISION

* **FILE SECTION** - Contains the file definitions
* **WORKING-STORAGE SECTION** - Contains the programs variables
* **LINKAGE SECTION** - used to link one program module to another

There a five basic data types in COBOL.  They are defined using the **PICTURE** clause in the FILE and WORKING-STORAGE sections
* **S** - Signed integers
* **9** - Unsigned integers
* **V** - Assumed Decimal, or **.** for an explicit decimal
* **A** - Alphabetic character A-Z
* **X** - Alphanumeric character A-Z, 0-9 and other characters

**PICTURE Examples:**
* **PIC -9(5)** - a 5 digit signed integer.
* **PIC 9(10)** - a 10 digit unsigned integer
* **PIC 9(6)V99** - an implied decimal with 6 digits to the left and 2 to the right.  The actual decimal point isn't stored
* **PIC A(20)** - can hold a 20 character alphabetic string.
* **PIC Z(20)** - can hold a 20 character string with both letters, numbers, and special symbols, such as an email address.

For output (such as reports) you can specify other symbols as part of the **PICTURE**, such as **$**, **+/-**, **,**

* **PIC -9(5)** - proceed negative numbers with a minus sign.
* **PIC 9(6).99** - an explicit decimal is displayed/stored
* **PIC ZZZ,ZZ9** - display the commas in the number.  The **Z** specifies that leading zeros should be suppressed.

Variables can be initialized using a **VALUE** clause

### PROCEDURE DIVISION

Contains the program logic.  There are no specific system define sections here as in the above division, but their can be user defined sections.

