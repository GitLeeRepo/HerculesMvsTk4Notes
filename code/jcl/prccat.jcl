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
//STEP1    EXEC PROC=PROCTEST
//PSTA.IN  DD *
TEST TEXT 1
TEST TEXT 2
TEST TEXT 3
TEST TEXT 4
/*
