//HERC02  JOB (ASM),'REORDER LIST',                                     00000101
//            CLASS=A,                                                  00000200
//            MSGCLASS=H,                                               00000302
//            MSGLEVEL=(1,1),                                           00000400
//            REGION=128K                                               00000500
//HELLO   EXEC ASMFCLG                                                  00000600
//ASM.SYSUT1 DD UNIT=SYSDA,SPACE=(1700,(400,50))                        00000700
//ASM.SYSUT2 DD UNIT=SYSDA,SPACE=(1700,(400,50))                        00000800
//ASM.SYSUT3 DD UNIT=SYSDA,SPACE=(1700,(400,50))                        00000900
//ASM.SYSGO  DD UNIT=SYSDA,SPACE=(80,(200,50))                          00001000
//ASM.SYSIN  DD *                                                       00001100
REORDLST START 0                     BLOCK 1: HOUSEKEEPING              00001200
BEGIN    SAVE  (14,12)                                                  00001302
         BALR  3,0                                                      00001401
         USING *,3                                                      00001500
         ST    13,SAVE+4                                                00001600
         LA    13,SAVE                                                  00001700
*        WTO   'PRE-OPEN'                                               00001807
         OPEN  (INVMAST,INPUT,PRTOUT,OUTPUT)                            00001900
*        WTO   'POST-OPEN'                                              00002007
READINV  GET   INVMAST,INVWRKA        BLOCK 2: READ RECORD              00002100
*        WTO   'POST-GET'                                               00002207
         PACK  WRKAVAIL,INVONHND      BLOCK 3: CALCULATE AVAILABLE      00002302
         PACK  WRKONORD,INVONORD                                        00002400
         AP    WRKAVAIL,WRKONORD                                        00002500
         PACK  WRKORDPT,INVORDPT      BLOCK 4: DECISION                 00002601
*        WTO   MF=(E,INVITDES)                                          00002706
         CP    WRKAVAIL,WRKORDPT                                        00002800
         BNL   READINV                                                  00002900
         PACK  PACKAREA,INVITNBR      BLOCK 5: CONSTRUCT DETAIL LINE    00003001
         MVC   PRTITNBR,PATTERN1                                        00003100
         ED    PRTITNBR,PACKAREA                                        00003202
*        MVC   PRTITNBR,INVITNBR       TESTING                          00003307
         MVC   PRTITDES,INVITDES                                        00003407
         PACK  PACKAREA,INVPRICE                                        00003500
         MVC   PRTPRICE,PATTERN2                                        00003600
         ED    PRTPRICE,PACKAREA                                        00003700
         MVC   PRTPRICE,INVPRICE       TESTING                          00003807
         MVC   PRTAVAIL,PATTERN1                                        00003900
         ED    PRTAVAIL,WRKAVAIL                                        00004000
         MVC   PRTAVAIL,INVONHND       TESTING                          00004107
         MVC   PRTORDPT,PATTERN1                                        00004200
         ED    PRTORDPT,WRKORDPT                                        00004300
         MVC   PRTORDPT,INVORDPT       TESTING                          00004407
*        WTO   'PRE-PRINT'                                              00004507
         PUT   PRTOUT,PRTWRKA         BLOCK 6: PRINT LINE               00004606
*        WTO   'POST-PRINT'                                             00004707
         B     READINV                UNCONDITIONAL BRANCH              00004801
INVEOF   CLOSE (INVMAST,,PRTOUT)      END-OF-JOB ROUTINE                00004901
         L     13,SAVE+4                                                00005000
         WTO   'PRE-CLOSE'                                              00005106
         RETURN (14,12),RC=0                                            00005207
* THE INVENTORY FILE DEFINITION FOLLOWS                                 00005300
INVMAST  DCB   DSORG=PS,RECFM=F,MACRF=GM,BLKSIZE=50,LRECL=50,          X00005400
               DDNAME=INVMAST,EODAD=INVEOF                              00005500
* THE PRINTER FILE DEFINITION FOLLOWS                                   00005600
PRTOUT   DCB   DSORG=PS,RECFM=F,MACRF=PM,BLKSIZE=132,LRECL=132,        X00005700
               DDNAME=PRTOUT                                            00005800
* THE DATA DEFINITION FOR THE INVENTORY FILE WORK AREA                  00005900
INVWRKA  DS    0CL50                                                    00006000
INVITNBR DS    CL5                                                      00006100
INVITDES DS    CL20                                                     00006200
         DS    CL5                                                      00006300
INVPRICE DS    CL5                                                      00006400
INVORDPT DS    CL5                                                      00006500
INVONHND DS    CL5                                                      00006600
INVONORD DS    CL5                                                      00006700
* THE DATA DEFINITION FOR THE PRINTER WORK AREA                         00006800
PRTWRKA  DS    0CL132                                                   00006900
PRTITNBR DS    CL5                                                      00007007
         DC    5C' '                                                    00007100
PRTITDES DS    CL20                                                     00007200
         DC    4C' '                                                    00007300
PRTPRICE DS    CL7                                                      00007400
         DC    4C' '                                                    00007500
PRTAVAIL DS    CL6                                                      00007600
         DC    4C' '                                                    00007700
PRTORDPT DS    CL6                                                      00007800
         DC    70C' '                                                   00007900
* THE DATA DEFINITION FOR OTHER REQUIRED WORK AREAS                     00008000
SAVE     DS    18F                                                      00008100
PATTERN1 DS    X'402020202020'                                          00008200
PATTERN2 DS    X'402020214B2020'                                        00008300
WRKAVAIL DS    PL3                                                      00008400
WRKONORD DS    PL3                                                      00008500
WRKORDPT DS    PL3                                                      00008600
PACKAREA DS    PL3                                                      00008700
         END   BEGIN                                                    00008800
/*                                                                      00008900
//LKED.SYSLMOD  DD   DSN=HERC02.TEST.LOADLIB(REORDLST),                 00009002
//*           SPACE=(1024,(50,20,1)),                                   00009100
//            DISP=(OLD,CATLG),UNIT=SYSDA                               00009200
//GO.INVMAST  DD DISP=SHR,DSN=HERC02.DATA.REORDLST                      00009304
//GO.PRTOUT   DD SYSOUT=*                                               00009403
//                                                                      00009500
