;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Ashna Pradhan
; Email: aprad036@ucr.edu
; 
; Assignment name: Assignment 3
; Lab section: 023
; TA: Sanchit Goel & Westin Montano
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=========================================================================

.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------
LD R6, Value_ptr		; R6 <-- pointer to value to be displayed as binary
LDR R1, R6, #0			; R1 <-- value to be displayed as binary 
;-------------------------------
;INSERT CODE STARTING FROM HERE
LD R5, MASK
ADD R2, R2, #15
ADD R3, R3, #8
 ;AND R7, R1, R5

LOOP
    AND R7, R1, R5
    BRZ ZERO
    BRNP ONE
    
   ; BRNP END_ZERO
    ;BRNP END_ZERO
  ;  ADD R7, R3, X1
   ; STR R7, R0, #0
    ONE
        LEA R0, ASCII_ONE
        PUTS
        ADD R7, R7, #0
        ADD R3, R3, #-1
        BR END_ZERO
    END_ONE
    
    ZERO
       ; ADD R7, R3, #0
      ;  STR R7, R0, #0
        LEA R0, ASCII_ZERO
        PUTS
        ADD R3, R3, #-1
    END_ZERO
    
    
        

    ADD R1, R1, R1
   ; ADD R1, R1, #-1
   ; ADD R2, R2, #-1
    
  ;  ADD R3, R3, #-1
;    BRP END_ADD_SPACE
 
;        ADD_SPACE
 ;           LEA R0, SPACE
  ;          PUTS
 ;           ADD R3, R3, #8
  ;      END_ADD_SPACE
    
  ;  ADD R3, R3, #-1
  
 ;   ADD R2, R2, #-1
   
    
 ;   BRZP LOOP
   ; BRZ END_ADD_SPACE
   ADD R2, R2, #0
   BRZ END_ADD_SPACE
    
    
    ADD R3, R3, #-1
    BRP END_ADD_SPACE
   ; BRZ ADD_SPACE
 ;   BRP END_ADD_SPACE
    
        ADD_SPACE
            LEA R0, SPACE
            PUTS
            ADD R3, R3, #8
        END_ADD_SPACE
        
    ADD R2, R2, #-1
   
    
    BRZP LOOP
    BRZ END_ADD_SPACE
    
END_LOOP

LEA R0, ENDING
PUTS
 
;--------------------------------


HALT
;---------------	
;Data
;---------------
Value_ptr       .FILL       xCA01	; The address where value to be displayed is stored
ASCII_ONE       .STRINGZ    "1" ; ASCII code for '1'
ASCII_ZERO      .STRINGZ    "0" ; ASCII code for '0'
SPACE           .STRINGZ    " " ; ASCII code for space character
MASK            .FILL       x8000
ENDING          .FILL       x0A
.END

.ORIG xCA01					; Remote data
Value .FILL xABCD           ; <----!!!NUMBER TO BE DISPLAYED AS BINARY!!! Note: label is redundant.
;---------------	
; END of PROGRAM
;---------------	
.END
