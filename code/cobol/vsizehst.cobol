       IDENTIFICATION DIVISION.                                         00000105
       PROGRAM-ID.  'VSIZEHST'.                                         00000205
      ****************************                                      00000305
      * PROCESS VOLUME SIZE DATA                                        00000405
      ****************************                                      00000505
       ENVIRONMENT DIVISION.                                            00000605
       INPUT-OUTPUT SECTION.                                            00000705
       FILE-CONTROL.                                                    00000805
            SELECT VSH-FILE ASSIGN TO UT-S-SYSIN.                       00000905
            SELECT OUT-FILE ASSIGN TO UT-S-SYSOUT.                      00001005
                                                                        00001105
       CONFIGURATION SECTION.                                           00001205
       SOURCE-COMPUTER.  IBM-360.                                       00001305
       OBJECT-COMPUTER.  IBM-360.                                       00001405
                                                                        00001505
       DATA DIVISION.                                                   00001605
       FILE SECTION.                                                    00001705
       FD  VSH-FILE                                                     00001805
           RECORDING MODE IS F                                          00001905
           RECORD CONTAINS 80 CHARACTERS                                00002005
           BLOCK CONTAINS 238 RECORDS                                   00002105
           LABEL RECORDS ARE OMITTED                                    00002205
           DATA RECORDS IS VSH-RECORD.                                  00002305
       01  VSH-RECORD.                                                  00002405
           02  FILLER           PICTURE A(25).                          00002505
           02  VOLSIZE-IN       PICTURE 9(8).                           00002605
           02  FILLER           PICTURE A(1).                           00002705
           02  SNAPDATE-IN      PICTURE A(12).                          00002805
           02  FILLER           PICTURE A(1).                           00002905
           02  VOLNAME-IN       PICTURE A(10).                          00003005
           02  FILLER           PICTURE A(23).                          00003105
       FD  OUT-FILE   LABEL RECORDS ARE OMITTED.                        00003205
       01  OUT-RECORD.                                                  00003305
           02  VOLNAME-OUT      PICTURE A(10).                          00003405
           02  FILLER           PICTURE A(3).                           00003505
           02  VOLSIZE-OUT      PICTURE ZZ,ZZZ,ZZ9.                     00003605
                                                                        00003705
       WORKING-STORAGE SECTION.                                         00003805
       01  EOF                  PICTURE 9 VALUE 0.                      00003905
       PROCEDURE DIVISION.                                              00004005
                                                                        00004105
       MAIN-ROUTINE.                                                    00004205
           OPEN INPUT VSH-FILE, OUTPUT OUT-FILE.                        00004305
           READ VSH-FILE AT END MOVE 1 TO EOF.                          00004405
           PERFORM READ-VOLSIZE-ROUTINE UNTIL EOF = 1.                  00004505
           CLOSE VSH-FILE, OUT-FILE.                                    00004605
           STOP RUN.                                                    00004705
                                                                        00004805
       READ-VOLSIZE-ROUTINE.                                            00004905
           MOVE SPACES TO OUT-RECORD.                                   00005005
           MOVE VOLNAME-IN TO VOLNAME-OUT                               00005105
           MOVE VOLSIZE-IN TO VOLSIZE-OUT.                              00005205
           WRITE OUT-RECORD.                                            00005305
           READ VSH-FILE AT END MOVE 1 TO EOF.                          00005405
                                                                        00005505
