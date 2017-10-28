//HERC02  JOB (ASM),'ASM HELLO WORLD',                                  00000100
//            CLASS=A,                                                  00000200
//            MSGCLASS=A,                                               00000300
//            MSGLEVEL=(1,1),                                           00000400
//            REGION=128K                                               00000511
//HELLO   EXEC ASMFCLG                                                  00000600
//ASM.SYSUT1 DD UNIT=SYSDA,SPACE=(1700,(400,50))                        00000700
//ASM.SYSUT2 DD UNIT=SYSDA,SPACE=(1700,(400,50))                        00000800
//ASM.SYSUT3 DD UNIT=SYSDA,SPACE=(1700,(400,50))                        00000900
//ASM.SYSGO  DD UNIT=SYSDA,SPACE=(80,(200,50))                          00001000
//ASM.SYSIN  DD *                                                       00001100
HELLO    CSECT                                                          00001200
         USING HELLO,15                                                 00001300
         SAVE (14,12)                                                   00001400
         WTO 'HELLO WORLD!'          WRITES TO THE CONSOLE              00001509
         RETURN (14,12),RC=0                                            00001600
         END                                                            00001700
/*                                                                      00001801
//LKED.SYSLMOD  DD   DSN=SYS2.CMDLIB(TKGO),                             00001909
//*           SPACE=(1024,(50,20,1)),                                   00002008
//            DISP=(OLD,CATLG),UNIT=SYSDA                               00002110
//                                                                      00002200

