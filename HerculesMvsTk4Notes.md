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
* Install a 3270 terminal emulator such as `sudo apt install x3270` for an X Window emulator or `sudo apt install c3270` for a cursor based console program.  I'm currently using the console based one.
