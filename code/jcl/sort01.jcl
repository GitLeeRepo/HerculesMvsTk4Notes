//HERC02   JOB (ACCNT),'iefbr14',
//* USER=HERC02,PASSWORD=xxxxxxxx
//*
//* Note: there is an issue with SORT on Hercules
//*       refer to my GitHub notes
//*
//         CLASS=A,
//         MSGCLASS=H,
//         MSGLEVEL=(1,1),
//         NOTIFY=HERC02
//SORT01   EXEC PGM=SORT
//SYSIN    DD *
   SORT      FIELDS=(1,75,CH,A)
/*
//SYSOUT   DD SYSOUT=*
//SORTIN   DD *
NEPTUNE
PLUTO
EARTH
VENUS
MERCURY
MARS
URANUS
SATURN
JUPITER
/*
//SORTOUT    DD SYSOUT=*
/*
