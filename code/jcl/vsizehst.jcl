//HERC02   JOB (COBOL),'TK',                                            00000114
//             USER=HERC02,PASSWORD=CUL8TR,                             00000214
//             CLASS=A,                                                 00000300
//             MSGCLASS=H,                                              00000414
//             REGION=8M,TIME=1440,                                     00000511
//             MSGLEVEL=(1,1)                                           00000600
//********************************************************************  00000700
//* Name: HERC02.JCLLIB(COB01)                                          00000800
//*                                                                     00000900
//* Desc: Compile a COBOL program from a data source                    00001000
//********************************************************************  00001100
//COMPILE  EXEC COBUCLG,                                                00001213
//         PARM.COB='FLAGW,LOAD,SUPMAP,SIZE=2048K,BUF=1024K'            00001300
//COB.SYSPUNCH DD DUMMY                                                 00001400
//COB.SYSIN    DD DISP=SHR,DSN=HERC02.AOK.COBOL(VSIZEHST)               00001518
//COB.SYSLIB   DD DSNAME=SYS1.COBLIB,DISP=SHR                           00001600
//GO.PRGOUT    DD DSN=HERC02.RPT.VSIZEHST,DISP=(MOD,CATLG),             00001719
// UNIT=SYSALLDA,SPACE=(TRK,(4,2)),                                     00001816
// DCB=(LRECL=80,RECFM=FB,BLKSIZE=800,DSORG=PS)                         00001914
//GO.SYSIN     DD DISP=SHR,DSN=HERC02.AOK.DATA(VOLSIZE1)                00002000
//*O.PRGOUT    DD SYSOUT=*                                              00002113
//GO.SYSOUT    DD SYSOUT=A                                              00002209
//                                                                      00002300

