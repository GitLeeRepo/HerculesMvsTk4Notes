       IDENTIFICATION DIVISION.                                         00000100
       PROGRAM-ID.  'VSIZEHST'.                                         00000230
      ****************************                                      00000300
      * PROCESS VOLUME SIZE DATA                                        00000400
      ****************************                                      00000500
       ENVIRONMENT DIVISION.                                            00000600
       INPUT-OUTPUT SECTION.                                            00000700
       FILE-CONTROL.                                                    00000800
            SELECT VSH-FILE ASSIGN TO UT-S-SYSIN.                       00000900
            SELECT RPT-OUT  ASSIGN TO UT-S-SYSOUT.                      00001027
            SELECT OUT-FILE ASSIGN TO DA-S-PRGOUT.                      00001116
                                                                        00001200
       CONFIGURATION SECTION.                                           00001300
       SOURCE-COMPUTER.  IBM-370.                                       00001419
       OBJECT-COMPUTER.  IBM-370.                                       00001519
                                                                        00001600
       DATA DIVISION.                                                   00001700
       FILE SECTION.                                                    00001800
       FD  VSH-FILE                                                     00001900
           RECORDING MODE IS F                                          00002000
           RECORD CONTAINS 80 CHARACTERS                                00002100
           BLOCK CONTAINS 238 RECORDS                                   00002200
           LABEL RECORDS ARE STANDARD                                   00002300
           DATA RECORDS IS VSH-RECORD.                                  00002400
       01  VSH-DATA             PIC X(80).                              00002523
                                                                        00002618
       FD  OUT-FILE                                                     00002721
           RECORDING MODE IS F                                          00002813
           RECORD CONTAINS 80 CHARACTERS                                00002913
           BLOCK CONTAINS 10 RECORDS                                    00003013
           LABEL RECORDS ARE STANDARD                                   00003113
           DATA RECORDS IS OUT-RECORD.                                  00003213
       01  OUT-DATA             PIC X(80).                              00003324
                                                                        00003426
       FD  RPT-OUT                                                      00003527
           LABEL RECORDS ARE OMMITTED                                   00003626
           DATA RECORDS IS RPT-RECORD.                                  00003728
       01  RPT-DATA             PIC X(80).                              00003827
                                                                        00003926
                                                                        00004012
       WORKING-STORAGE SECTION.                                         00004100
                                                                        00004217
      ** RECORD LAYOUTS                                                 00004323
       01  VSH-RECORD.                                                  00004423
           02  FILLER           PIC A(25).                              00004523
           02  VOLSIZE-IN       PIC 9(8).                               00004623
           02  FILLER           PIC A(1).                               00004723
           02  SNAPDATE-IN      PIC X(12).                              00004823
           02  FILLER           PIC A(1).                               00004923
           02  VOLNAME-IN       PIC X(10).                              00005023
           02  FILLER           PIC A(23).                              00005123
       01  OUT-HEADER.                                                  00005231
           02  REC-TYPE-OHDR    PIC A VALUE 'H'.                        00005331
           02  FILLER           PIC A(2).                               00005431
           02  TITLE-HDR        PIC X(17) VALUE 'VOLUME SIZES DATA'.    00005531
           02  FILLER           PIC A(60).                              00005631
       01  OUT-RECORD.                                                  00005724
           02  REC-TYPE-OUT     PIC A VALUE 'D'.                        00005831
           02  FILLER           PIC A(2).                               00005924
           02  VOLNAME-OUT      PIC X(10).                              00006024
           02  FILLER           PIC A(3).                               00006124
           02  VOLSIZE-OUT      PIC 9(8).                               00006224
           02  FILLER           PIC A(56).                              00006324
       01  OUT-FOOTER.                                                  00006429
           02  REC-TYPE-OTR     PIC A VALUE 'F'.                        00006530
           02  FILLER           PIC A(2).                               00006630
           02  TOTAL-LABEL-OTR  PIC X(18) VALUE 'TOTAL VOLUME SIZE:'.   00006729
           02  FILLER           PIC A(5).                               00006829
           02  VOLSIZE-SUM-OTR  PIC 9(11).                              00006929
           02  FILER            PIC A(43).                              00007030
       01  RPT-RECORD.                                                  00007129
           02  VOLNAME-RPT      PIC X(10).                              00007227
           02  FILLER           PIC A(3).                               00007325
           02  VOLSIZE-RPT      PIC ZZ,ZZZ,ZZ9.                         00007427
           02  VOLSIZE-SUM-RPT  PIC ZZ,ZZZ,ZZZ,ZZ9.                     00007527
           02  FILLER           PIC A(53).                              00007625
       01  RPT-FOOTER.                                                  00007728
           02  TOTAL-LABEL-FTR  PIC X(18) VALUE 'TOTAL VOLUME SIZE:'.   00007829
           02  FILLER           PIC A(5).                               00007929
           02  VOLSIZE-SUM-FTR  PIC ZZ,ZZZ,ZZZ,ZZ9.                     00008029
           02  FILER            PIC A(46).                              00008129
                                                                        00008223
      ** VARIABLE DEC                                                   00008318
                                                                        00008418
       01  EOF                  PIC 9 VALUE 0.                          00008523
       01  VOLSIZE-SUM          PIC 9(11) VALUE 0.                      00008621
                                                                        00008717
       PROCEDURE DIVISION.                                              00008800
                                                                        00008900
       MAIN-ROUTINE.                                                    00009000
           OPEN INPUT VSH-FILE                                          00009113
           OPEN OUTPUT RPT-OUT.                                         00009227
           OPEN OUTPUT OUT-FILE.                                        00009313
           PERFORM HEADER-ROUTINE.                                      00009431
           READ VSH-FILE INTO VSH-RECORD                                00009524
                         AT END MOVE 1 TO EOF.                          00009624
           DISPLAY 'AND SO IT BEGINS'.                                  00009713
           PERFORM READ-VOLSIZE-ROUTINE UNTIL EOF = 1.                  00009800
           PERFORM FOOTER-ROUTINE.                                      00009929
           CLOSE VSH-FILE.                                              00010013
           CLOSE RPT-OUT                                                00010127
           CLOSE OUT-FILE.                                              00010213
           DISPLAY VOLSIZE-SUM                                          00010322
           DISPLAY 'DONE'.                                              00010408
           STOP RUN.                                                    00010500
                                                                        00010600
       HEADER-ROUTINE.                                                  00010731
           WRITE OUT-DATA FROM OUT-HEADER.                              00010831
                                                                        00010931
       READ-VOLSIZE-ROUTINE.                                            00011000
      *    MOVE SPACES TO OUT-RECORD.                                   00011130
      *    MOVE SPACES TO RPT-RECORD                                    00011230
      *    MOVE 'D' TO REC-TYPE-OUT.                                    00011330
           MOVE VOLNAME-IN TO VOLNAME-OUT                               00011400
           MOVE VOLNAME-IN TO VOLNAME-RPT                               00011527
           MOVE VOLSIZE-IN TO VOLSIZE-OUT                               00011620
           MOVE VOLSIZE-IN TO VOLSIZE-RPT                               00011727
           ADD VOLSIZE-IN TO VOLSIZE-SUM                                00011822
           MOVE VOLSIZE-SUM TO VOLSIZE-SUM-RPT                          00011927
           READ VSH-FILE INTO VSH-RECORD                                00012024
                         AT END MOVE 1 TO EOF.                          00012124
           WRITE OUT-DATA FROM OUT-RECORD.                              00012226
           WRITE RPT-DATA FROM RPT-RECORD.                              00012327
      **                                                                00012400
      **                                                                00012513
       FOOTER-ROUTINE.                                                  00012628
           MOVE VOLSIZE-SUM TO VOLSIZE-SUM-OTR                          00012729
           MOVE VOLSIZE-SUM TO VOLSIZE-SUM-FTR                          00012829
           WRITE OUT-DATA FROM OUT-FOOTER.                              00012929
           WRITE RPT-DATA FROM RPT-FOOTER.                              00013029

