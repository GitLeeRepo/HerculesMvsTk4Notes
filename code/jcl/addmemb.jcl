//HERC02UP JOB (ACCNT),'IEBUPDTE',CLASS=A,MSGCLASS=X
//* USER=HERC02,PASSWORD=xxxxxxxx
//********************************************************************
//*
//*  Name: SYS2.JCLLIB(IEBUPDTE)
//*
//*  Desc:  add members to new data set
//*         if adding members to an existing data set
//*         then Update the DISP of SYSUT2
//*
//*
//********************************************************************
//*
//*
//AMP#UPD  EXEC PGM=IEBUPDTE,PARM='NEW'
//SYSUT2   DD  DISP=(,CATLG),DSN=HERC02.TEST.JCL02,
//         UNIT=SYSALLDA,SPACE=(TRK,(20,20,41),RLSE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=19040)
//SYSPRINT DD  SYSOUT=*
//SYSIN    DD  *
./        ADD   LIST=ALL,NAME=NEWMEMB
                Just an example: can be deleted
./        ADD   LIST=ALL,NAME=TRASH2
./     NUMBER   NEW1=10,INCR=10
                Just an example: can be deleted
./        ENDUP
