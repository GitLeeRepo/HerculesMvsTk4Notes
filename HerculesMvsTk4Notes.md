# Overview

Notes on the Hercules IBM MVS mainframe \(System/370, System/390, and zSeries/System z\) emulator, using the ready to use **MVS 3.8j Tur(n)key 4- \("TK4-"\)** preconfigured system, which can be found [here](http://wotho.ethz.ch/tk4-/).  It is available for both Linux and Windows, these notes are based on an Ubuntu 17.04 setup.  TK4- is an extension by Jürgen Winkelmann of TK3 by Volker Bandke.  Since TK4- does not claim to be an official new release of TK3, it uses the TK4- (with the dash) moniker, although here in these notes and in other sources it may be referred to as TK4 (without the dash).

I come at this from the perspective of having extremely limited mainframe experience (JCL and COBOL classes back in the mid 1980s), with most of my experience being in the Windows/Mac/Linux/Unix world, with a few years of VMS work experience in the late 80s early 90s.  But I have always had an interest in knowing what it was like to work in a mainframe envirorment, this emulation software allows me to get a flavor of that (from the software/OS side anyway, not so much the hardware side, other than virtual hardware)

# References

## Main **MVS 3.8j Tur(n)key 4- \("TK4-"\)** site
* [Main site](http://wotho.ethz.ch/tk4-/)
* [User Manual](http://wotho.ethz.ch/tk4-/MVS_TK4-_v1.00_Users_Manual.pdf)

## Excellent series of YouTube videos by [moshix](https://www.youtube.com/channel/UCR1ajTWGiUtiAv8X-hpBY7w)

A lot of the notes here come from his videos

* [How to Install and Operate the MVS turnkey TK4 system](https://www.youtube.com/watch)
* [Editing and Executing a COBOL program](https://www.youtube.com/watch?v=YA3FQOzr0ag)
* [Using the Hercules mainframe console](https://www.youtube.com/watch)

## Hercules References

* [Hecules System 370/ES 390 Emulator](http://www.hercules-390.org/)

# Concepts

* MVS has a record oriented/block oriented file system, not by oriented like Linux/Windows.  When creating Datasets you must specify a lot more detail, such as record and block size, the number of extensions that can be added (it won't grow beyond this).  You often have to factor in individual disk geometries.

# Terminology

Note: several of the definitions come from [IBM knowledge base](https://www.ibm.com/support/knowledgecenter/zosbasics/com.ibm.zglossary.doc/zglossary.pdf)

* **ALLOCATE** . TSO command to make a connection between a file's logical name (the ddname) and the file's physical name (the data set
name).
* **BLOCK** - a set of consecutive pages on a disk
* **BLOCK SIZE** - the size of a block specified in different units, i.e. the number of records (most common), words, characters, etc.
* **BSAM** - Basic Sequential Access Method
* **CATALOG** - A directory of files and libraries, with reference to their locations
* **CATALOGED DATASET** - An indexed dataset associated with a **Catalog**
* **CATALOGED PROCEDURE** - JCL statements placed in a library and access by name
* **CHANNEL** -  manages a single I/O interface between a channel subsystem and a set of control units
* **DATASET** - similar to a file in Linux/Windows, although you can have a **PDS** (Partition Data Set) in MVS
* **LIBRARY** - smiliar to a directory in Linux/Windows
* **ISAM** - Indexexed Sequential Access Methed
* **IPL** - Intial Program Load - the booting process.  Different types (cold start, quickstart, warm start)
* **ISPF** - Interactive System Productivity Facility - includes a screen editor, user interface with panels that contain menus for running TSO commands.  Often used as an application programming interface.  The TS4- version of MVS uses **RFE** and **RPF** as "SPF like productivity tools".
* **JCL** - Job Control Language
* **JES** - Job Entry System - responsible for spooling, job queuing, and I/O for jobs
* **JOB** - a unit of work for the operating system defined in JCL
* **JOB CLASS** - a category of job used to distinguish its characterist (for example I/O intensive vs processor intensive)
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
* **SNA** - Systems Network Architecture
* **SPOOLING** - Reading and writing of input and output streams on auxiliary storage devices, concurrently with job execution,
* **TSO** - Time Sharing Option -  allows users to interactively share computer time and resources - interact in either line by line mode or full screen menu mode with the results displayed on the terminal screen - refer is ISPF allows custom menus, the two are often referred to as TSO/ISPF- commonly used by mainframe system admins and programmers because it provides:
 * Text editor
 * Batch job support and notifications.  Line interaction mode commands can also be processed by JCL instead
 * Debuggers
 * Support for applications
* **VOLUME* - **DASD** disks, along with tapes and optical units.  Indentified by a volumen label.
* **VSAM** - Virtual Storage Access Method

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
  
  
# JCL Jobs

## Job Card

The top section of the JCL file is called the **Job Card**.  It contains information to tell **JES2** how to run the job.  An Example Job Card section for submitting a COBOL program looks like this:

```
//PRIMCOB1 JOB (COBOL),
//    'Eratosthenes Sieve',
//				CLASS=A,
//				MSGCLASS=A,
//				REGION=8M,TIME=1440,
//				MSGLEVEL=(1,1)
```
Note the CLASS is used to tell JES2 what to do.  The CLASS=A in this case tells JES2 to run it immediately.  The MSGCLASS tells JES2 what to do with the output, here **MSGCLASS=A** indicates a particular printer (on Hercules one that writes the output to the prt folder).  To have the system hold the output before printing so it can be reviewed specify **MSGCLASS=H**

## Execution Card

The **Execution Card** is that section of the JCL that telss JES2 what program to execute.  An example from the same COBOL program as above would be:

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
