; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Ashna Pradhan
; Email: aprad036@ucr.edu
; 
; Assignment name: Assignment 5
; Lab section: 023
; TA: Westin Montano & Sanchit Goel
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=================================================================================
; PUT ALL YOUR CODE AFTER THE main LABEL
;=================================================================================

;---------------------------------------------------------------------------------
;  Initialize program by setting stack pointer and calling main subroutine
;---------------------------------------------------------------------------------
.ORIG x3000

; initialize the stack
LD R6, STACK_ADDR

; call main subroutine
LEA R5, MAIN
JSRR, R5

;---------------------------------------------------------------------------------
; Main Subroutine
;---------------------------------------------------------------------------------
main
; get a string from the user
; * put your code here
LEA R0, USER_PROMPT
PUTS

LD R2, GET_USER_STRING_ADDR
JSRR R2

; find size of input string
; * put your code here
LD R2, STRLEN_ADDR
JSRR R2

; call palindrome method
; * put your code here
LD R2, PALINDROME_ADDR
JSRR R2

; determine of string is a palindrome
; * put your code here
ADD R0, R0, #0
BRZ NOT_PALINDROME 
BRP IS_PALINDROME  

; print the result to the screen
; * put your code here
IS_PALINDROME 
LEA R0, RESULT_STRING
PUTS

LEA R0, FINAL_STRING
PUTS

;BR END_NOT_PALINDROME
END_IS_PALINDROME

; decide whether or not to print "not"
; * put your code here


NOT_PALINDROME
LEA R0, RESULT_STRING
PUTS

LEA R0, NOT_STRING
PUTS

LEA R0, FINAL_STRING
PUTS
END_NOT_PALINDROME

HALT

;---------------------------------------------------------------------------------
; Required labels/addresses
;---------------------------------------------------------------------------------

; Stack address ** DO NOT CHANGE **
stack_addr           .FILL    xFE00

; Addresses of subroutines, other than main
get_user_string_addr .FILL    x3200
strlen_addr          .FILL    x3300
palindrome_addr      .FILL	  x3400


; Reserve memory for strings in the progrtam
user_prompt          .STRINGZ "Enter a string: "
result_string        .STRINGZ "The string is "
not_string           .STRINGZ "not "
final_string         .STRINGZ	"a palindrome\n"

; Reserve memory for user input string
user_string          .BLKW	  100

.END

;---------------------------------------------------------------------------------
; get_user_string  - GET + STORE USER INPUT STRING
; parameter: R1 - ADDRESS OF PROMPT
; parameter: R2 - ARRAY BASE ADDRESS
; postcondition: GETS STRING FROM USER INPUT
; returns: N/A
;---------------------------------------------------------------------------------

.ORIG x3200
get_user_string
; Backup all used registers, R7 first, using proper stack discipline
ADD R6, R6, #-1
STR R0, R6, #0
ADD R6, R6, #-1
STR R1, R6, #0
ADD R6, R6, #-1
STR R2, R6, #0
ADD R6, R6, #-1
STR R3, R6, #0
ADD R6, R6, #-1
STR R4, R6, #0
ADD R6, R6, #-1
STR R7, R6, #0

LD R2, ARRAY_ADDR

DO_WHILE_LOOP
    GETC
    OUT
    LD R3, ENTER_KEY
    ADD R3, R0, R3      
    IF_STATEMENT
        BRNP NOT_DONE
    DONE
        STR R4, R2, #0      
        ADD R4, R4, #-1     
        BR END_DO_WHILE_LOOP
    NOT_DONE
        STR R0, R2, #0     
    END_IF_STATEMENT
    ADD R2, R2, #1        
    ADD R4, R4, #0          
    BRz DO_WHILE_LOOP     
END_DO_WHILE_LOOP

; Resture all used registers, R7 last, using proper stack discipline
LDR R7, R6, #0
ADD R6, R6, #1
LDR R4, R6, #0
ADD R6, R6, #1
LDR R3, R6, #0
ADD R6, R6, #1
LDR R2, R6, #0
ADD R6, R6, #1
LDR R1, R6, #0
ADD R6, R6, #1
LDR R0, R6, #0
ADD R6, R6, #1

RET

;Local data
ARRAY_ADDR  .FILL   x4000
ENTER_KEY   .FILL   x-0A
.END

;---------------------------------------------------------------------------------
; strlen - CALCULATE STRING LENGTH
; parameter: R1 - ADDRESS OF STRING
; postcondition: CALCULATING LENGTH OF STRING
; returns: R0 - STRING LENGTH
;---------------------------------------------------------------------------------
.ORIG x3300
strlen
; Backup all used registers, R7 first, using proper stack discipline
ADD R6, R6, #-1
STR R5, R6, #0
ADD R6, R6, #-1
STR R1, R6, #0
ADD R6, R6, #-1
STR R2, R6, #0
ADD R6, R6, #-1
STR R3, R6, #0
ADD R6, R6, #-1
STR R4, R6, #0
ADD R6, R6, #-1
STR R7, R6, #0

LD R5, DEC_ZERO  
LD R0, DEC_ZERO  
LD R1, STRING_ADDRESS

COUNT_LOOP
LDR R5, R1, #0     
IF_ENDING      
BRZ END_COUNT_LOOP    
ADD R0, R0, #1      
ADD R1, R1, #1     
BRNZP COUNT_LOOP
END_COUNT_LOOP

; Resture all used registers, R7 last, using proper stack discipline
LDR R7, R6, #0
ADD R6, R6, #1
LDR R4, R6, #0
ADD R6, R6, #1
LDR R3, R6, #0
ADD R6, R6, #1
LDR R2, R6, #0
ADD R6, R6, #1
LDR R1, R6, #0
ADD R6, R6, #1
LDR R5, R6, #0
ADD R6, R6, #1

RET

;Local data
STRING_ADDRESS  .FILL   x4000
DEC_ZERO        .FILL   #0

.END


;---------------------------------------------------------------------------------
; palindrome - DETERMINES IF USER STRING IS A PALINDROME
; parameter: R1 - ADDRESS OF USER INPUTTED STRING
; parameter: R0 - STRING LENGTH
; postcondition: CHECK IF PALINDROME
; returns: IF PALINDROME RETURNS 1; ELSE, RETURNS 0
;---------------------------------------------------------------------------------

.ORIG x3400
palindrome ; Hint, do not change this label and use for recursive alls
; Backup all used registers, R7 first, using proper stack discipline
ADD R6, R6, #-1
STR R4, R6, #0
ADD R6, R6, #-1
STR R1, R6, #0
ADD R6, R6, #-1
STR R2, R6, #0
ADD R6, R6, #-1
STR R3, R6, #0
ADD R6, R6, #-1
STR R5, R6, #0
ADD R6, R6, #-1
STR R7, R6, #0

ADD R1, R1, #0
BRP SAVE_INPUT

LD R2, NUM_ZERO 
LD R1, ARRAY_ADDRESS
ADD R2, R0, R1     
ADD R2, R2, #-1

SAVE_INPUT
LDR R5, R1, #0
LDR R3, R2, #0


IF_PALINDROME_STATEMENT

    LD R4, NUM_ZERO
    ADD R4, R2, #0     
    NOT R4, R4
    ADD R4, R4, #1      
    ADD R4, R4, R1    
    BRZP RETURN_ONE

    LD R4, NUM_ZERO
    ADD R4, R3, #0
    NOT R4, R4
    ADD R4, R4, #1
    ADD R4, R4, R5    
    
    BRNP RETURN_ZERO
    BRZ NEXT_CHAR
    
    RETURN_ZERO
    LD R0, NUM_ZERO
    BR END_IF
    
    RETURN_ONE
    LD R0, NUM_ONE
    BR END_IF
    
    NEXT_CHAR
    ADD R1, R1, #1 
    ADD R2, R2, #-1 
    JSR PALINDROME 
END_IF
    
    
    
; Resture all used registers, R7 last, using proper stack discipline
RESTORE1
LDR R7, R6, #0
ADD R6, R6, #1
LDR R5, R6, #0
ADD R6, R6, #1
LDR R3, R6, #0
ADD R6, R6, #1
LDR R2, R6, #0
ADD R6, R6, #1
LDR R1, R6, #0
ADD R6, R6, #1
LDR R4, R6, #0
ADD R6, R6, #1

RET

;Local data
ARRAY_ADDRESS   .FILL   x4000
NUM_ZERO        .FILL   #0
NUM_ONE         .FILL   #1
.END
