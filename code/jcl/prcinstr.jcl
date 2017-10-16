//HERC02   JOB (ACCNT),'iefbr14',
//* USER=HERC02,PASSWORD=xxxxxxxx
//*
//* Demos the use of a proc.  It doesn't do anything practical,
//* it just show the flow when looking at the output.
//*
//         CLASS=A,
//         MSGCLASS=H,
//         MSGLEVEL=(1,1),
//         NOTIFY=HERC02
//PTEST    PROC
//PSTA     EXEC PGM=IEFBR14
//DDA      DD DSN=HERC02.AOK.DATA2,DISP=SHR
//DDB      DD DSN=HERC02.AOK.DATA2,DISP=SHR
//DDOUT    DD SYSOUT=*
//PSTB     EXEC PGM=IEFBR14
//DDC      DD DSN=HERC02.AOK.DATA2,DISP=SHR
//DDREP    DD SYSOUT=A
//         PEND
//STEP1    EXEC PROC=PTEST
//PSTA.IN  DD *
TEST TEXT 1
TEST TEXT 2
TEST TEXT 3
TEST TEXT 4
/*
