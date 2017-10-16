# Overview

Notes on the RFE (Review Front End) productivity tool for TK4- on Hercules MVS emulator.  This is a replacement for the **IBM ISPF** productivity tool, with most of the same functionality, and similar screen layout.

# References

* [HerculesMvsTk4Notes](HerculesMvsTk4Notes)
* [ISPF Editing Commands](https://www.youtube.com/watch?v=-FUNDgcDRWk) - YouTube video for the **ISPF** (IBM's ver) which is very similar to **RFE**
* [ISPF Features](https://www.youtube.com/watch?v=vOiHiI7b9iY) - YouTube - more professionally done than the prior, although the prior one is very good also.

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

# Creating a Data Set

Using **3 Utilities** / **2 DATASET**

Note if you want to base your data set on an exiting one, then before allocating a data set with the **A** command, you can model your data set on an exiting data set by entering the existing name on the **DATA SET NAME** line, pressing **Enter**, which will display its definition screen, press **Enter** again to return to the Dataset Utility screen.  Now when you type **A** on the **COMMAND** line and enter the dataset name (make sure to replace the exiting one you just used) the new one will use all the paramaters (Record size, block size, etc) of the prior one.  You can still make changes to it if you want some variations.

# Editing Data Set

## General

## Basic Navigation and commands in text file

* **arrow keys** - move up and down lines, left and right a character
* **\<F7\>** - Page down
* **\<F8\>** - Page up
* **TOP** - Move to the first record (first page of file)
* **BOTTOM**, **BOT** - Move to the last record (last page of file)
* **END** - end a command
* **CANCEL**, **CAN** - same as **END** but user profile changes not saved (way to cancel changes made to a file)
* **RESET** - reset the editor.  Useful if you have issues with your line commands an want to clear the commands from the left pane
* **COPY** - Import (Copy) the contents of another data set or Member into the current file.  Refer to the **Importing (Copying) text...*** section below for details.

## Primary Commands 

Primary Commands are the commands entered on the Command line at the top of the screen while editing a Member or Sequential PS data set.

* **PROFILE** - show your editor profile setting such as Cap State, Syntax Highlighting
* **CHANGE** or **C** - Search and replace, for example **C THIS THAT ALL** will change all occurances of THIS to THAT
* **COLS** - display a columns ruler at the top of the page so you can easily see the column positon, which otherwise isn't as obvious since the sequence numbers at the start of the edit area are also included on the column number shown on the lower right.  So for example in a COBOL program in which you must start in column 8, the lower right number will show 16 instead of 8, whereas the ruler shows the correct posistion.
* **CUT** - Copies the text marked with with the "**C* or **CC** block line commands into the clipboard.  You can append to existing clipboard text by adding an **A** parameter, **CUT A** (it does not remove it from the original in the Windows notion of cut).  The **D** parameter will discard the prior clipboard text.
* **PASTE** - Pastes the text copied with **CUT** to the location specified by the **A** after line command.  This does not have to be in the same data set but can be pasted into another data set.
* **COPY** Primary Command is used to import the entire contents of another sequential PS data set or from a Member in a PDS data set, into the current data set/member records.  This is done by marking the location to insert the text using the **A** after line command and typing **COPY** on the Command Line.  It will then prompt you for a sequential data set name to copy **from**.  You can enter the dataset name for a **PS** data set, ex. **HERC02.TEST.SEQDS**, of for a **Member** in a **PO** data set the full data set name(member) notation, for example **HERC02.TEST.MYPDS(MEMBERNAME)**.  In both cases, assuming they exist, they will be inserted after pressing **Enter**.  You can also import (copy) a **Member** from within the same data set you are in.  In this case you can simply type **COPY MemberName** on the commands line of the file you are inserting into (currently marked with an **A** line command to insert the copied text after that line. 
* **NULLS** - toggle nulls on and off.  **IMPORTANT: to be able to use insert mode to move text to the right you must set NULLS ON**.  You can check the current **NULLS** setting by typing **PROFILE** on the command line.  With **NULLS** set off the remainder of the record after the last alpha numeric character is filled with spaces, which is why you can't push the text to the right, the entire record is full.  This would make sense for a data record.

## Line Editing Commands

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
* **)#** - Shift the text on the line the specified number of characters to the right
* **(#** - Shift the text on the line the specified number of characters to the left
* **))#** - Shift the group of lines the specified number of characters to the right
* **((#** - Shift the group of lines the specified number of characters to the left

**Function Keys**
* **F1** - Help
* **F2** - Split
* **F3** - End Edit - changes saved returning to prior screen
* **F5** - RFind - Find the next search occurance
* **F6** - RChange - Change the next replace
* **F7** - Pg Up
* **F8** - Pg Down
* **F9** - Swap
* **F10** - Shift the screen left
* **F11** - Shift the screen right
* **F12** - Cancel Edit - changes abandoned



## DaSequential (PS) Specific

TBD

## PDS Specific

### While in the PDS on the Command Prompt

* **SELECT MemberName** or **S MemberName** - Will load the member in the editor if they exist and will  **create a New Member**  if they don't, typing **S /<The New Member Name\>** will create a New Member and place you in the editor.

### While in the PDS Next to a Member on the List

* **D** - Delete the selected member
* **N** - Rename the selected member

