;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Ashna Pradhan
; Email: aprad036@ucr.edu
; 
; Assignment name: Assignment 4
; Lab section: 023
; TA: Westin Montano & Sanchit Goel
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=================================================================================
;THE BINARY REPRESENTATION OF THE USER-ENTERED DECIMAL NUMBER MUST BE STORED IN R4
;=================================================================================

.ORIG x3000		
;-------------
;Instructions
;-------------

; output intro prompt


INTRO

LD R0, introPromptPtr
PUTS

END_INTRO

AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
AND R5, R5, #0
AND R6, R6, #0
AND R7, R7, #0
						
						
						
; Set up flags, counters, accumulators as needed
;AND R4, R4, #0
GETC

LD R2, POSITIVE
LD R3, MINUS
LD R4, NUM_MAX
LD R5, INVALID
LD R6, ENTER

;AND R4, R4, #0

AND R1, R1, #0

;GETC
;OUT
;LD R4, NUM_MAX

ADD R1, R0, R6
BRZ ENTER_FIRST
AND R1, R1, #0

ADD R1, R0, R2
BRZ IF_POS
AND R1, R1, #0

ADD R1, R0, R3
BRZ IF_NEG
AND R1, R1, #0

ADD R1, R0, R5
BRNZ IF_ENTER
AND R1, R1, #0

ADD R1, R0, R4
BRNZ IF_NUM
BRP IF_ENTER
AND R1, R1, #0



IF_POS
    OUT
    AND R2, R2, #0  ;COUNTER
    ADD R2, R2, #4
    AND R3, R3, #0
    LD R3, MASK
 
    AND R0, R0, #0  ; CLEAR 0
    
    GETC 
    ADD R1, R0, R6  ;CHECK IF ENTER
    BRZ IF_ENTER
    AND R6, R6, #0
  ;  LD R6, POSITIVE
    OUT

    AND R4, R4, #0
    ADD R4, R0, R3  
    
    BRN IF_ENTER
 
    ADD R7, R4, R7

    DO_WHILE_LOOP1
       
    
        AND R1, R1, #0
    
        GETC    ; GET INPUT
        LD R6, ENTER
        ADD R1, R0, R6  ;CHECK IF ENTER
        BRZ ENDING
        AND R6, R6, #0
        LD R6, POSITIVE
        OUT
        AND R1, R1, #0
        ADD R1, R0, R6
        BRZ IF_ENTER
        AND R6, R6, #0
        LD R6, INVALID
        ADD R1, R0, R6
        BRZ IF_ENTER
        AND R6, R6, #0
        LD R6, NUM_MAX
        ADD R1, R0, R6
        BRP IF_ENTER
        AND R1, R1, #0
        AND R6, R6, #0
        
      ;  OUT ; OUTPUT
        
        ;ADD R0, R0, R3
     
        ADD R4, R4, R7  ;MULTIPLY 
        ADD R4, R4, R7
        ADD R4, R4, R7
        ADD R4, R4, R7
        ADD R4, R4, R7        
        ADD R4, R4, R7
        ADD R4, R4, R7
        ADD R4, R4, R7
        ADD R4, R4, R7
        ;ADD R4, R4, R0
        
        AND R7, R7, #0
        
        ADD R0, R0, R3
        
       ; ADD R4, R4, R0
        
        BRN NEG_ERROR
        LD R6, MAX2
        ADD R6, R6, R0
        BRP NEG_ERROR
        
        ADD R4, R4, R0
        
        
        ADD R7, R4, R7
        
        AND R1, R1, #0
        ADD R2, R2, #-1
        BRP DO_WHILE_LOOP1
        BRNZ ENDING
        
    END_DO_WHILE_LOOP1
 
    BR ENDING
END_IF_POS


IF_NEG
    OUT
    AND R2, R2, #0  ;COUNTER
    ADD R2, R2, #4
    AND R3, R3, #0
    LD R3, MASK
 
    AND R0, R0, #0  ; CLEAR 0
    
    GETC 
    ADD R1, R0, R6  ;CHECK IF ENTER
    BRZ IF_ENTER
    OUT

    AND R4, R4, #0
    ADD R4, R0, R3  ;MULTIPLY 
    
    ;ADD R0, R0, #0
    BRN NEG_ERROR
    LD R6, MAX2
    ADD R6, R6, R4
    BRP NEG_ERROR
    
    ADD R7, R4, R7

    DO_WHILE_LOOP2

        AND R1, R1, #0
    
        GETC    ; GET INPUT
        LD R6, ENTER
        ADD R1, R0, R6  ;CHECK IF ENTER
        BRZ END_DO_WHILE_LOOP2
        OUT
        
        ADD R0, R0, R3
        
        AND R6, R6, #0
     
        AND R1, R1, #0
        AND R6, R6, #0
     
        ADD R4, R4, R7  ;MULTIPLY 
        ADD R4, R4, R7
        ADD R4, R4, R7
        ADD R4, R4, R7
        ADD R4, R4, R7        
        ADD R4, R4, R7
        ADD R4, R4, R7
        ADD R4, R4, R7
        ADD R4, R4, R7
        ADD R4, R4, R0
        
        BRN IF_ENTER
        
        AND R7, R7, #0
      
        ADD R7, R4, R7
        
        AND R1, R1, #0
        
        ADD R0, R0, #0
        BRN NEG_ERROR
        LD R6, MAX2
        ADD R6, R6, R0
        BRP NEG_ERROR
    
        ADD R2, R2, #-1
        BRP DO_WHILE_LOOP2
      
    END_DO_WHILE_LOOP2
    
    NOT R4, R4
    ADD R4, R4, #1
 
    BR ENDING
END_IF_NEG

IF_NUM
    OUT
    AND R2, R2, #0  ;COUNTER
    ADD R2, R2, #4
    AND R3, R3, #0
    LD R3, MASK
    ADD R0, R0, R3

    
    AND R4, R4, #0  ;CLEAR 4

    AND R1, R1, #0  ;CLEAR 1
    ADD R1, R1, R0  ;ADD INPUT TO 1
    ADD R4, R4, R0  ;ADD INPUT TO 4

    AND R1, R1, #0  ;CLEAR 1

    AND R0, R0, #0  ; CLEAR 0
    BR DO_WHILE_LOOP

    DO_WHILE_LOOP
        GETC    ; GET INPUT
        LD R6, ENTER
        ADD R1, R0, R6  ;CHECK IF ENTER
        BRZ ENDING
        AND R6, R6, #0
        LD R6, INVALID
        ADD R1, R0, R6
        ;BRZ IF_ENTER
        AND R6, R6, #0
        LD R6, NUM_MAX
        ADD R1, R0, R6
       ; BRP IF_ENTER
        AND R1, R1, #0
        AND R6, R6, #0

        OUT ; OUTPUT
        ADD R7, R4, R7
        ADD R4, R4, R7  ;MULTIPLY 
        ADD R4, R4, R7
        ADD R4, R4, R7
        ADD R4, R4, R7
        ADD R4, R4, R7
        ADD R4, R4, R7
        ADD R4, R4, R7
        ADD R4, R4, R7
        ADD R4, R4, R7
        
        AND R7, R7, #0
        
        ADD R0, R0, R3
        
        BRN NEG_ERROR
        LD R6, MAX2
        ADD R6, R6, R0
        BRP NEG_ERROR
        
        ADD R4, R4, R0  ;ADD NEW NUM
        
        AND R1, R1, #0
        ADD R2, R2, #-1
        BRP DO_WHILE_LOOP
        BRNZ ENDING
    END_DO_WHILE_LOOP
 
    BR ENDING
END_IF_NUM

NEG_ERROR
    NOT R4, R4
    ADD R4, R4, #1
    BR IF_ENTER
END_NEG_ERROR


IF_ENTER
    LEA R0, LINE
    PUTS
    LD R0, errorMessagePtr
    PUTS
    AND R0, R0, #0
  ;  AND R4, R4, #0
    AND R7, R7, #0
    BR INTRO
END_IF_ENTER

ENTER_FIRST
    AND R4, R4, #0
    BR END_ENDING
END_ENTER_FIRST

ENDING
    AND R0, R0 , #0
    LEA R0, LINE
    PUTS
    ;BR FINAL
END_ENDING  
    
;FINAL

; Get first character, test for '\n', '+', '-', digit/non-digit 	
					
; is very first character = '\n'? if so, just quit (no message)!

; is it = '+'? if so, ignore it, go get digits

; is it = '-'? if so, set neg flag, go get digits
					
; is it < '0'? if so, it is not a digit	- o/p error message, start over

; is it > '9'? if so, it is not a digit	- o/p error message, start over
				
; if none of the above, first character is first numeric digit - convert it to number & store in target register!
					
; Now get remaining digits from user in a loop (max 5), testing each to see if it is a digit, and build up number in accumulator

; remember to end with a newline!

 
					
HALT
;---------------	
; Program Data
;---------------
introPromptPtr  .FILL       xB000
errorMessagePtr .FILL       xB200
POSITIVE        .FILL       x-2B
MINUS           .FILL       x-2D
NUM_MAX         .FILL       x-39
INVALID         .FILL       #-47
ENTER           .FILL       x-0A
LINE            .FILL       x0A
MASK            .FILL       #-48
MAX2            .FILL       #-9
;POSITIVE1       .FILL       #-43

.END
;------------
; Remote data
;------------
.ORIG xB000	 ; intro prompt
.STRINGZ	 "Input a positive or negative decimal number (max 5 digits), followed by ENTER\n"

.END					
					
.ORIG xB200	 ; error message
.STRINGZ	 "ERROR: invalid input\n"

;---------------
; END of PROGRAM
;---------------
.END

;-------------------
; PURPOSE of PROGRAM
;-------------------
; Convert a sequence of up to 5 user-entered ascii numeric digits into a 16-bit two's complement binary representation of the number.
; if the input sequence is less than 5 digits, it will be user-terminated with a newline (ENTER).
; Otherwise, the program will emit its own newline after 5 input digits.
; The program must end with a *single* newline, entered either by the user (< 5 digits), or by the program (5 digits)
; Input validation is performed on the individual characters as they are input, but not on the magnitude of the number.
