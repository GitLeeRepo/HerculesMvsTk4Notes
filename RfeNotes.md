# Overview

Notes on the RFE (Review Front End) productivity tool for TK4- on Hercules MVS emulator

# References

* [HerculesMvsTk4Notes](HerculesMvsTk4Notes)
* [ISPF Editing Commands](https://www.youtube.com/watch?v=-FUNDgcDRWk) - YouTube video for the **ISPF** (IBM's ver) which is very similar to **RFE**

# Panels

The individual screens in **RFE** are refer to as **Panels**.  You can navigate to a panel by traversing the menu tree.  You can also more directly access particular panels using the panel numbers, separating each nested panel by a period.  For example, type **=3.4** in any other panels command prompt will take you to the **DSLIST** panel, because to get to it you navigate first to **3 Utiities** and second to **4. DSList**.  Other commands use this notation such as  **START 3.2**  will start a new Review Session on the **DATASET**

# General Commands That Apply Most Areas

* **<F3>** - move back up a level in the menu
* **START** - starts a new Review Session that you can switch back and forth between using **SWAP** command.  If no parameter is supplied it will open the new session at the root of the RFE menus.  You can specify a specific RFE menu item as the starting point, for example **START 3.4** starts the new session in the **DSLIST** panel.
* **SWAP** - change to another Review Session that was created with **START**.  Parameters:
  * **LIST** - list the current Review sessions
  * **NEXT** - switch to the next Review session
  * **PREV** - switch to the prior Review session
  * **#** - switch to the specified Review session number
  * **'name'** - switch to the specified Review session name.
* **EXIT**, **END**, **=x** - terminate the whole review session
* **RECALL**, **RETRIEVE** - recall the prior command
* **TSO** - issue a **TSO** command.  Example, **TSO DSN** to list the logged on user's catalogs.  It will switch to another screen to show the output, simply press **enter** to return to where you were.


# Editing Data Set

## General

### Commands while viewing list of data set or members

TBD

### Basic Navigation and commands in text file

* **arrow keys** - move up and down lines, left and right a character
* **\<F7\>** - Page down
* **\<F8\>** - Page up
* **TOP** - Move to the first record (first page of file)
* **BOTTOM**, **BOT** - Move to the last record (last page of file)
* **END** - end a command
* **CANCEL**, **CAN** - same as **END** but user profile changes not saved (way to cancel changes made to a file)
* **RESET** - reset the editor.  Useful if you have issues with your line commands an want to clear the commands from the left pane
* **COPY** - Copy those lines marked with **C** to a specified data set.  If none is provided you will be prompted to enter a sequential data set name.

**Line Editing Commands**

Applies to when editing a **sequential PS dataset** or the **member** of a **PDS**

You make line editing commands by typing the command at the beginning of the line (in the control area, not the text file area)

* **C** - Mark line(s) to be copied, you can specify the number of lines to be copied with **C#** (# the number).  Do NOT press **enter** until you have also select the destination with either **A** (for after) or **B** (before) on the beginning of the target line.  Once both the copy and destination markers have been placed press **enter**.  To mark a group of lines to copy type **CC** on the fist line in the group and **CC** again for the last line in the group.
* **A** - Mark the line to paste the contents of a **C** **after**.  You can specify the number of times to paste the copied buffer by providing the number on the end of the command **A4** for example.  Refer to **C** copy for the complete copy paste procedure
* **B** - Mark the line to paste the contents of a **C** **before**.  You can specify the number of times to paste the copied buffer by providing the number on the end of the command **A4** for example.  Refer to **C** copy for the complete copy paste 
* **M** - Mark line(s) to be moved.  Refer the the **C** info since everything else is the same procedure as copying lines.
* **D** - Delete the target line.  To delete multiple lines provide a number after the command **D4** for example.  To delete a group of lines mark the start of the group with **DD** and the end of the group with **DD** and press **enter**
* **I** - Insert a line after the target line.  To insert multiple lines provide a number after the command **I4** for example
* **R** - Repeat the current line on the next line.  To repeat the line multiple times provide a number after the command **R4** for example.  To mark multiple lines to repeat (**Group Repeat**) type **RR** for the start and end lines and then **enter** to repeat the group starting at the next line.
* **\<DEL\>** - Delete the character at the curs
* **\<INS\>** - Toggle insert mode, which is off by default.  Note that within a text file insert mode will not allow you to push the characters beyond the current last character (regardless of not being at the end of the record).  The only way I have found to do this is to add extra spaced on the end of the line to provide enough of a buffer for the shifted line to move into.  The extra spaces are not retained.
* **UC** - Convert the entire line to uppercase.  As with other commands numeric qualifiers can be used for multiple commands.
* **LC** - Convert the entire line to lowercase.  As with other commands numeric qualifiers can be used for multiple commands

## DaSequential (PS) Specific

TBD

## PDS Specific

### While in the PDS on the Command Prompt

* **SELECT MemberName** or **S MemberName** - Will load the member in the editor if they exist and will  **create a New Member**  if they don't, typing **S /<The New Member Name\>** will create a New Member and place you in the editor.

### While in the PDS Next to a Member on the List

* **D** - Delete the selected member
* **N** - Rename the selected member

