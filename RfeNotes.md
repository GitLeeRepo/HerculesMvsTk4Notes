# Overview

Notes on the RFE (Review Front End) productivity tool for TK4- on Hercules MVS emulator

# References

* [HerculesMvsTk4Notes](HerculesMvsTk4Notes)

# General Commands That Apply Most Areas

* **<F3>** - move back up a level in the menu
* **START** - starts a new Review Session that you can switch back and forth between using **SWAP** command
* **SWAP** - change to another Review Session that was created with **START**

# Editing Data Set

## General

### Commands while viewing list of data set or members





* **EXIT**, **END**, **=x** - terminate the whole review session
* **RECALL**, **RETRIEVE** - recall the prior command
* **e** - edit/display an entry (make sure you are on the front of the line for that entry)

### Basic Navigation in text file

* **arrow keys** - move up and down lines, left and right a character
* **<F7>** - Page down
* **<F8>** - Page up
* **TOP** - Move to the first record (first page of file)
* **BOTTOM**, **BOT** - Move to the last record (last page of file)
* **END** - end a command
* **CANCEL**, **CAN** - same as **END** but user profile changes not saved (way to cancel changes made to a file)
* **TSO** - issue a **TSO** command.  Example, **TSO DSN** to list the logged on user's catalogs.  It will switch to another screen to show the output, simply press **enter** to return to where you were.

**Line Editing Commands**

You make line editing commands by typing the command at the beginning of the line (in the control area, not the text file area)

* **C** - Mark lines to be copied, you can specify the number of lines to be copied with **C#** (# the number).  Do NOT press **enter** until you have also select the destination with either **A** (for after) or **B** (before) on the beginning of the target line.  Once both the copy and destination markers have been placed press **enter**
* **A** - Mark the line to paste the contents of a **C** **after**.  You can specify the number of times to paste the copied buffer by providing the number on the end of the command **A4** for example.  Refer to **C** copy for the complete copy paste procedure
* **B** - Mark the line to paste the contents of a **C** **before**.  You can specify the number of times to paste the copied buffer by providing the number on the end of the command **A4** for example.  Refer to **C** copy for the complete copy paste procedure
* **D** - Delete the target line.  To delete multiple lines provide a number after the command **D4** for example
* **I** - Insert a line after the target line.  To delete multiple lines provide a number after the command **D4** for example




## Sequential (PS) Specific


## PDS Specific


