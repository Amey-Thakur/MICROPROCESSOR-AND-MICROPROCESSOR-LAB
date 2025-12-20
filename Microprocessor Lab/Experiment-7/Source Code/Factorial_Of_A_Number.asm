; =================================================================================================
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to calculate the Factorial of a given number.
; -------------------------------------------------------------------------------------------------
; WHAT IS A FACTORIAL?
; The factorial of a number (written as n!) is the product of all positive integers 
; from 1 up to that number. For example: 5! = 5 x 4 x 3 x 2 x 1 = 120.
;
; HOW IT WORKS: 
; 1. Take a single-digit number input from the user.
; 2. Initialize a result variable to 1.
; 3. Use a loop to multiply the result by the number, then the number minus 1, and so on.
; 4. Convert the final numeric result into decimal format for display.
; =================================================================================================

DATA SEGMENT
    ; --- User Messages ---
    M1 DB 10, 13, " ENTER THE NUMBER (0-8): $"
    M2 DB 10, 13, " FACTORIAL OF THE NUMBER IS: $"
    
    ; --- Variables ---
    NUM DB ?           ; To store the number entered by the user
    FACT DW 01H        ; To store the calculated result (starts at 1)
DATA ENDS

CODE SEGMENT
ASSUME DS:DATA, CS:CODE
START:
    ; -- Initialization: Set up the memory access --
    MOV AX, DATA       
    MOV DS, AX

    ; -- Step 1: Prompt the user for a number --
    LEA DX, M1         
    MOV AH, 09H        ; DOS function: Display string
    INT 21H

    ; -- Step 2: Read the number from the keyboard --
    MOV AH, 01H        ; DOS function: Read character
    INT 21H
    SUB AL, 30H        ; Convert ASCII '5' to actual number 5
    MOV NUM, AL        ; Save it in variable 'NUM'

    ; -- Step 3: Prepare the Loop Counters --
    MOV CL, AL         ; Load our number into the loop counter register (CL)
    MOV CH, 00H        ; Ensure the rest of CX is empty
    MOV AX, 0001H      ; AX will hold our running product (starting at 1)

    ; -- Edge Case: If the user enters 0, the factorial is 1 --
    CMP CX, 0000H      
    JE SHOW_RESULT     

    ; -- Step 4: The Multiplication Loop --
CALC_LOOP:
    ; 'MUL' multiplies the value in AX by the value in CX. 
    ; The result is stored back in AX.
    MUL CX             
    LOOP CALC_LOOP     ; Decrement CX and go back to CALC_LOOP until CX hits 0

SHOW_RESULT:
    ; -- Step 5: Save and Display the final result --
    MOV FACT, AX       ; Store the final answer into memory
    
    LEA DX, M2         ; Show the "FACTORIAL IS: " message
    MOV AH, 09H
    INT 21H

    MOV AX, FACT       ; Load the result back for printing
    CALL DISPLAY_DECIMAL ; Call our helper to print the number on screen

    ; -- Exit Program --
    MOV AH, 4CH        
    INT 21H

; --- HELPER PROCEDURE: Display a 16-bit number in AX as a Decimal string ---
DISPLAY_DECIMAL PROC
    MOV BX, 000AH      ; We will divide by 10 to extract digits
    MOV CX, 0000H      ; Counter for how many digits we find

DIVIDE_PROCESS:
    MOV DX, 0000H      ; Clear DX for the division
    DIV BX             ; AX / 10. Quotient in AX, digit (remainder) in DX.
    PUSH DX            ; Save the digit for later
    INC CX             ; Count the digit
    CMP AX, 0000H      ; Any more digits left?
    JNE DIVIDE_PROCESS

PRINTING:
    POP DX             ; Get the last digit we saved
    ADD DL, 30H        ; Convert it to ASCII ('0'-'9')
    MOV AH, 02H        ; DOS function: Print character
    INT 21H
    LOOP PRINTING      ; Repeat until all digits are printed
    RET
DISPLAY_DECIMAL ENDP

CODE ENDS
END START
