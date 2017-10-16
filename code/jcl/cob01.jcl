//HERC02   JOB (COBOL),
//             'TK',
//             CLASS=A,
//             MSGCLASS=H,
//             REGION=8M,TIME=1440,
//             MSGLEVEL=(1,1)
//********************************************************************
//* Name: HERC02.JCLLIB(COB01)
//*
//* Desc: Compile a COBOL program from a data source
//********************************************************************
//COMPILE  EXEC COBUCG,
//         PARM.COB='FLAGW,LOAD,SUPMAP,SIZE=2048K,BUF=1024K'
//COB.SYSPUNCH DD DUMMY
//COB.SYSIN    DD DISP=SHR,DSN=HERC02.AOK.COBOL(VSIZEHST)
//COB.SYSLIB   DD DSNAME=SYS1.COBLIB,DISP=SHR
//GO.SYSOUT    DD SYSOUT=*,DCB=(RECFM=FB,LRECL=80,BLKSIZE=800)
//GO.SYSIN     DD DISP=SHR,DSN=HERC02.AOK.DATA(VOLSIZE1)
//*               DCB=(RECFM=FB,LRECL=80.BLKSIZE=19040)
//
