# Overview

Notes on the Job Control Language (JCL)

# References

* Placeholder

# Format of the JOB, EXEC, and DD statements

## General

* Format: //name operation operand comments
* All JCL Code begins with **//** in columns 1 and 2
* The name identifier must begin in column 3
* Their must be at least one space between name, operation, and operand
* The operand may not extend beyone column 71, it must be continued on a new line seperated by commas
* When a statement is extended to the next line, the coninuation should not start before column for, i.e. there should be at least one space between **//** and the continuation so that it is not confused with a name identifier.
* Although not required, it is a common coding standard to start the **JOB**, **EXEC**, and **DD** keywords in column 12.  This allows room for the **//** and 8 character name (which is the max limit) and the required space between the name and the keyword.

### Types of Operand parameters

* **Postional Parameters** - must be in a specific order.  In the case of the JOB statement for example the account information parameter must come before the programmer's name parameter.  `//JOBNAME JOB (AcctInfo), 'Programmer Name'`. Both of these parameters are optional:
  * If the first parameter is ommitted provide a comma //JOBNAME JOB , 'Programmer Name'`
  * The last parameter can be ommitted
  * If all optional parameters are ommitted no comma is needed, just continue with the next statement, which would be the EXEC in this case.
* **Keyword Parameters** - Keyword parmeters consist of a key value pairs and can be in any order.  In the case of the JOB statement it doesn't matter whether **CLASS=A** comes before **CLASSMSG=H**, they can be in any order.  They also don't require commas for missing parameters, but you do need commas to seperate the ones that are provided
  

## JOB Statement

* Contains information to tell **JES2** how to run the job.
* The name parameter is refered to as the JOB Name following standard naming rules (alphanumeric and national chars).  The individual computer centers determines if there are any additional naming conventions.
* Must be at least one space between the JOB Name and the JOB keyword
* Refer to the section above on **Types of Operand Parameters** which uses the JOB statement as an example to distinguish Positional Parameters and Keyword parameters
* The Accounting parameter ( the **(COBOL)** identifier in the example below) is a positonal parameter and must come before the programmer's name if it is provided.  It is optional and may be defined by a particular computer center.  It can also have sub-paramaters seperated by commas, which if provided need to be enclosed in parenthesis.  The example **(COBOL)** account parameter below therefore does not need the parenthesis since it doesn't have sub-parameters, but it is common to see the parenthesis provided anyway.

### Example JOB Statement

```
//PRIMCOB1 JOB (COBOL),
//  'Eratosthenes Sieve',
//  CLASS=A,
//  MSGCLASS=A,
//  REGION=8M,TIME=1440,
//  MSGLEVEL=(1,1)
```
Note the CLASS is used to tell JES2 what to do and is defined by a particular computer center/installation.  In the case of TK4- the CLASS=A in this case tells JES2 to run it immediately.  The MSGCLASS tells JES2 what to do with the output, here **MSGCLASS=A** indicates a particular printer (on Hercules one that writes the output to the prt folder).  To have the system hold the output before printing so it can be reviewed specify **MSGCLASS=H**

Also note that the **Job Name** identifier, in this case **PRIMCOB1** (the name of the program) can be changed to whatever you want.  This is helpful in that this identifier can be used to search for the output in Ubuntu's **prt** directory.  Some programmer use their username plus a unique letter for each run to help find the output.

## The EXEC Statement

* The **Execution Statement** is that section of the JCL that telss JES2 what program to execute.
* The Name identifier for the **EXEC** statement is referred to as the **Step Name**.  You can have multiple **EXEC** statements in a JCL job, each having a unique **Step Name**.
* The **PGM Parameter** is actually a **Positional Parameter** even though it has the **=** associated with a **Keyword** parameter (the **PROC** parameter is the only other example of this exception).  It is positional in the sense that it must be the first parameter provided for the **EXEC** statement

### EXEC Statement Example (with DD Statements)

Note this example also includes the **DD** used by the **EXEC** and will also be referenced in the **DD Statement** section below

This example is a continuation of the example from the same COBOL program used to illustrate the **JOB** statement above.

```
//PRIMES  EXEC COBUCG,
//        PARAM.COB='FLAGW,LOAD,SUPMAP,SIZE=2048K,BUF=1024K'
//COB.SYSPUNCH DD DUMMY
//COB.SYSIN    DD *

... the COBOL source code

/*
//COB.SYSLIB  DD DSNAME=SYS1.COBLIB.DISP=SHR
//GO.SYSOUT   DD SYSOUT=*,DCB=(RECFM=FBA,LRECL=161,BLKSIZE=16100)
//GO.SYSIN    DD *
    2000
/*
```
Note the COBUCG is the COBOL compiler and the **PARAM.COB=** line is the parameters for the compile.  The **COB.SYSIN   DD \*** line is followed by the actual source code to be processed by the compiler.  The COBOL program's input itself commes for a similar **SYSIN DD \*** at the end of the source code (2000 in this case).  It also includes output information on how to format the output

## DD Statement

Note: In order to show the **DD** statements in relation to the **EXEC** statement refer to the **EXEC Statement Example (with DD Statements)** section above for the example code.

* The **DD statements** descript the data used by the program
* The Name identifier is called the **ddname**
* The particular **ddnames** needed depend on the program being executed by the **EXEC** statement

### Common **ddnames** include
* **SYSIN** - used with **DUMMY** and **\*** parameters for program input
* **SYSPRINT** - used with **SYSOUT** parameters
* **SYSUT1** - in the case of IEBGENER it is used with the input data set
* **SYSUT2** - in the case of IEBGENER it is used with the output data set

### DD Statement Parameters

* **SYSOUT** - assigns data to an output class, examples include **SYSOUT=A** and **SYSOUT=\***, with "A" typically indicating the printer, but is defined by the data center.
* **DUMMY** - indicates that this particular data set (identified by the **ddname** should NOT be processed
* **\*** - indicates that the input data immediately follows the **DD** statement, and is referred to a the **input stream data**

### Referencing DD Names in Your Programs

The way the **ddname** is referenced from within a program depends on the language itself. 

To refer to the following SALES **ddname**

```
//SALES     DD ...
```

* In **COBOL**

```
SELECT SALESFILE
  ASSIGN TO UT-S-SALES.
```

* In **Assembler**

```
SALESFILE DCB DDNAME-SALES, ...
```

* In **PL/1**

```
DECLARE SALES FILE ...
```

* **FORTRAN** differs from the others in that it generates it own **ddnames** based on the file number

```
WRITE (6,1000)
```
Will result in a **ddname** of **FT06F001**, requiring this **DD** statement
```
//FT06F001  DD
```
