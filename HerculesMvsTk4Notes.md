# Overview

Notes on the Hercules IBM MVS mainframe \(System/370, System/390, and zSeries/System z\) emulator, using the ready to use **MVS 3.8j Tur(n)key 4- \("TK4-"\)** preconfigured system, which can be found [here](http://wotho.ethz.ch/tk4-/).  It is available for both Linux and Windows, these notes are based on an Ubuntu 17.04 setup.  TK4- is an extension by Jürgen Winkelmann of TK3 by Volker Bandke.  Since TK4- does not claim to be an official new release of TK3, it uses the TK4- (with the dash) moniker, although here in these notes and in other sources it may be referred to as TK4 (without the dash).

I come at this from the perspective of having extremely limited mainframe experience (JCL and COBOL classes back in the mid 1980s), with most of my experience being in the Windows/Mac/Linux/Unix world, with a few years of VMS work experience in the late 80s early 90s.  But I have always had an interest in knowing what it was like to work in a mainframe envirorment, this emulation software allows me to get a flavor of that (from the software/OS side anyway, not so much the hardware side, other than virtual hardware)

# References

## Main **MVS 3.8j Tur(n)key 4- \("TK4-"\)** site
* [Main site](http://wotho.ethz.ch/tk4-/)
* [User Manual](http://wotho.ethz.ch/tk4-/MVS_TK4-_v1.00_Users_Manual.pdf)

## TK3 and TK4 References

* [MVS Tur(n)key Cookbook](http://www.bsp-gmbh.com/turnkey/cookbook/) - good info, but only covers TK3
* [MVS & JES Commands](http://www.bsp-gmbh.com/hercules/oscmds.html)

## YouTube Videos

### Videos by [moshix](https://www.youtube.com/channel/UCR1ajTWGiUtiAv8X-hpBY7w/videos)
* [How to Install and Operate the MVS turnkey TK4 system](https://www.youtube.com/watch)
* [Editing and Executing a COBOL program](https://www.youtube.com/watch?v=YA3FQOzr0ag)
* [Using the Hercules mainframe console](https://www.youtube.com/watch)

### Videos by [J. Packy Laverty](https://www.youtube.com/channel/UCux76e_mflOhblBmp9A5BZg/videos)

z/OS videos, but much is still applicable to earlier systems

* [TSO, ISPF, ISPF Editor](https://www.youtube.com/watch?v=vOiHiI7b9iY)
* [Data Sets](https://www.youtube.com/watch?v=NT_1AmdmlGg)
* [MVS and JES Commands](https://www.youtube.com/watch?v=9a2hrGroxl0&t=60s)

### Videos by 

## Hercules References

* [Hecules System 370/ES 390 Emulator](http://www.hercules-390.org/)
* [Hercules on Wikipedia](https://en.wikipedia.org/wiki/Hercules_\(emulator\))

## IBM Documents

**Frequently Used** since these most closely correspond to **MVS 3.8** used here:
* [OS/VS2 RELEASE 3.8 1978 Manuals](http://bitsavers.trailing-edge.com/pdf/ibm/370/OS_VS2/Release_3.8_1978/)
* [OS/VS2 MVS Overview](http://bitsavers.trailing-edge.com/pdf/ibm/370/OS_VS2/Release_3.7_1977/GC28-0984-0_OS_VS2_MVS_Overview_Rel_3.7_Jun78.pdf)
* [OS/VS2 MVS System Commands](http://bitsavers.trailing-edge.com/pdf/ibm/370/OS_VS2/Release_3.7_1977/GC38-0229-1_OS_VS2_MVS_System_Commands_Rel_3.7_Jul78.pdf)
* [OS/VS2 MVS Utilities](http://bitsavers.trailing-edge.com/pdf/ibm/370/OS_VS2/Release_3.8_1978/GC26-3902-1_OS_VS2_MVS_Utilities_Rel_3.8_Sep83.pdf)
* [OS/VS2 TSO Termial Users Guide](http://bitsavers.trailing-edge.com/pdf/ibm/370/OS_VS2/Release_3.8_1978/GC28-0645-4_OS_VS2_Rel_3.8_TSO_Termial_Users_Guide_Jun78.pdf)
* [OS/VS2 MVS JCL](http://bitsavers.trailing-edge.com/pdf/ibm/370/OS_VS2/Release_3.8_1978/GC28-0692-5_OS_VS2_MVS_JCL_Rel_3.8_Apr84.pdf)
* [OS/VS2 MVS JES2 Commands](http://bitsavers.trailing-edge.com/pdf/ibm/370/OS_VS2/GC23-0007-1_Operators_Library_OS_VS2_MVS_JES2_Commands_Jan79.pdf)

**Less Frequently Used**
* [MVS Manuals](http://ibmmainframes.com/manuals.php)
* [OS/390 Bookshelf](http://publibz.boulder.ibm.com/cgi-bin/bookmgr_OS390/SHELVES/IEA1BK37)

Most of these docs will be for Z/OS, but many things still apply for earlier OSes

* [IBM Book Shelves](https://www-03.ibm.com/systems/z/os/zos/library/bkserv/)
* [IBM Library Server](http://m.ibm.com/http/publibz.boulder.ibm.com/cgi-bin/bookmgr_OS390/library?wirelessshow=2)
* [TSO Bookshelf](http://m.ibm.com/http/publibz.boulder.ibm.com/cgi-bin/bookmgr_OS390/SHELVES/ikj4bkc0?wirelessshow=1)
* [ISPF Docs](https://www-01.ibm.com/software/awdtools/ispf/library/)

## z/OS videos

* [Data Sets in Depth](https://www.youtube.com/watch?v=NT_1AmdmlGg) - part of an excellent series of videos

## Jay Moseley

* [Hercules](http://www.jaymoseley.com/hercules/)

## Additional Notes References

* [JclNotes](https://github.com/GitLeeRepo/HerculesMvsTk4Notes/blob/master/JclNotes.md#overview)
* [RfeNotes](https://github.com/GitLeeRepo/HerculesMvsTk4Notes/blob/master/RfeNotes.md#overview)
* [c3270Notes](https://github.com/GitLeeRepo/HerculesMvsTk4Notes/blob/master/c3270Notes.md#overview)

## Concept References

* [Data Set Wikipedia](https://en.wikipedia.org/wiki/Data_set_(IBM_mainframe))

## Languages and Compilers

* [Compilers to MVS 3.8](http://www.jaymoseley.com/hercules/compilers/list_of.htm) - TK3 docs

## c3270 Emulator References

* [Key mappings](http://x3270.bgp.nu/Unix/c3270-man.html#Keymaps)

## TODO Grab notes/code from these

* [DD Statement](https://www.tutorialspoint.com/jcl/jcl_dd_statement.htm)
* [Sample JCL & COBOL Code](http://www.simotime.com/utldat02.htm)

## Forums

* [Hercules390](http://hercules390.996247.n3.nabble.com/)

# Concepts

## Role of Hercules vs TK4-

* **Hercules** is the emulator of the IBM mainframe Environment, which includes the machine level instruction set and the devices for **System/370**, **System/390**, and **zSeries/System z**, which are all one the hardware side of things.  It is not the operating system, but provides the environment for the operating system to run on.  It provides an environment to run public domain operating systems such as  **OS/360**, **DOS/360**, **DOS/VS**, **MVS** (see all the variations below), **VM/370**, and **TSS/370**.  It can also run **OS/390**, **z/OS**, **VSE/ESA**, **z/VSE**, **VM/ESA**, **z/VM**, **TPF/ESA**, and **z/TPF** are licensed products and cannot be legally run.
* **TK4- (OS/VS2 MVS 3.8j)** - Is the **MVS** operating system itself, in this case **OS/VS2 MVS 3.8j** which ran on the **System/370**.  Apart from the operating system itself it also provides additional functionality such as scripting automatic **IPL**, integrations with the host OS (Ubuntu in my case), etc.

## MVS Concepts

* **MVS** - Multiple Virtual Storage was the most commonly used operating system on the System/370 and System/390 IBM mainframe computers. It was developed by IBM, but is unrelated to IBM's other mainframe operating systems, e.g., VSE, VM, TPF.  **MVS** has been update over the years, here a some of the extensions in order of release:
  * **OS/VS2 Release 2** - the initial release of **MVS** on **System/370** (and thus synonymous with **MVS**).  Has **24-bit addressing**, supporting **16MB** of main memory.
  * **MVS/SE** (MVS/System Extensions) on **System/370**.  Has **24-bit addressing**, supporting **16MB** of main memory.
  * **MVS/SP** (MVS/System Product) Version 1, on **System/370**.  Has **24-bit addressing**, supporting **16MB** of main memory.  The first to add POSIX Unix Support.
  * **MVS/XA** - (MVS/eXtended Architecture) on **System/370**.  Has **31-bit addressing**, supporting **2GB** of main memory.
  * **MVS/ESA** - (MVS/Enterprise Systems Architecture) on **System/370**.  Has **31-bit addressing**, supporting **2GB** of main memory.
  * **OS/390** - MVS branded as **OS/390** running on **System/390**
  * **z/OS** - MVS branded as **z/OS** 
  
* **Catalogs** are used to organize data sets.  By default the data sets you create are stored in the **SYS1.UCAT.TSO** master catalog.  To see a list of Catalogs owned by the user type the **TSO** comamand **LISTCAT**.
* **MVS** has a **record oriented/block oriented file system**, not byte oriented like Linux/Windows.  When creating Datasets you must specify a lot more detail, such as record and block size, the size in tracks or cylinders as the initial primary size, a scondary size in the same units which will increase the size by that amount if needed, which will create addional **extents**.  If secondary size increases aren't specified it won't grow beyond the inial primary size provided.  When creating data sets you often have to factor in individual disk geometries for the volume used in order to get optimal disk space usage.

# Terminology

Note: several of the definitions come from [IBM knowledge base](https://www.ibm.com/support/knowledgecenter/zosbasics/com.ibm.zglossary.doc/zglossary.pdf) and Wikipedia articles that were primarily modified to make them more concise.

* **3270 Terminal** - The **IBM 3270** family of terminals that were released in 1971.  They are block oriented devices, meaning that they sends entire blocks of text at a time, rather than character by character.  This block orientation, along with controllers that sit between the 3270s and the mainframe itself, minimize the interuptions to the mainframe CPU.  The 3270 is no longer manufactured today, but is widely used through terminal emulators.
* **ALLOCATE** . TSO command to make a connection between a file's logical name (the ddname) and the file's physical name (the data set
name).
* **BLOCK** - for non-VSAM data sets the storage unit that holds the **RECORDS** and is itself stored in **TRACKS**.  When a record is request, the entire block that it is in is read into memory.  This is done for efficiency because it is assumed you will be requesting other records in that block.
* **BLOCK SIZE** - the size of a block specified in different units, i.e. the number of records (most common), words, characters, etc.
* **BSAM** - Basic Sequential Access Method
* **CATALOG** - A directory of files and libraries, with reference to their locations, including what volume it is on.  This volume could be tape or disk.  If it is a tape it has the information to request the tape be mounted by its volume name. If it is on disk it has the information on what disk volume it is on, in which the **VTOC** will have the information on where it is physically located. The catalog itself is actually a **VSAM** data set filled with meta data about other data sets.  A system typically has a **MASTER CATALOG** and several **USER CATALOGS**.  The **MASTER CATALOG** doesn't contain info on all the datasets on the system, but it can redirect to the appropriate **USER CATALOG**, much like a DNS server.
* **CATALOGED DATASET** - An indexed dataset associated with a **Catalog**
* **CATALOGED PROCEDURE** - JCL statements placed in a library and access by name
* **CHANNEL** -  manages a single I/O interface between a channel subsystem and a set of control units. Because I/O devices are relatively slow, a CPU could waste time (in computer perspective) waiting for the data from the device. This situation is called 'I/O bound'.  Channel architecture avoids this problem by using a separate, independent, low-cost processor. Channel processors are simple, but self-contained, with minimal logic and sufficient on-board scratchpad memory (working storage) to handle I/O tasks.
* **CICS** - application servers that provide online transaction management and connectivity for applications on IBM Mainframe systems. CICS is middleware designed to support rapid, high-volume online transaction processing. **This processing is usually interactive (screen-oriented)**, but background transactions are possible.  Recent CICS Transaction Server enhancements include support for Web services and Java, Event processing, Atom feeds, and RESTful interfaces.
* **DATASET** - the **sequential PS** data sets are similar to a file in Linux/Windows, although they are composed of a series of records as opposed to a stream of bytes.  There is also the **PDS** (Partition Data Set) in MVS, which is a data set that contains **Members** that contain the set of records (in the way the entire PS data set does)
* **Directory Block** - Each **PDS** has one or more directory blocks where it stores the 8 byte **Member Name**, the starting location for the first record in that **Member**, along with some additional optional information. You define the number of diretory bocks when allocating a new **PDS**. I had a **PDS** with 2 directory blocks allocate I was able to store 11 **Members** before filling the directory blocks, so 5.5 **Members** per dirctory block.
* **EXTENTS** -- the units of space allocated when a data set is created or extended.  The size of the extent is measured in **Tracks** or **Cylinders**. The space on disk is contiguous, which means it may be hard to find enough contiguous space on disk for a large extent if the disk is highly fragmented. There are two types of extents in which you specify how many tracks/cylinders you want for each type:
  * Primary - The initial extent allocated when the data set is created.  So if it is specified to be 20 tracks, those 20 tracks will be allocated when the data set is created
  * Secondary - the additional extents that are allocated when the primary extent is full.  So if the secondary extent is given a size of 10 tracks, those tracks will be allocated each time the data set is extended.  The number of secondary extents you can receive for a non-VSAM data set is limited, on z/OS it is 250, so it may be less on the earlier versions.
* **IDCAMS** - used to define, copy, delete, and rename VSAM Data Sets.
* **IMS** - IBM Information Management System (IMS) is a hierarchical database and information management system with extensive transaction processing capabilities.
* **ISAM** - Indexexed Sequential Access Methed
* **IPL** - Intial Program Load - the booting process.  Different types (cold start, quickstart, warm start)
* **ISPF** - Interactive System Productivity Facility - includes a screen editor, user interface with panels that contain menus for running TSO commands.  Often used as an application programming interface.  The TS4- version of MVS uses **RFE** and **RPF** as "SPF like productivity tools".
* **ISPF LIBRARY** - The ISPF library has a three-level name consisting of a project, group, and type. An optional library member name can also be included. A member consists of programming code, data, or text.
  * **Project** - The common identifier for all ISPF libraries belonging to the same programming project. This name must be your user ID unless you are using a specific project name that has been predefined in the MVS™ master catalog.
  * **Group** - The identifier for a particular set of ISPF libraries.
  * **Type** -The identifier for the type of information in the ISPF library, such as JCLLIB, PL/I, SCRIPT, or COBOL.
* **JCL** - Job Control Language.  Refer to [JclNotes](https://github.com/GitLeeRepo/HerculesMvsTk4Notes/blob/master/JclNotes.md#overview) for more information.
* **JES** - Job Entry System - responsible for spooling, job queuing, and I/O for jobs
* **JES SPOOL** - Used for **JES** queuing and output (custom indexed data sets).  Job output can be sent to the printer from this spool or held to be viewed.
* **JOB** - a unit of work for the operating system defined in JCL
* **JOB CLASS** - a category of job used to distinguish its characterist (for example I/O intensive vs processor intensive)
* **LIBRARY** - smiliar to a directory in Linux/Windows
* **LP** - logical partition
* **LPAR** - Part of IBMs virtualization architecture.  LPAR, is a subset of a computer's hardware resources, virtualized as a separate computer. In effect, a physical machine can be partitioned into multiple logical partitions, each hosting a separate operating syste
* **LRECL** - logical record length
* **LU** - logical unit
* **MEMBER** -  A file in a **PDS** (Partitioned Data Set).  Most editing of source files takes place in **MEMBERS**
* **MVS** - Multiple Virtual Storage.  Refer to the **Concepts** section above for more information.
* **MVS/ESA** - Multiple Virtual Storage/Enterprise System Architecture.  Ran on **System/370** as a 31 bit OS (2GB Main Memory)
* **PDS** - Partitioned Data Set - It is a data set that can contain partitions called **MEMBERS**, which are programs, parts of programs, and data.  members, each of which can contain a program, part of a program, or
data. Synonymous with program library. Contrast with sequential data set. Identifed by **PO** under the ORG heading when listing datasets and in JCL commands
* **PDS/E** - just like PDS but more advanced in that unclaimed space is autmatically reclaimed and they are more efficient
* **PE** - Program Error
* **PU** - Physical Unit**
* **READER** -  A program that reads jobs from an input device or data base file and places them on the job queue.
* **RECORD SET** - Data sets with a record-oriented structure that are accessed record by record. This is the most typical data set structure on MVS
* **RJE** - Remoote Job Entry
* **SMF** - System management facilities collects and records system and job-related information.  SMF formats the information that it gathers into system-related records (or job-related records). System-related SMF records include information about the configuration, paging activity, and workload. Job-related records include information on the CPU time, SYSOUT activity, and data set activity of each job step, job, APPC/MVS transaction program, and TSO/E session.
  * **Users Billing**
  * **Reliability Reporting**
  * **Analyzing the configuration**
  * **Scheduling jobs**
  * **Summarizing direct access volume activity**
  * **Evaluating data set activity**
  * **Profiling system resource use**
  * **Maintaining system security**
* **SNA** - Systems Network Architecture.  a complete protocol stack for interconnecting computers and their resources. SNA describes formats and protocols and is, in itself, not a piece of software. Refer to VTAM which is one of the key technologies using this specification.  SNA is a key architecture use in communication devices such as the 3270 terminal
* **SPOOLING** - Reading and writing of input and output streams on auxiliary storage devices, concurrently with job execution,
* **TSO** - Time Sharing Option -  allows users to interactively share computer time and resources - interact in either line by line mode or full screen menu mode with the results displayed on the terminal screen - refer also to **ISPF** which is built on top of **TSO** allowing it to be controlled through menus, the two are often referred to as TSO/ISPF- commonly used by mainframe system admins and programmers because it provides:
 * Entering line commands.
 * Text editor
 * Batch job support and notifications.  Line interaction mode commands can also be processed by JCL instead
 * Debuggers
 * Support for applications
* **UNIT TYPE** - when creating/accessing data sets it identifies the type of **VOLUME**, either **Tape** or **Disk** 
* **VOLUME* - **DASD** disks, along with tapes and optical units.  Indentified by a volumen label.
* **VSAM** - Virtual Storage Access Method - a **VSAM** data set uses a virtual dataset name called a **CLUSTER NAME**, with the cluster name being associated with one or more physical data set names.  With a **KSDS CLUSTER** you have a physical data set **DATA** component and a physical data set **INDEX** component, the **ESDS CLUSTER** has just the physical **DATA** component.  With the exception of **LDS (Linear Data Sets) **VSAM** data sets are collections of records grouped into **Control Intervals (CI)**, which are in turn grouped into a continuous storage are called a **CONTROL AREA (CA)**.  **Linear Data Sets** don't have any META data in them.  A special system utility called **IDCAMS** is used to define, copy, delete, and rename VSAM Data Sets.
* **VTAM** - Virtual Telecommunications Access Method subsystem that implements Systems Network Architecture (SNA) for mainframe environments.  It provides an API for communication applications, and it controls communication equipment such as adapters and controllers. 
* **VTOC*** - Volume Table of Contents. It includes a list of data sets on the volume, and the amount of free space.

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
* **PA** - Program attention key which allows you to break out of a running program.  Mapped to **CTRL-A** and then **1** (rease control before entering 1).  It is also avaiable in the keyboard overly menu in the c3270 emulator
* **RESET** - If the keyboard becomes unresponsive while in ISPF like tools this will reset it so you can use it again.  Availble on the c3270 keyboard overlay menu, not sure the key binding (Esc?)
* **CLEAR** - Clear the display screen.  Mapped to **Ctrl-C** and available on the c3270 emulator key map menu.

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
  * **FMT** - Dataset format: **F** fixed record length with only one record per block; **FB** fixed block (records are fixed lengths with the bock size being some multiple of the record size); **VB** variable block (records are variable in size with a byte on the front that has the record length); **U** undfined with no fixed structure (typical for compiled binary files)
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

There will be some variation between different disk types, here are some typical geometries:

Device Type | Track Capacity (Bytes) | Tracks Per Cylinder | Cylinder Capacity (Bytes)
------------|------------------------|---------------------|--------------------------
3330        | 13,030                 | 19                  | 247,570
3350        | 19,069                 | 30                  | 572,070
3380        | 47,476                 | 15                  | 712,140
3390        | 56,664                 | 15                  | 849,960

Refer to [ibmmainframes.com](http://ibmmainframes.com/references/disk.html) for more examples, along with total disk sizes.

### Record Format Types

* **U** - Undefined.  Up to the application to define.  Typically binary.
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
  
  **Important:** In order to create a **PDS** (Partitioned Data Set) you need to specify a non-zero number for the **NUMBER OF DIRECTORY BLOCKS**.  On the other hand, if you want to create a **sequential** data set then be sure to set it to zero.  Each **PDS** has one or more directory blocks where it stores the 8 byte **Member Name**, the starting location for the first record in that **Member**, along with some additional optional information.  I found with a **PDS** with 2 directory blocks allocate I was able to store 11 **Members** before filling the directory blocks, so 5.5 **Members** per dirctory block.
  
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

# JES2

Note: Refer to the [ES2 Commands](https://github.com/GitLeeRepo/HerculesMvsTk4Notes/blob/master/HerculesMvsTk4Notes.md#jes2-commands) section below for the list of **JES2 Commands** entered on the Hercules Console.

## Default TK4- Printer setup

The printers in Hercules TK4- are routed to files in the **prt** subfolder of the Hercules TK4- installation in Ubuntu.  There are 3 printers setup, which map to the files **prt00e.txt, prt00f.txt, prt002.txt**.  They can be selcted by the **MSGCLASS** in **JCL** and are mapped as follows:

JCL MSGCLASS | SYSOUT=?     | JES2 Printer | Ubuntu File Name
-------------|--------------|--------------|-----------------
MSGCLASS=A   | SYSOUT=A     | Printer1     | prt00e.txt
MSGCLASS=Z   | SYSOUT=Z     | Printer2     | prt00f.txt
MSGCLASS=X   | SYSOUT=X     | Printer3     | prt002.txt
MSGCLASS=H   | N/A - HELD   | N/A - HELD   | N/A - HELD

Note: You can specify MSGCLASS=A in your JCL and your JCL output will go to Printer1, and have the output of the program being run in the JCL go to Printer2 by specifying SYSOUT=Z.

# Transferring Data To and From the Mainframe

## Using the 3270 Emulator's File Transfer Feature IND$FILE

This example uses the **c3270** emulator on Ubuntu.  This method uses the **IND$FILE** program from within **TSO**, which is the IBM method for transfering files using the 3270.

* While logged onto the mainframe in the **c3270** emulator, exit the **RFE** menus all the way back to the **TSO** prompt.
* Select **File Transfer** from the **c3270** File menu
* Follow the prompts (send or receive, filenames, etc).  
* Note that when transferring a member in a data set use the standard **'USERID.XXX.YYY(MEMBER)'** notation.  Note the inclusion of the single quotes, the fully qualified name is required, so the quotes are neccessary.
* If uploading to the mainframe to a **PDS** it is not necessary to provide the record formats and disk geometry.  But for a **PS** that is new you should provide this info when prompted

# Using FTP

* To use this method you must start the **ftpd** daemon on the mainframe.  You do this from the **Hercules Console** by entering the **/START FTPD,SRVPORT=2100** (I assume other ports are allowed but this is what I used).  You can verify this is now running by entering **/D A,L** at the console.
* From Ubuntu command line enter **ftp localhost 2100** and logon to your **TSO** account
* If you type **ls** at this point you can see all the datasets on the system, since you are essentially at the root.
* Change to the **PDS** you want to upload to or download from, ex **cd HERC02.TEST.JCL**.  Now if you type **ls** you will only see the members of that **PDS**
* Type **ascii** to make sure the **FTP** program is set to ascii mode.
* Important: Make sure you are not in the **PDS** you are uploading to because it will place a lock, and from within ftp you will get a **550** not authorized message.  Doesn't seem to be an issue downloading from the mainframe.
* If you are **uploading** to the mainframe use the **put** or **mput** ftp commands to upload the file (remember the **Member Name** is limitted to 8 characters and does not have a file extension.  You can use the **lcd** (local cd) to change to the appropriate directory on Ubuntu if you were not already in that directory when you started ftp.
* If you are **downloading** from the mainframe use **get** to download the member as an Ubuntu file.  Again, if necessary change to the local Ubuntu directory with the **lcd** ftp command.

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

# Hercules Console

The **Hercules console** is where you started the OS, and it now functions as the **systems console** where status and error messages will be displayed.  It is also the locaction where **MVS System Commands**, **JES/2 Commands**, and commands for **Hecules** itself can be entered.

**Credits:** some of the commands here were copied in part from the [MVS and JES2 Commands](http://www.bsp-gmbh.com/hercules/oscmds.html) site.

## MVS Console Commands 

These are entered from **Hercules prompt**, which requireds that a **/** be entered before the MVS commands with no space following.

Note: Several of the MVS commands are under the **JES2 Related MVS Commands** section below.  Ones not directly related to **JES2** are shown here.

Note the commands and their subcommands can optionally have a space between them or no space between them, for example **$DA** or **$D A**.  In the list below I chose the no space option, just keep in mind the first letter is the command and the subseqent letters before a comma, or other delimiter are secondary commands.

**Shortcuts used below**:

* **C** - **CANCEL**
* **D** - **DISPLAY**
* **K** - **CONTROL**
* **MR** - **MSGRT** - message route
* **R** - **REPLY**
* **V** - **VARY**

**Example Commands**:

* **C U=userId** - cancels (terminates) the specified users, e.g. **/C U=HERC02**
* **D A,L** - list active jobs, tasks, and users
* **D PFK**	 - display function key assignments fir the console
* **D T** - display time
* **D TS,L** - List TSO users
* **D TS,username** - List detailed info on the user
* **D TS,ALL** - list detailed info on all users
* **D U,DASD,ONLINE** - display the online DASD devices
* **FBSPPILOT,SHUTDOWN** - Shut down the **BSPPILOT** job which is what is used for automatic **ISL** (boot/shutdown)
* **K A,10** - set display area 1 to 10 lines (this is the status area)
* **K A,NONE** - no display areas, everything in the message area.  Note: You must clear the status area before you can remove it
* **K A,5,4** - set display area A to 5 lines, and B to 4 lines, the remainder (10) is the general message area
* **K D,F** - scroll forward on **Frame** in the **Status Area** of a console
* **K E,D** - clear the **Status Area** of a console
* **MR D=(U,A),L=Z** - change the output location of D U and D A commands to the **Z (Message Area**)
* **MR D=A** - remove the message routing for the D A command
* **MR REF** - Show the currently defined **Message Routes**
* **MR NONE** - remove all message routing commands
* **R Id MsgText** - Reply to an **Action Message**
* **/V 010,CONSOLE,AUTH=ALL** - enable a console on Unit 010 with Authority All.  Refer to the section **Connecting to a Console with the c3270 Emulator** below.
* **V 010,OFFLINE** - place the console offline

## JES/2 Commands

JES/2 command begin with a **$**, but as with the **MVS System Commands** above they are preceeded by a **/** slash to let Hercules know the command is for the OS Console.

* **$AA** - Release all held jobs
* **$A ' jobname'** - Release specific job. Quotes required.
* **$CJOBn** - Cancel job by Job Number
* **$C 'jobname/user'** - Cancel job or user
* **$CPRTn** - Cancel job on printer
* **$CRDRn** - Cancel the reader activity
* **$DA,ALL** - Status of all JES2 functions
* **$D ' jobname'** - Display JES status of job or user
* **$DF** - display the backlog of work for the output devices
* **$DI** - display the initators, including their class
* **$DN** - Display input queues
* **$DQ** - Display queues
* **$DU** - display JES2 devices such as readers, punches and printers
* **$DU,allPRTS** - Display all JES devices.  This includes internal Readers, which the **$DU** alone didn't.
* **$E ' jobname'** - Restart job after it completes
* **$HA** or **/$H ' jobname'** - Hold all jobs or hold the specified job
* **$IPRTn** - Interrupt printing and return job to queue
* **$LSYS** - display the systems connected to the **JES2** queing system.   Multiple mainframe systems can connect to the same queue.
* **$P** - Stop all **JES2** processing, all printers, punches, and System Iniators will stop receiving new work and will becom inactive, although new jobs will be accepted through input devices.   Do this before shutting down JES with **$PJEST2**.
* **$P ' jobname'** Purge a job (including spooled output)
* **$PI3** - Stop an initiator
* **$PJES2** - shutdown **JES2**.  If you receive a message saying it can't be shut down (typical message says "JES2 is not dormant"), and you can't resolve the reason why, then use the **ABEND** parameter listed next. 
* **$PJES2,ABEND –  with reply – XX,END** - restart JES/2 if it won't restart with just **Pjes2** - NOTE: I need to figure out how to reply from the Hercules terminal.  I tried both with and without the **/** prefix when typing the reply.  I tried a couple times but got errors.  **JES2** can be restarted with the **$S** command
* **$PJOB # or a range $PJOB #-#** - Purge the Jobs that match the Job Number or the range of Job Numbers.  Frees resources.
* **$PPRTx** - prevent the device from receiving work.  Free resources.
* **$PRDRx** - prevent the reader from receiving work.  Free resources.
* **$SJES2,PARM=(COLD)** – to clear JES2 queue and start it cold. (all job queue entries and job output elements are cleared and formatted.)  - Haven't tried this yet to see if it works
* **$SJES2,PARM=(WARM)** - do a warm restart of **JES2** retaining prior queue and output entries.
* **$SPRTx** - start the printer.
* **$SRDRx** - start a reader
* **$SI3** or **/$SPRT2**  - Start an initiator or printer
* **$TI3,C=AB** - Assign job classes for an initiator
* **$TA** - disaply automated jobs (jobs that run at a specific time or schedule)
* **$TA,I=30,'$DU'** - Automate the command in quotes, in this case **DU**, running it every 30 seconds.
* **$TA4,CANCEL** - Cancel automated job number 4.  Use **$TA** to see the list of automated jobs.
* **$TJOBx,C=A** - Change the class on a queued job.  The **CLASS** in JCL
* **$TJOBx,Q=A** - Change the message class on a queued job.  The **MSGCLASS** in JCL
* **$TJOBx,P=priority** - Change the priority of a job
* **$TOSCL,D=J** - change output of commands such as **$DN** so they display the **JOB Number** in addition to the **Job Name**
* **$TPRT3,C=A** - Change job execution classes for printer.  The **CLASS** in JCL
* **$TPRT3,Q=A** - Change output classes for printer.  The **MSGCLASS** in JCL.
$tosc1,d=j

**JES2 Related MVS Commands**

* **D J,jobname** - list detailed info on the specified job
* **C jobname** - terminates the job/process
* **C mf1** - cancels the job that provides stats, but is not needed

### JES2 Statuses

* **Active** - the device or initiator is actively performing a function
* **Inactive** - the device or initiator is available but no jobs are present
* **Draining** - the device or initiator is performing a function, but will not receive new work when completed
* **Drained** - the device or initiator will not receive work and must be restarted with the **$S** command
* **Halting** - similar to **Draining**
* **Halted** - similar to **Drained**
* **Paused** - the printer or punch has been paused.  It can be restarted with the **$S** command

## Hercules commands (no slash as a prefix)

* **devlist** - display a list of devices that you can page up and down
* **MAXRATES** - display the maximimu MIPS and I/O rates for a given period
* **HST** - display a history of the commands entered

# TSO Commands

To run TSO commands, either **F3** out of the menus, or type **TSO <the command>** at an RFE command prompt, or go to the **1 RFE/6 COMMNAND** option.
 
Note that when entering TSO commands that include data sets the primary index (the first part of the DSN before the period) will be the UserID and appended on the front of the DSN you entered.  To indicate a non-user dataset place a fully qualified data set names in single quotes.  For example if you are user HERC02 and enter **SYS2.JCLLIB** it will try to access **HERC02.SYS2.JCLLIB**, so to get the right reference enter **'SYS2.JCLLIB'** in single quotes.

* **DSN** - Without parameters it will list data set names in use by the current users.  Specify **DSN** <the data set name> to get the users or jobs that are currently using that data set
* **LISTCAT** - To list the catalog files FOR the current user
* **LISTSPC** - list space (size) related statistics for a data set of or data sets.  Without any parameters it will prompt for the data ets, otherwise specify them as a parameter.
* **PROFILE** - shows the current profile settings, for example either **MSGID** or **NOMSGID**, **PREFIX(thePrefixName)** or **NOPREFIX** 
* **PROFILE MSGID** - this will set the profile so that Msg IDs are displayed before the TSO message
* **PROFILE NOMSGID** - turns off the display of the Msg ID before the message 
* **PROFILE NOPREFIX** - turns off the default prefix for data sets (your username) so that if you were to type **LISTCAT** you will see all the systems catalogs, not just your own.  If you want to break out of the list select the **PA** key on the c3270 emulator.
* **PROFILE PREFIX(thePrefixName)** - sets the prefix.  Now whenever you use **LISTCAT** it will show the data sets for that prefix.  Use this command to change it back to your username.  
 
# Important Configuration Members

* **SYS1.PARAMLIB(PARMTZ)** - time difference from GMT
* **SYS1.PARAMLIB(PARMTZ-1)** - time difference from GMT during DST
* **SYS1.PARAMLIB(TSOKEY00)** - set **RECONLIM** (Maximum disconnect minutes for TSO Logons)
* **SYS1.PARAMLIB(IRBMF100)** - has **INTERVAL** in it to change how often the **MF1 Report** prints to thee console
* **SYS1.PARAMLIB(smfprm00)** - has **SID** where you can change the System ID (hostname equiv).  Changing it could potential cause  issues with some programs.
* **SYS1.PARAMLIB(VATLST00)** - has the list of **DASD volumes**.  If you add any, make sure to end them to the end, so you won't effect a critical volume during ISL
* **SYS1.JES2PARM(JES2PARM)** - has all the **JES2 parameters**, including **Printer Definitions**
* **SYS1.SYSGEN.CNTL(IOGEN)** - has the mappings between diffrent device types and device Ids.  When creating a new **DASD** device check this Member to make sure the **Cua** device number you are planning to use is valid for that **DASD** Type.

# Connecting to a Console with the c3270 Emulator

The basic procedure here comes from the [TK4- User Manual](http://wotho.ethz.ch/tk4-/MVS_TK4-_v1.00_Users_Manual.pdf).  Refer to this for more details.

You can define additional Consoles (for Entering MVS and JES2 commands) that can be accessed from the c3270 (or any tn3270) emulator.  When **MVS** is **IPL**ed with the **./MVS** shell script in unattended mode the **config/intcons.cnf** config file the main console is defined with the **0009 3215-C** entry   From MVS you can see what console device are define (but not necessarily active) with the **/D U,ALL** commands (they are at the top of the list and have type **3215** and **3277**).

To bring the **0010 3270 CONS** online do the following:

* Type **ATTACH 010 3270 CONS** at the Hercules prompt (either from the existing console or the Web Console).  Notice this is a **Hercules Command** and not an **MVS** or **JES2** command.
* With the **c3270 emulator** logon to the mainframe with **CONS@localhost:3270**.  
* Back at the other main console or Web Inerface type **/VARY 010,CONSOLE,AUTH=ALL**.  This will activate the Console on the **c3270** and should display output similiar to the following:

  ```
  05.39.23           IEE349I CONSOLES
  CONSOLE/ALT     COND   AUTH   ID  AREA    ROUTCD
  010/011         A      ALL    01  Z,A     1-13,15-16
  ```
  The **CONSOLE/ALT** shows the console's **UNIT** (device) number for the console and its designated alternate), the **COND** Condition code (TBD: look these up), the **AUTH** authorization level (in this case the **ALL** specified in the **VARY** command above), the **ID** is important since this is the **Console Name** that is entered for many **MVS** commands that ask for a **Console Name** as a operand, the **AREA** of the console (A,Z here, these are areas on the console screen) and the **ROUTCD** showing what message types are being routed to it
  
  To see this info for all consoles type **DISPLAY CONSOLES** OR **D C**.  Example output:
  
  ```
  05.50.44           IEE250I 05.50.44 CONSOLE DISPLAY 503
  WTO BUFFERS:    CURR =     1      LIM =  250
  CONSOLE/ALT     COND    AUTH   ID AREA  NBUF ROUTCD
    30E/010       H       CMDS   05            ALL
    010/011       A,J     ALL    01 Z,A        1-13,15
    011/01F       N,J     ALL    02 Z,A        1-13,15
    009/010       M,T     ALL    03            1-13,15
    01F/009       N,T     ALL    04            1-13,15
    30E/010       A       NONE   05            ALL
  ```

Note this new **3270** console differs from the main **Hercules console** and the Web Interface console in that it is not necessary to proceed the **MVS** and **JES2** commands with a forward slash.  But since it is not a **Hercules console** you cannot enter **Hercules** commands here.

## Detaching the Console added above

According to the manual, having these extra consoles can cause issues with WTO Buffers during ISL.  To detach the console added above enter this command **detach 010** from the Hercules or Web Console.  Notice this is a **Hercules Command** and not an **MVS** or **JES2** command.  

## Specifying a Console and Dispaly Area

* **Message Area** - at the top of the console
* **Status Area** - below Message area area	 

Many of the commands will take a **L** operand that allows you to specify the display area of a particular console to display the messages on.  It has the format:

**L={a, cc, cca}** where **a** is the **AREA** of the console display (**A** for **Status Area** and **Z** for the **General Message Area** for example); **cc** is the **Console Id/Name** (**L=01** or **L=03** for example); and **cca** is a combination of both (**L=01Z** for example) 

**For Example:**
* **L=Z** - display output to **AREA Z** of the console (The Message AREA) - Can Page Up and Down
* **L=A** - display output to **AREA A** of the console (The Status Area) - Use **K D,F** to scroll forward a frame and **K E,D** to clear the Status Area.

## Message Routing Commands

* **MR D=(U,A),L=Z** - change the output location of D U and D A commands to the **Z (Message Area**)
* **MR D=A** - remove the message routing for the D A command
* **MR REF** - Show the currently defined **Message Routes**
* **MR NONE** - remove all message routing commands

## Action vs Non-Action Messages

**Action Messages** are those messages in the **Message Area** that require a response from the operator using the **REPLY** command 
## Deleting Messages

* To **non-action messages** from the **Message Area** using the cursor on the message line you want to delete and hit return, this message and all messages above will be deleted
* To delete **action message** with cursor postion cursor on the astricks or @ and press enter.

## Console Keyboard

**D PFK**	 - display function key assignments fir the console.  These can be defined with custom settings.

**A Few Default Examples**:

* **PA2** - Cancel
* **F1** - Remove top line displayed in Message area, shifting others up - K E,1
* **F7** - clear the status area - K E,D
* **F8** - scroll the status area forward one record K D,F
	

# ISSUES

## SORT Utility

From: [Hercules FAQ](http://www.jaymoseley.com/hercules/faq/mvsfaq04.htm#USER027)

Why do I receive the message: IER040A INSUFFICIENT WORK UNITS when I attempt to use the MVT Sort/Merge program under MVS 3.8?

The MVT Sort/Merge utility requires at least three (and may use up to a maximum of 32) intermediate storage datasets.  Unlike current Sort/Merge utilities (such as DFSORT or Syncsort), the MVT Sort/Merge is unable to dynamically allocate datasets for use as intermediate storage.  You must supply DD statements for the DD Names SORTWK01, SORTWK02, SORTWK03 ... SORTWK32.  Also the SORTWK?? datasets must reside on 2311/2314 DASD.  Although some efforts have been reported of using tape datasets with the MVT Sort/Merge under Hercules, it is probably a better idea to utilize DASD for the SORTWK?? datasets.  If the MVT Sort/Merge is called indirectly (as by a COBOL program that includes the SORT verb), you must also supply SORTWK?? DD cards to the EXEC step.

## JES2 Resource Shortage

I received a **JES2 Resource Shortage** message which froze my 3270 termial.  I was unable to log back on because I could not terminate the users **TSO** session with the **/C U=UserName** system console command (it just didn't do anything, it normally works fine).  I tried to logon with another user and it would just get stuck indefinately at the logon screen.

Turns out I could not run any commands that rely on **JES2**, which is a lot, including a lot of services need to reboot the system (ISL) to the **TSO** logon.  It couldn't get past trying to load the **BSPPILOT** job which is used for automating a lot off the **ISL** process.  On restart it would show the **JES2 Resource Shortage - JOES** message, which relates to the output queue.

I finally solved the problems by purging a lot of jobs using the **$PJOB #-#** command to purge a range of jobs (**$PJOB 5-100** for example).  I had almost 200 jobs initially, and I purged just about everything other than the most recent runs.  I wanted to just shut shutdown the **JES2** and restart it again without having to reboot the entire system again, but I had issues with providing the necessary reply to the **/$PJES2,ABEND** command from the Hercules prompt.  I tried both with and without the **/** prefix to enter the confirmation reply.  I eventually just rebooted the system and this fixed the problem.

In the future I need to keep an eye on the number of jobs in the output queue (I like to specify they be held so I can look at the output their, rather than having it sent to the printer).  I will need to periodically purge these (keep them under 100), or go through the **JES2 procedures** for increasing the amount of resources available to this queue.

