# Overview

Notes on the Hercules IBM MVS mainframe \(System/370, System/390, and zSeries/System z\) emulator, using the ready to use **MVS 3.8j Tur(n)key 4- \("TK4-"\)** preconfigured system, which can be found [here](http://wotho.ethz.ch/tk4-/).  It is available for both Linux and Windows, these notes are based on an Ubuntu 17.04 setup.

I come at this from the perspective of having extremely limited mainframe experience (JCL and COBOL classes back in the mid 1980s), with most of my experience being in the Windows/Mac/Linux/Unix world, with a few years of VMS work experience in the late 80s early 90s.  But I have always had an interest in knowing what it was like to work in a mainframe enviornment, this emulation software allows me to get a flavor of that (from the software/OS side anyway, not so much the hardware)

# References

## Main **MVS 3.8j Tur(n)key 4- \("TK4-"\)** site
* [Main site](http://wotho.ethz.ch/tk4-/)
* [User Manual](http://wotho.ethz.ch/tk4-/MVS_TK4-_v1.00_Users_Manual.pdf)

## Excellent series of YouTube videos by [moshix](https://www.youtube.com/channel/UCR1ajTWGiUtiAv8X-hpBY7w)

* [How to Install and Operate the MVS turnkey TK4 system](https://www.youtube.com/watch)
* [Editing and Executing a COBOL program](https://www.youtube.com/watch?v=YA3FQOzr0ag)
* [Using the Hercules mainframe console](https://www.youtube.com/watch)

# Installation on Ubuntu (should be similar for windows)

* Download the "Current TK4- System" zip file from [here](http://wotho.ethz.ch/tk4-/)
* Create a directly and unzip the download file
* Install a 3270 terminal emulator such as `sudo apt install x3270` for an X Window emulator or `sudo apt install c3270` for a cursor based console program, which is what I'm currently using.
* In the directory that the emulator was unzipped in, run the command `set_console_mode` in the **unattended** directory.  This will allow you to see what's happening on the console by starting the system manually rather than running as a daemon.
* In the directory that the emulator was unzipped run **`./mvs`** to start the emulated system.  You will see a lot of text scroll by as the system boots up. This screen has the Hercules command prompt.  You can toggle back and forth between this screen and a monitor screen that shows IO and MIPs statistics, along with showing the attached devices /(printers, readers, punch card, tapes consoles, display units etc/) most of which are virtual and correspond to subdirectories in the emululator directory.
* When the system finishes booting connect with the 3270 emulator.  Press return and logon.  Preconfigured logons and passwords include:
  * **HERC01** - a fully authorized user **with** full access to the RAKF users and profiles tables. The password is **CUL8TR**
  * **HERC02** - a fully authorized user **without** full access to the RAKF users and profiles tables. The password is also **CUL8TR**
  * **HERC03** - a regular user with the password is **PASS4U**
  * **HERC04** - a regular user with the password **PASS4U**
 * After logging in with HERC01 and pressing return a couple of times a menu of available options is presented, which will be examined in more detail in the rest of these notes.
 
# Directory Structure (the unzip location)

* **conf** - the Hercules configuration files
* **dasd** - the location of the virtual DASD (direct access storage devices) disk images
* **doc** - documentaton
* **hercules** - the emulator executables
* **jcl** - the JCL /(Job Control Language/) files
* **log** - log files for job runs and the storage location for punch card image output
* **prt** - print directory for printer output
* **rdr** - card images to submit to the reader in MVS
* **unattended** - contains the **set_console_mode** script to enable console mode in which you start the system with the `./mvs` script rather than having it run as a daemon.
