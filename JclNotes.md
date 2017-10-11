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

### Types of Operand parameters
* **Postional Parameters** - must be in a specific order.  In the case of the JOB statement for example the account information parameter must come before the programmer's name parameter.  `//JOBNAME JOB (AcctInfo), 'Programmer Name'`. Both of these parameters are optional:
  * If the first parameter is ommitted provide a comma //JOBNAME JOB , 'Programmer Name'`
  * The last parameter can be ommitted
  * If all optional parameters are ommitted no comma is needed, just continue with the next statement, which would be the EXEC in this case.
* **Keyword Parameters** - Keyword parmeters consist of a key value pairs and can be in any order.  In the case of the JOB statement it doesn't matter whether **CLASS=A** comes before **CLASSMSG=H**, they can be in any order.  They also don't require commas for missing parameters, but you do need commas to seperate the ones that are provided
  

## JOB Statement

* The name parameter is refered to as the JOB Name following standard naming rules (alphanumeric and national chars).  The individual computer centers determines if there are any additional naming conventions.
* Must be at least one space between the JOB Name and the JOB keyword
* Refer to the section above on **Types of Operand Parameters** which uses the JOB statement as an example





