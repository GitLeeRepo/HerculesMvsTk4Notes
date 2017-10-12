# Overview

Notes on the Hercules IBM MVS mainframe \(System/370, System/390, and zSeries/System z\) emulator, using the ready to use **MVS 3.8j Tur(n)key 4- \("TK4-"\)** preconfigured system, which can be found [here](http://wotho.ethz.ch/tk4-/).  It is available for both Linux and Windows, these notes are based on an Ubuntu 17.04 setup.  TK4- is an extension by Jürgen Winkelmann of TK3 by Volker Bandke.  Since TK4- does not claim to be an official new release of TK3, it uses the TK4- (with the dash) moniker, although here in these notes and in other sources it may be referred to as TK4 (without the dash).

I come at this from the perspective of having extremely limited mainframe experience (JCL and COBOL classes back in the mid 1980s), with most of my experience being in the Windows/Mac/Linux/Unix world, with a few years of VMS work experience in the late 80s early 90s.  But I have always had an interest in knowing what it was like to work in a mainframe envirorment, this emulation software allows me to get a flavor of that (from the software/OS side anyway, not so much the hardware side, other than virtual hardware)

# References

## Main **MVS 3.8j Tur(n)key 4- \("TK4-"\)** site
* [Main site](http://wotho.ethz.ch/tk4-/)
* [User Manual](http://wotho.ethz.ch/tk4-/MVS_TK4-_v1.00_Users_Manual.pdf)

## TK3 and TK4 References

* [MVS Tur(n)key Cookbook](http://www.bsp-gmbh.com/turnkey/cookbook/) - good info, but only covers TK3

## Excellent series of YouTube videos by [moshix](https://www.youtube.com/channel/UCR1ajTWGiUtiAv8X-hpBY7w)

A lot of the notes here come from his videos

* [How to Install and Operate the MVS turnkey TK4 system](https://www.youtube.com/watch)
* [Editing and Executing a COBOL program](https://www.youtube.com/watch?v=YA3FQOzr0ag)
* [Using the Hercules mainframe console](https://www.youtube.com/watch)

## Hercules References

* [Hecules System 370/ES 390 Emulator](http://www.hercules-390.org/)

## Additional Notes References

* [JclNotes](https://github.com/GitLeeRepo/HerculesMvsTk4Notes/blob/master/JclNotes.md#overview)

## Concept References

* [Data Set Wikipedia](https://en.wikipedia.org/wiki/Data_set_(IBM_mainframe))

## Grab notes from

[DD Statement](https://www.tutorialspoint.com/jcl/jcl_dd_statement.htm)

# Concepts

* **Catalogs** are used to organize data sets.  By default the data sets you create are stored in the **SYS1.UCAT.TSO** master catalog.  To see a list of Catalogs owned by the user type the **TSO** comamand **LISTCAT**.
* **MVS** has a **record oriented/block oriented file system**, not byte oriented like Linux/Windows.  When creating Datasets you must specify a lot more detail, such as record and block size, the size in tracks or cylinders as the initial primary size, a scondary size in the same units which will increase the size by that amount if needed, which will create addional **extents**.  If secondary size increases aren't specified it won't grow beyond the inial primary size provided.  When creating data sets you often have to factor in individual disk geometries for the volume used in order to get optimal disk space usage.

# Terminology

Note: several of the definitions come from [IBM knowledge base](https://www.ibm.com/support/knowledgecenter/zosbasics/com.ibm.zglossary.doc/zglossary.pdf) and Wikipedia articles that were primarily modified to make them more concise.

* **3270 Terminal** - The **IBM 3270** family of terminals that were released in 1971.  They are block oriented devices, meaning that they sends entire blocks of text at a time, rather than character by character.  This block orientation, along with controllers that sit between the 3270s and the mainframe itself, minimize the interuptions to the mainframe CPU.  The 3270 is no longer manufactured today, but is widely used through terminal emulators.
* **ALLOCATE** . TSO command to make a connection between a file's logical name (the ddname) and the file's physical name (the data set
name).
* **BLOCK** - a set of consecutive pages on a disk
* **BLOCK SIZE** - the size of a block specified in different units, i.e. the number of records (most common), words, characters, etc.
* **BSAM** - Basic Sequential Access Method
* **CATALOG** - A directory of files and libraries, with reference to their locations
* **CATALOGED DATASET** - An indexed dataset associated with a **Catalog**
* **CATALOGED PROCEDURE** - JCL statements placed in a library and access by name
* **CHANNEL** -  manages a single I/O interface between a channel subsystem and a set of control units
* **CICS** - application servers that provide online transaction management and connectivity for applications on IBM Mainframe systems. CICS is middleware designed to support rapid, high-volume online transaction processing. This processing is usually interactive (screen-oriented), but background transactions are possible.  Recent CICS Transaction Server enhancements include support for Web services and Java, Event processing, Atom feeds, and RESTful interfaces.
* **DATASET** - similar to a file in Linux/Windows, although you can have a **PDS** (Partition Data Set) in MVS 
* **ISAM** - Indexexed Sequential Access Methed
* **IPL** - Intial Program Load - the booting process.  Different types (cold start, quickstart, warm start)
* **ISPF** - Interactive System Productivity Facility - includes a screen editor, user interface with panels that contain menus for running TSO commands.  Often used as an application programming interface.  The TS4- version of MVS uses **RFE** and **RPF** as "SPF like productivity tools".
* **ISPF LIBRARY** - The ISPF library has a three-level name consisting of a project, group, and type. An optional library member name can also be included. A member consists of programming code, data, or text.
  * **Project** - The common identifier for all ISPF libraries belonging to the same programming project. This name must be your user ID unless you are using a specific project name that has been predefined in the MVS™ master catalog.
  * **Group** - The identifier for a particular set of ISPF libraries.
  * **Type** -The identifier for the type of information in the ISPF library, such as JCLLIB, PL/I, SCRIPT, or COBOL.
* **JCL** - Job Control Language.  Refer to [JclNotes](https://github.com/GitLeeRepo/HerculesMvsTk4Notes/blob/master/JclNotes.md#overview) for more information.
* **JES** - Job Entry System - responsible for spooling, job queuing, and I/O for jobs
* **JOB** - a unit of work for the operating system defined in JCL
* **JOB CLASS** - a category of job used to distinguish its characterist (for example I/O intensive vs processor intensive)
* **LIBRARY** - smiliar to a directory in Linux/Windows
* **LP** - logical partition
* **LRECL** - logical record length
* **LU** - logical unit
* **MEMBER** -  A file in a **PDS** (Partitioned Data Set).  Most editing of source files takes place in **MEMBERS**
* **MVS** - Multiple Virtual Storage
* **MVS/ESA** - Multiple Virtual Storage/Enterprise System Architecture
* **PDS** - Partitioned Data Set - It is a data set that can contain partitions called **MEMBERS**, which are programs, parts of programs, and data.  members, each of which can contain a program, part of a program, or
data. Synonymous with program library. Contrast with sequential data set. Identifed by **PO** under the ORG heading when listing datasets and in JCL commands
* **PE** - Program Error
* **PU** - Physical Unit**
* **READER** -  A program that reads jobs from an input device or data base file and places them on the job queue.
* **RECORD SET** - Data sets with a record-oriented structure that are accessed record by record. This is the most typical data set structure on MVS
* **RJE** - Remoote Job Entry
* **SNA** - Systems Network Architecture.  a complete protocol stack for interconnecting computers and their resources. SNA describes formats and protocols and is, in itself, not a piece of software. Refer to VTAM which is one of the key technologies using this specification.  SNA is a key architecture use in communication devices such as the 3270 terminal
* **SPOOLING** - Reading and writing of input and output streams on auxiliary storage devices, concurrently with job execution,
* **TSO** - Time Sharing Option -  allows users to interactively share computer time and resources - interact in either line by line mode or full screen menu mode with the results displayed on the terminal screen - refer also to **ISPF** which is built on top of **TSO** allowing it to be controlled through menus, the two are often referred to as TSO/ISPF- commonly used by mainframe system admins and programmers because it provides:
 * Entering line commands.
 * Text editor
 * Batch job support and notifications.  Line interaction mode commands can also be processed by JCL instead
 * Debuggers
 * Support for applications
* **VOLUME* - **DASD** disks, along with tapes and optical units.  Indentified by a volumen label.
* **VSAM** - Virtual Storage Access Method
* **VTAM** - Virtual Telecommunications Access Method subsystem that implements Systems Network Architecture (SNA) for mainframe environments.  It provides an API for communication applications, and it controls communication equipment such as adapters and controllers. 

# Installation on Ubuntu (should be similar for windows)

* Download the "Current TK4- System" zip file from [here](http://wotho.ethz.ch/tk4-/)
* Create a directly and unzip the download file
* Install a 3270 terminal emulator such as `sudo apt install x3270` for an X Window emulator or `sudo apt install c3270` for a cursor based console program, which is what I'm currently using.
* In the directory that the emulator was unzipped in, run the command `set_console_mode` in the **unattended** directory.  This will allow you to see what's happening on the console by starting the system manually rather than running as a daemon.
* In the directory that the emulator was unzipped run **`./mvs`** to start the emulated system.  You will see a lot of text scroll by as the system boots up. This screen has the Hercules command prompt.  You can toggle back and forth between this screen and a monitor screen that shows IO and MIPs statistics, along with showing the attached devices /(printers, readers, punch card, tapes consoles, display units etc/) most of which are virtual and correspond to subdirectories in the emulator directory.
* When the system finishes booting connect with the 3270 emulator.  Press return and logon.  Preconfigured logons and passwords include:
  * **HERC01** - a fully authorized user **with** full access to the RAKF users and profiles tables. The password is **CUL8TR**
  * **HERC02** - a fully authorized user **without** full access to the RAKF users and profiles tables. The password is also **CUL8TR**
  * **HERC03** - a regular user with the password is **PASS4U**
  * **HERC04** - a regular user with the password **PASS4U**
 * After logging in with HERC01 and pressing return a couple of times a menu of available options is presented, which will be examined in more detail in the rest of these notes.

# Keys and Navigation

Note for several of these commands (particular the ones you type in that require a return (not F3, F7, F8, etc)) make sure you are in the input area, otherwise you will replace whatever text is displayed on the screen

* **F3** - move back up a level in the menu
* **arrow keys** - move up and down lines, left and right a character
* **+ enter**, **F8**, **DOWN** - page down
* **- enter**, **F7**, **UP** - page up
* **TOP** - Move to the first line of a record (top page)
* **BOTTOM**, **BOT** - Move to the last line of a record (last page)
* **END** - end a command
* **CANCEL**, **CAN** - same as end but user profile changes not saved
* **EXIT**, **END**, **=x** - terminate the whole review session
* **RECALL**, **RETRIEVE** - recall the prior command
* **e** - edit/display an entry (make sure you are on the front of the line for that entry)
* **PA** - Program attention key which allows you to break out of a running program.  Not sure what it is bound to on the keyboard yet, but it is avaiable in the keyboard overly menu in the c3270 emulator
* **RESET** - If the keyboard becomes unresponsive while in ISPF like tools this will reset it so you can use it again.  Availble on the c3270 keyboard overlay menu, not sure the key binding (Esc?)

# Directory Structure (the unzip location)

* **conf** - the Hercules configuration files
* **dasd** - the location of the virtual DASD (direct access storage devices) disk images
* **doc** - documentation
* **hercules** - the emulator executables
* **jcl** - the JCL /(Job Control Language/) files
* **log** - log files for job runs and the storage location for punch card image output
* **prt** - print directory for printer output
* **rdr** - card images to submit to the reader in MVS
* **unattended** - contains the **set_console_mode** script to enable console mode in which you start the system with the `./mvs` script rather than having it run as a daemon.

# IMON/370 System monitor

From the main menu select **3. IM** and enter

This contains several system monitors, to include just a few:

* **Graphic System Monitor** (type "g" return) displays a list of processes and device activity that is dynamically updated.  It shows the user process /(HERC01 in this case \), the **\*master\*** process which is the MVS kernel, **JES2** which is the scheduler and spooling system

# RFE productivity tool

Provides an editor and productivity tools

From the main menu type **1 enter**.

## Utilities

From RFE menu type **3 enter**

### DSLIST (Data Set List)

From the Utilities type **4 enter**

### OUTLIST

To view and modify the output job queue, typically print jobs with the output results (good or bad) on the execution of the job.  Usually a combination of execution information and program output if it was successful.

* Go to the Utilities menu then **8 OUTLIST**
  if the job is not displayed, type **ST** to display all jobs
* Type **"S"** enter next to the job to select it (open the job)

  Other commands for an individual job
  * Type **"P"** next to a held job to purge it (delete it)
  * Type **"O"** next to a held print job to release it to the printer
  * Type **"C"** next to a non-held job (one waiting to execute) to cancel it.  It can not be canceled if it has started
  
* Small portion of JES2 Job Log output for a held job

```
J E S 2   J O B   L O G


08.33.36 JOB    4  $HASP373 PRIMCOB1 STARTED - INIT  1 - CLASS A - SYS TK4-
08.33.36 JOB    4  IEF403I PRIMCOB1 - STARTED - TIME=08.33.36
08.33.36 JOB    4  IEFACTRT - Stepname  Procstep  Program   Retcode
08.33.36 JOB    4  PRIMCOB1   PRIMES    COB       IKFCBL00  RC= 0000
08.33.36 JOB    4  PRIMCOB1   PRIMES    GO        LOADER    RC= 0000
08.33.36 JOB    4  IEF404I PRIMCOB1 - ENDED - TIME=08.33.36
08.33.36 JOB    4  $HASP395 PRIMCOB1 ENDED
```
One of the most import things to note here is the return codes, both are **Rc= 0000** which indicates **job success**.

**Example "SYS2.JCLLIB":**

For the  "Data set name prefix", enter "SYS2.JCLLIB" which will display the JCL library data set that contain a number of example JCL jobs you can run. Type  **"e" enter** at the beginning of the line for this data set to see the list of JCL jobs available.

# Data Sets

** DSLIST (data set list) command (1 RFE/3 UTIL/4 DSLIST)

The listing specifieds:
  * **Volume** - the volume it is on
  * **ORG** - the dataset organization, whether it is a **PO** partitioned dataset
  * **FMT** - Dataset format: **FB** fixed block"; **VB** variable block; **U** "?"
  * **LRCL** - Logical Record Length
  * **BLKSZ** - Block size - by default files are read one block at a time, not one record at a time
  
** Example data sets

* SYS1.* - the system library datasets.  Do not change these unless you know what you are doing, you can prevent the system from booting if you make a mistake
* SYS2.* - contains data sets provided by TK4-, including the **SYS2.JCLLIB** data set that can be used and modified

## Creating a Data Set

### Naming rules

* The entire data set name cannot be more that 44 characters.
* The segment portion between the periods cannot be more that 8 characters
* Allowable characters - you can use several special characters, wuch as $,#,@,%, etc. as long as they are not the first character

### Disk Geometry

* 1 track = 56,664 bytes
* 1 cylinder = 15 tracks = 849,960 bytes

### Record Format Types

* **U** - Undefined
* **FB** - Fixed block - for example a block with a records size of 80, and a block size of 800, creates a block of 10 records
* **VB** - Variable block - the record length is fixed, but the block length is variable
* **F** - Fixed record length

### Data Set Allocation

* Specify the PRIMARY SPACE QUANTITY - size in tracks or cylinders - this is the required space to be created
* Specify the SECONDARY SPACE QUANTITY - size in tracks or cylinders - these are the exents that allow the data set to be increased by that size.  You can have up to 16 extents per volume.  There is no guaratee you will get the extended space.

### Data Set Creation Using the RFE Productivity Utilities

From within **RFE** go to **3 UTILITIES** **2 DATASET**

* Type **"A"** for Command (no enter) and enter the provide the **Data Set Name** then press enter

* On the **ALLOCATE NEW DATA SET** screen specify:
  * RECORD FORMAT (U, FB, VB, F)
  * LOCGICAL RECORD LENGTH
  * PHYSICAL BLOCK SIZE
  * ALLOCATION UNIT (**T = TRACK; C = CYLINDER;** B = BLOCK; K = KILOBYTES; M = MEGABYTES; R = RECORDS)
  * PRIMARY SPACE QUANTITY
  * SECONDARY SPACE QUANTITY
  * NUMBER OF DIRECTORY BLOCKS
  * OPTIONAL: VOLUME AND UNIT - DEFAULTS WILL BE PROVIDED
  
  **Important:** In order to create a **PDS** (Partitioned Data Set) you need to specify a non-zero number for the **NUMBER OF DIRECTORY BLOCKS**.  On the other hand, if you want to create a **sequential** data set then be sure to set it to zero.
  
* Press enter when complete to generate the data set

  
# JCL Jobs

Refer to [JclNotes](https://github.com/GitLeeRepo/HerculesMvsTk4Notes/blob/master/JclNotes.md#overview) for more details on JCL

## Job Statement

Contains information to tell **JES2** how to run the job.  An Example Job Statement section for submitting a COBOL program looks like this:

```
//PRIMCOB1 JOB (COBOL),
//    'Eratosthenes Sieve',
//				CLASS=A,
//				MSGCLASS=A,
//				REGION=8M,TIME=1440,
//				MSGLEVEL=(1,1)
```
Note the CLASS is used to tell JES2 what to do and is defined by a particular computer center/installation.  In the case of TK4- the CLASS=A in this case tells JES2 to run it immediately.  The MSGCLASS tells JES2 what to do with the output, here **MSGCLASS=A** indicates a particular printer (on Hercules one that writes the output to the prt folder).  To have the system hold the output before printing so it can be reviewed specify **MSGCLASS=H**

Also note that the identifier on the first line before the **JOB**, in this case **PRIMCOB1** (the name of the program) can be changed to whatever you want.  This is helpful in that this identifier can be used to search for the output in Ubuntu's **prt** directory.  Some programmer use their username plus a unique letter for each run to help find the output.

## Execution Statement and DD Statement

The **Execution Statement** is that section of the JCL that telss JES2 what program to execute.  It is followed by a series of **DD Statements** which define the data (both input and output) for the particular **EXECUTION**. An example from the same COBOL program as above would be:

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

## Example Jobs in the SYS2.JCLLIB Data Set

From the main menu select **1 RFE/3 Utilities/4 DSLIST** and enter **SYS2.JCLLIB** for the "Data set prefix".  Type **"e" enter** next to the data set name and then **"e" enter** again next to the JCL job you want to edit/run.

**Example: PRIMASM**

An assembly language program for generating prime numbers.

* Edit the PRIMASM JCL job.  Enter the username with a tag at the top to make it easy to find the job results in the printer output

* If desired change the PARAM.GO parameter value to set the range of prime numbers to generate

* Type **SAVE** at the command prompt to save the changes

* Type **SUBMIT** to submit the JCL job

* Make note of the Job number which is displayed after SUBMIT.  If you tell JES2 in the JCL that **MSGCLASS=H** it will hold the job output in the queue.  In the case when I ran this example I had **MSGCLASS=A** which told it to send it to the printer (the **prt** folder in Hercules case).  If the job is held, refer to the [OUTLIST](https://github.com/GitLeeRepo/HerculesMvsTk4Notes/blob/master/HerculesMvsTk4Notes.md#outlist) section for information on viewing, purging, or releasing the job to the printer.

* Back in Ubuntu look in the **prt** directory and `grep '<theUsernameWithTag' *` to find the job results in the printer output


# Logging off and Shutdown the system

## Logging off

1. Exit any active application and press PF3 from  the TSO Applications menu to exit to the READY prompt
2. Type **logoff** enter

## Shutting down

These steps assume auto start and shutdown are enabled (they are by default).  If you want to go through the manual process of bring the system up and take it down refer to the manual.

1. Logon to TSO user HERC01 or HERC02. 
2. Press PF3 from  the TSO Applications menu to exit to the READY prompt
3. Type **shutdown** enter
4. Enter **logoff** enter
5. The shutdown process will proceed, with the automated shutdown it will automatically exit Hercules when completed

# Entering MVS Console commands from Herucules prompt

* **/** - place a slash at the beginning of MVS commands to run them from the Hercules command prompt
* **/D A,L** - list active jobs and users
* **/C jobname** - terminates the job/process
* **/C mf1** - cancels the job that provides stats, but is not needed
* **/C U=userId** - cancels (terminates) the specified users, e.g. **/C U=HERC02**
* **D U,DASD,ONLINE** - display the online DASD devices

## Non-MVS Hercules commands (no slash as a prefix)

* **devlist** - display a list of devices that you can page up and down

# TSO Commands

To run TSO commands, either **F3** out of the menus, or type **TSO <the command>** at an RFE command prompt, or go to the **1 RFE/6 COMMNAND** option.
 
Note that when entering TSO commands that include data sets the primary index (the first part of the DSN before the period) will be the UserID and appended on the front of the DSN you entered.  To indicate a non-user dataset place a fully qualified data set names in single quotes.  For example if you are user HERC02 and enter **SYS2.JCLLIB** it will try to access **HERC02.SYS2.JCLLIB**, so to get the right reference enter **'SYS2.JCLLIB'** in single quotes.

* **DSN** - Without parameters it will list data set names in use by the current users.  Specify **DSN** <the data set name> to get the users or jobs that are currently using that data set
* **LISTCAT** - To list the catalog files FOR the current user
* **LISTSPC** - list space (size) related statistics for a data set of or data sets.  Without any parameters it will prompt for the data ets, otherwise specify them as a parameter.
* **PROFILE msgid** - this will set the profile so that Msg IDs are displayed before the TSO message
* **PROFILE nomsgid** - turns off the display of the Msg ID before the message 
