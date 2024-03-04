;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Ashna Pradhan
; Email: aprad036@ucr.edu
; 
; Assignment name: Assignment 1
; Lab section: 023
; TA: Sanchit Goel & Westin Montano
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=========================================================================

;------------------------------------------
;           BUILD TABLE HERE
;----------------------------------------------------------
;REG VALUES         R0   R1   R2   R3   R4   R5   R6   R7
;PRE-LOOP           0    0    0    0    0    0    0    0
;ITERATION 01       0    6    12   0    0    0    0    0
;ITERATION 02       0    5    12   12   0    0    0    0
;ITERATION 03       0    4    12   24   0    0    0    0
;ITERATION 04       0    3    12   36   0    0    0    0
;ITERATION 05       0    2    12   48   0    0    0    0
;ITERATION 06       0    1    12   60   0    0    0    0
;ITERATION 07       0   3276' 12   72   0    0    0    0
; END OF PROGRAM    0   3276' 12   72   0    0    0    0
;----------------------------------------------------------
;


.ORIG x3000			; Program begins here
;-------------
;Instructions: CODE GOES HERE
;-------------
;AND R3, R3, x0

LD R1, DEC_6        ;R1<--6
LD R2, DEC_12       ;R2<--12
LD R3, DEC_0        ;R3<--0

DO_WHILE    ADD R3, R3, R2  ;R3<--R3+R2
            ADD R1, R1, #-1 ;R1<--R1-1
            BRp DO_WHILE    ; IF(LMR>0) GO TO DO_WHILE

HALT
;---------------	
;Data (.FILL, .STRINGZ, .BLKW)
;---------------

DEC_0   .FILL   #0
DEC_6   .FILL   #6
DEC_12  .FILL   #12

;---------------	
;END of PROGRAM
;---------------	
.END


