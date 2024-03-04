;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Ashna Pradhan
; Email: aprad036@ucr.edu
; 
; Assignment name: Assignment 2
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

;----------------------------------------------
;output prompt
;----------------------------------------------	
LEA R0, intro			; get starting address of prompt string
PUTS			    	; Invokes BIOS routine to output string

;-------------------------------
;INSERT YOUR CODE here
    ; Read first character of input

    GETC
    OUT
    ADD R1, R1, R0
    
  ;  AND R0, R0, x0 
    
    LD  R0, newline
    OUT
    
  ;  AND R0, R0, x0


    GETC
    OUT
    ADD R2, R2, R0
   ; OUT
    
   ; AND R0, R0, x0
    
    LD  R0, newline
    OUT
    
    AND R0, R0, x0
    ADD R0, R1, R0
    OUT
    
    LEA R0, subtract
    PUTS
    
    ADD R0, R2, #0
    OUT
    
    LEA R0, equal
    PUTS

 

    ADD R1, R1, x-6
    ADD R1, R1, x-6
    ADD R1, R1, x-6
    ADD R1, R1, x-6
    ADD R1, R1, x-6
 ;  OUT 
   
    ADD R2, R2, x-6
    ADD R2, R2, x-6
    ADD R2, R2, x-6
    ADD R2, R2, x-6
    ADD R2, R2, x-6
   ;OUT
   
    NOT R2, R2
    ADD R2, R2, #1
  ; OUT
    AND R0, R0, x0
 
    ADD R3, R1, R2
    BRn NEGATIVE_RESULT
    

    ADD R3, R3, #12
    ADD R3, R3, #12
    ADD R3, R3, #12
    ADD R3, R3, #12
   
 ;  BRn NEGATIVE_RESULT
   
    ADD R0, R3, #0
    OUT
   
    LD  R0, newline
    OUT
    BR END_NEGATIVE_RESULT
    NEGATIVE_RESULT
        NOT R4, R3
        ADD R4, R4, #1 
        AND R3, R3, x0
        ADD R3, R3, R4
        LEA R0, negative
        PUTS
        ADD R3, R3, #12
        ADD R3, R3, #12
        ADD R3, R3, #12
        ADD R3, R3, #12
        ADD R0, R3, #0
        OUT
        LD  R0, newline
        OUT
    END_NEGATIVE_RESULT
    
   
 
;--------------------------------

HALT				; Stop execution of program
;------	
;Data
;------
; String to prompt user. Note: already includes terminating newline!
intro       .STRINGZ	"ENTER two numbers (i.e '0'....'9')\n" 		; prompt string - use with LEA, followed by PUTS.
newline     .FILL x0A	; newline character - use with LD followed by OUT
subtract    .STRINGZ    " - "
equal       .STRINGZ    " = "
negative    .STRINGZ    "-"
;---------------	
; END of PROGRAM
;---------------	
.END

