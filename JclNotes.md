# Overview

Notes on the Job Control Language (JCL)

# References

## IBM Manuals

* [JCL Reference z/OS](https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.1.0/com.ibm.zos.v2r1.ieab600/toc.htm)
* [JCL Users Guide PDF](http://publibz.boulder.ibm.com/epubs/pdf/iea2b560.pdf)
* [JCL User Guide MVS](http://publibz.boulder.ibm.com/cgi-bin/bookmgr_OS390/handheld/Connected/BOOKS/IEA5B506/CCONTENTS?)
* [JCL Reference PDF](http://publibz.boulder.ibm.com/epubs/pdf/iea2b6a0.pdf)
* [JCL Language Reference MVS](http://publibz.boulder.ibm.com/cgi-bin/bookmgr_OS390/handheld/Connected/BOOKS/IEA1B640/CCONTENTS?)
* [The Utilities](https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.1.0/com.ibm.zos.v2r1.idau100/toc.htm)

## YouTube

* [JCL Tutorial](https://www.youtube.com/watch?v=lgg_4lBQHNw) - Good overview with good instructor

## TK3 Site JCL related

* [Adding a User Library](http://www.jaymoseley.com/hercules/faq/mvsfaq04.htm#USER012) - Instructions on adding your own Cataloged JCL library, in addition to SYS1.PROCLIB.  This was for TK3 and the SYS1.PROCLIB(JES2) member has been changed since this version, but this still may provide some ideas on doing this.

## Other Sources

* [Wikipedia JCL](https://en.wikipedia.org/wiki/Job_Control_Language)

# JCL Overview

* JCL can be used to submit **batch** jobs to be run by the **JES2** or **JES3** scheduler.  It must have at least a **JOB** statement and an **EXEC** statement to run a program.  It can have multiple **EXEC** statements in order to run a series of programs.  Most **JCL** also includes several **DD** (Data Definition) statements.  **JCL** instructs its own output to be written to the **JES SPOOL** where it can be printed or if held viewed.

One of the fundamental reasons for **JCL** to is to **virtualize** the data sets used by programs.  The programs don't refer to the data sets directly, but through the **Symbolic References** of the **DDName** label on the **DD** statement.  That was the underlying data set can change, for example **USER1.JCL** in one case and **USER2.JCL** in another, and the program's code doesn't have to account for these differences.  Of course the internal structures of the data sets should be consistent with what the program expects.

# JCL Sequence

It can be helpful to look at JCL as a series of steps the computer goes through to run programs and manager their inputs and outputs.

1. The JCL is submitted and read by JES2/JES3
2. JCL requests a program
3. The program is loaded
4. JCL allocates resources needed by the program
5. Those resources are provided to the loaded program
6. The program writes its output to the JES Spool
7. Results are output (printer, JES Spool held output, job output file) levels of which varies by various JCL parameters

# Creating a JCL Program

You must allocate a data set to contain the JCL, it must have a fixed-block format (RECFM=FB) with a logical record length of 80 (LRECL=80). 

# Format of the JOB, EXEC, and DD statements

## General

* Format: //name operation operand comments
* All JCL Code begins with **//** in columns 1 and 2
* The name identifier must begin in column 3
* Their must be at least one space between name, operation, and operand
* The operand may not extend beyond column 71, it must be continued on a new line separated by commas
* When a statement is extended to the next line, the continuation should not start before column for, i.e. there should be at least one space between **//** and the continuation so that it is not confused with a name identifier.
* Although not required, it is a common coding standard to start the **JOB**, **EXEC**, and **DD** keywords in column 12.  This allows room for the **//** and 8 character name (which is the max limit) and the required space between the name and the keyword.

### Types of Operand parameters

* **Positional Parameters** - must be in a specific order.  In the case of the JOB statement for example the account information parameter must come before the programmer's name parameter.  `//JOBNAME JOB (AcctInfo), 'Programmer Name'`. Both of these parameters are optional:
  * If the first parameter is omitted provide a comma //JOBNAME JOB , 'Programmer Name'`
  * The last parameter can be omitted
  * If all optional parameters are omitted no comma is needed, just continue with the next statement, which would be the EXEC in this case.
* **Keyword Parameters** - Keyword parameters consist of a key value pairs and can be in any order.  In the case of the JOB statement it doesn't matter whether **CLASS=A** comes before **CLASSMSG=H**, they can be in any order.  They also don't require commas for missing parameters, but you do need commas to separate the ones that are provided
  

## JOB Statement

* Contains information to tell **JES2** how to run the job.
* The name parameter is referred to as the JOB Name following standard naming rules (alphanumeric and national chars).  The individual computer centers determines if there are any additional naming conventions.
* Must be at least one space between the JOB Name and the JOB keyword
* Refer to the section above on **Types of Operand Parameters** which uses the JOB statement as an example to distinguish Positional Parameters and Keyword parameters
* The Accounting parameter ( the **(COBOL)** identifier in the example below) is a positional parameter and must come before the programmer's name if it is provided.  It is optional and may be defined by a particular computer center.  It can also have sub-parameters separated by commas, which if provided need to be enclosed in parenthesis.  The example **(COBOL)** account parameter below therefore does not need the parenthesis since it doesn't have sub-parameters, but it is common to see the parenthesis provided anyway.

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

* The **Execution Statement** is that section of the JCL that tells JES2 what program to execute.
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
Note the COBUCG is the COBOL compiler and the **PARAM.COB=** line is the parameters for the compile.  The **COB.SYSIN   DD \*** line is followed by the actual source code to be processed by the compiler.  The COBOL program's input itself comes for a similar **SYSIN DD \*** at the end of the source code (2000 in this case).  It also includes output information on how to format the output

## DD Statement

Note: In order to show the **DD** statements in relation to the **EXEC** statement refer to the **EXEC Statement Example (with DD Statements)** section above for the example code.

* The **DD statements** describes the data used by the program
* The Name identifier is called the **ddname**
* The particular **ddnames** needed depend on the program being executed by the **EXEC** statement

### Common **ddnames** include
* **SYSIN** - used with **DUMMY** and **\*** parameters for program input
* **SYSOUT** - with the the **SYSOUT=\*** parameter is tells it to write output device defined by the **MSGCLASS** statement. 
* **SYSPRINT** - used with **SYSOUT** parameters
* **SYSUT1** - in the case of IEBGENER it is used with the input data set
* **SYSUT2** - in the case of IEBGENER it is used with the output data set

### Multipart DD Names and Back References

**Multipart Example:**

**//PAYROLL.DAY DD**

If the **procedure step named PAYROLL** includes a DD statement named DAY, this statement will override parameters on the statement named DAY. If the step does not include a DD statement named DAY, this statement will be added to the procedure step for the duration of the job step.

**Back Reference Example:**

Uses the **\*.PRIORSTEPNAME.DDNAME** notation to refer a prior steps DD statement 

```
//STEP2    EXEC PGM=UPDT
//DDA      DD DSNAME=SYS1.LINKLIB(P40),DISP=OLD
//STEP3    EXEC PGM=\*.STEP2.DDA
```

### Symbolic References DDNames

The **DDNAME** labels in the **label** column of the **DD Statements** are referred to as **Symbolic References**.  They are used to tie the particular **DD** statement to the program that is being executed.  That program uses this symbolic reference internally to references its inputs and outputs.

### DD Statement Parameters

* **SYSOUT** - assigns data to an output class, examples include **SYSOUT=A** and **SYSOUT=\***, with "A" typically indicating the printer, but is defined by the data center.
* **DUMMY** - indicates that this particular data set (identified by the **ddname** should NOT be processed
* **\*** - indicates that the input data immediately follows the **DD** statement, and is referred to a the **input stream data**

### Data Set Allocation and References Specifics

* **DISP** - the data set disposition, which indicates whether it is new **NEW** or already exists **OLD** when processing starts, and what to do with it when processing completes **KEEP** or **DELETE**.  You can also specify what to do if the job abnormally ends.

The various **Dispositions** (sets for the start, end, and abnormal endings of the job):

At Start | On Completion | Abnormal End
---------|---------------|--------------
NEW | DELETE | DELETE
OLD | KEEP | KEEP
SHR | PASS | PASS
MOD | CATLG | CATLG
 _   | UNCATLG | UNCATLG
 
 Note the difference between **OLD** and **SHR** is that with **OLD** it wants exclusive access, and with **SHR** it is willing to share the data set with others.  Keep in mind if you use **SHR** while updating it, then anybody reading it will be in a **dirty read** situation.  Specify **CATLG** to update the catalog so the system can find it in the future.
 
### Data Set UNIT Types

Units can be specified from the specific to the general (device number, to group name).

* **UNIT Device Address** - specify a specific device with the 3 digit device address
* **Generic Device Type** - specify by the device type, such as the **3350 DASD** family
* **Groups of Devices** - use **SYSALLDA** for any available **DASD**, **SYSDS** available for general use, **TAPE** for any tape drive.

### Temporary Vs Permanent Data Sets

When running the Job you will likely have both permanent and temporary data sets.  A permanent data set must have a name, while a temporary data set can have a name, but **doesn't require a name**.  The temporary data sets will be deleted by the time the job completes.  In some cases the temporary data sets are handled behind the scenes, and you don't deal with them directly (often the case when running ProcLib modules).  In other cases you may control them directly, specifying they are to be deleted when the job is done.

### DCB Information

The **DCB** information comes from either the the data set's label or catalog entry, the JCL, or the program itself. When opening in **input mode**, the file must exist and records can be read but not written. With **output mode**, records can be written but not read. For existing files records are added to the end of the data set, and if it doesn't exist a new one is created.  With **I/O mode**, you can both read and write to the data set.

### Concatenation vs Continuation on DD Statement

You can have **DD Statements** that span multiple lines.  

For **Continuation** you can separate individual parameters on to multiple lines by ending the prior line with a comma and starting the next line with **//** and at least one space.

```
//SYSUT1   DD DSN=HERC02.AOK.JCLLIB,
              DISP=SHR
```

For **Concatenation** you can have multiple data sets on there own lines that will be combined as if it were one data set.  You do NOT separate the lines with commas, but you do start the line with with **//** and at least one space (but no DDName) before the next **DD**.

```
//SYSUT1   DD DSN=HERC02.AOK.Part1,DISP=OLD
//         DD DSN=HERC02.AOK.Part2,DISP=OLD
//         DD DSN=HERC02.AOK.Part3,DISP=OLD
              
```

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
//FT06F001 DD
```

# Additional Statements

## Delimiter (/\*) Statement

Placing **/\*** in columns 1 and 2 marks the end of an **input stream**

## NULL (//) Statement

Used to mark the end of the entire **Job**.  While not required, it is considered good programming practice to end your jobs with **//**.

# JCL Job Output

The JCL output depends on the **MSGLEVEL** parameter of the **JOB** statement, which is of the format **MSGLEVEL=(statements, messages)**

For **statements** part of the **MSGLEVEL** the meaning is:
0 Print only the JOB statement
1 Print all the input JCL, ad the JCL from cataloged procedures
2 Print only the input JCL

For the **messages** part of the **MSGLEVEL** the meaning is:
0 Don't print allocation messages unless the job abnormally terminates
1 Print all allocation messages

**Allocation** messages show the physical device that was allocated for the data sets used

## The Output

The output will depend on the **MSGLEVEL** settings.  If the **statement** part of the **MSGLEVEL**  is set to 1 it will print two copies of the input data, the first of which is mostly unmodified, while the second will indicate where any errors that occurred.  If **MSGLEVEL** is 2 then only the fist is displayed, and with 0 (zero) neither is displayed since only the **JOB** statement is displayed

The **allocation** page which contains the information on what physical devices were allocated for the data.  If this information is not relevant or important for a particular job then it can be suppressed by setting the **messages** part of the **MGLEVEL** parameter to zero, otherwise set it to 1.

The **allocation** page does include one particularly import piece of information, the return code (may show as "CONDITION CODE" or "RC" with zero indicate no issues.  For the standard utilities "4' indicates minor errors, while "8" and "12" indicate progressively more serious errors.  Custom programs may follow this standard or may choose another.

The remaining pages of the JCL output will contain any output of the program specifies

# Using System Utilities

## IEBUPDTE

### Description

The IEBUPDTE utility creates multiple members in a partitioned data set, or updates records within a member. While it can be used for other types of records, its main use is to create or maintain JCL procedure libraries or assembler macro libraries.

* When a library is to be updated, then SYSUT1 and SYSUT2 both point to that library. (If they point to different libraries, the SYSUT1 library is copied to the SYSUT2 library and then updated.)
* The IEBUPDTE utility uses **control statements** with the symbols **./** (a period and slash) in the first two columns.
* The function statement (**ADD, CHANGE, REPL, or REPRO**) is used to begin an IEBUPDTE operation. At least one function statement must be provided for each member or data set to be processed.

### References

* [IBM IEUBPDTE](https://www.ibm.com/support/knowledgecenter/zosbasics/com.ibm.zos.zdatamgmt/zsysprogc_utilities_IEBUPDTE.htm)
* [IBM IEBUPDTE Examples](https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.1.0/com.ibm.zos.v2r1.idau100/u1437.htm)
* [IBM IEUPDTE Function Statement](https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.1.0/com.ibm.zos.v2r1.idau100/u1432.htm)

### SYSIN Data Statement / Control Statements

**Data Statements** are used used with **Function Statements**, or with **Function Statements and Detail Statements**

* The **SYSIN**data begins with **./** indicating that the Data Statements are to be treated as User Labels
* The control statement must contain one of the following **Control Functions**:
  * **ADD** - If the target is a **new data set** it is added.  For an **existing data set** , it specifies that a member or a data set is added if it doesn't exist. If a member already exists processing is ended, unless **PARM=NEW** is specified on the EXEC statement, the member is replaced. For a sequential output data set, PARM=NEW must always be specified on the EXEC statement.
  * **REPL** - the entire data set or member should be replaced.  It must already exist or else it is an error
  * **CHANGE** - used to specify specific changes to a data set or member.  It must exist or else it is an error.  It uses **NUMBER** and/or **DELETE** to specify changes.
  * **REPRO** - specifies that a data set or member is copied in its entirety to a **new data set**

### Function Statement Parameters

A few of the possible possible parameters, refer to the IBM docs [IBM IEUPDTE Function Statement](https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.1.0/com.ibm.zos.v2r1.idau100/u1432.htm)
 for the full list

* **LIST** - specifies how much of the data set contents is sent to SYSPRINT 
* **NAME** - the member named to be added or updated
* **NEW \{PO\|PS\}** - specifies the organization of the old master data set and the organization of the updated output. NEW should not be specified unless the organization of the new master data set is different from the organization of the old master. NEW can only be coded on the first control record.
  * **PO** - specifies that the old master data set is a sequential data set, and that the updated output is to become a member of a partitioned data set or PDSE.
  * **PS** - specifies that the old master data set is a partitioned data set or PDSE, and that a member of that data set is to be converted into a sequential data set
  
### Detail statement 

*	The detail statement is used in conjunction with a function statement to provide additional information 
*	Valid detail keywords are: 
	* **NUMBER**	specifies a new sequence numbering scheme 
  * **DELETE**	specifies the logical records that are to be removed from the member or data set 
 
 
### Data statement 

*	The data statement is used to supply the logical records that are used as replacement statements or new data to be merged into the output data set 
*	When used with an ADD or REPL function, a data statement contains the new data to be placed in the output data set 
*	When used with a CHANGE function, a data statement contains the new data or the data which replaces existing logical records in the input data set 
* The data statement does not have a fixed syntax. 
* Each logical record begins in column 1 and must contain sequence numbers 
* The sequence numbers must be in the same relative position in the data statement as in the existing logical records 
* The sequence numbers are assumed to be in columns 73 though 80 until otherwise specified in a SEQFLD parameter 

### Label Statement

The **SYSIN**data begins with **./** indicating that the Data Statements are to be treated as User Labels

### Alias statement 

* The ALIAS statement is used to create or to retain existing alias in an output data set directory 
* Up to 16 aliases can be assigned to a single member 
* This format of the ALIAS statement is as follows: 
  ./{name} ALIAS NAME=cccccccc 
  where NAME=cccccccc specifies the name of an alias for this member 

### ENDUP Statement

An ENDUP statement is optional. It is used to indicate the end of SYSIN input to this job step. If there is no other preceding delimiter statement, it serves as an end-of-data indication. The ENDUP statement follows the last group of SYSIN control statements.

# Submitting the Job

## Within RFE

Simply enter **SUBMIT** on the command line while in the JCL file itself

## From TSO

In addition to submitting the job from within the **RFE** editor you can submit it from **TSO** by specifying the data set that contains the JCL with the following syntax:

**SUBMIT 'USERID.XXX.YYY(Membername)'**

## From a Card Reader

 To run a JCL Job from the **00C Reader** enter **devinit 00C jcl/vsizehs3.jcl** at the Hercules console.  This is a Hercules command, not an MVS command.  No MVS commands need to be entered unless for some reason the device is not available.  In the JCL itself you need to make sure the username and password are specified to run the job, for example **//\* USER=HERC02,PASSWORD=CUL8TR** (note: it is entered as a comment)

## Submit Error messages

If the message begins with HASP, the job was failed by JES2


