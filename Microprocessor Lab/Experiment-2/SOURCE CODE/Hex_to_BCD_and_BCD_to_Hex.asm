; =================================================================================================
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program for Hexadecimal to BCD and BCD to Hexadecimal conversion.
; -------------------------------------------------------------------------------------------------
; HOW IT WORKS:
; 1. Display a menu for the user to choose between Hex-to-BCD or BCD-to-Hex conversion.
; 2. Hex to BCD: Input a 4-digit hexadecimal number, divide it by 10 repeatedly to get 
;    individual digits, and store them.
; 3. BCD to Hex: Input a 5-digit BCD number, multiply each digit by its power of 10 
;    (10000, 1000, etc.), and sum them up to get the hex equivalent.
; =================================================================================================

.MODEL SMALL
.DATA
    ; --- Menu and Messages ---
    MENU DB 10D, 13D, " =========================="
         DB 10D, "         M E N U"
         DB 10D, " =========================="
         DB 10D, " 1. Hex to BCD"
         DB 10D, " 2. BCD to Hex"
         DB 10D, " 3. Exit"
         DB 10D, " Enter your choice: $"
    
    M1 DB 10D, " Enter 4 Digit Hex Number: $"
    M2 DB 10D, " Equivalent BCD Number: $"
    M3 DB 10D, " Enter 5 Digit BCD Number: $"
    M4 DB 10D, " Equivalent Hex Number: $"

    ; --- Variables ---
    NUM DW 0000H         ; Stores the input hexadecimal number
    ARR DB 5 DUP(0)      ; Array to hold individual BCD digits
    COUNT DB 00H         ; Counter for digit processing
    NUM1 DW 10000D       ; Starting power of 10 for BCD conversion
    NUM2 DW 10D          ; Constant for decreasing the power of 10
    NUM3 DW ?            ; Temporary storage for hex output

.CODE
    ; -- Initialize the data segment --
    MOV AX, @DATA
    MOV DS, AX

MAIN: 
    ; -- Step 1: Display the menu to the user --
    LEA DX, MENU          
    MOV AH, 09H           ; DOS function: Print string
    INT 21H

    ; -- Step 2: Read user's choice --
    MOV AH, 01H           ; DOS function: Read character from keyboard
    INT 21H
    CMP AL, '1'           ; Did the user pick '1'?
    JE CASE1
    CMP AL, '2'           ; Did the user pick '2'?
    JE CASE2
    CMP AL, '3'           ; Did the user pick '3'? (Exit)
    JE EXIT
    JMP MAIN             ; If invalid choice, show menu again

EXIT: 
    ; -- Standard way to close the program --
    MOV AH, 4CH           
    INT 21H

CASE1: 
    CALL HEXTOBCD        ; Jump to the Hex to BCD procedure
    JMP MAIN             ; Return to menu after finishing

CASE2: 
    CALL BCDTOHEX        ; Jump to the BCD to Hex procedure
    JMP MAIN             ; Return to menu after finishing

; --- PROCEDURE: Convert Hexadecimal to BCD ---
HEXTOBCD PROC
    LEA DX, M1            ; Prompt for hex number
    MOV AH, 09H
    INT 21H
    MOV CH, 04H           ; We expect 4 hexadecimal digits (e.g., 1A2B)

LOOP1: 
    MOV AH, 01H           ; Get one character
    INT 21H
    CMP AL, 39H           ; Is it 0-9 or A-F?
    JBE SKIP1             ; If 0-9, skip the A-F adjustment
    SUB AL, 07H           ; adjustment for A-F characters

SKIP1: 
    SUB AL, 30H           ; Convert ASCII '0'-'9' to actual value 0-9
    MOV AH, 00H
    ADD NUM, AX           ; Add the value to our number variable
    ROL NUM, 04           ; Shift left by 4 bits to make room for the next nibble
    DEC CH
    JNZ LOOP1             ; Repeat 4 times
    ROL NUM, 04           ; Final rotation to fix the positions
    
    ; -- Convert the binary number to BCD digits by dividing by 10 --
    MOV AX, NUM
    MOV DX, 0000H
    MOV BX, 000AH         ; Divide by 10
    LEA SI, ARR

LOOP2: 
    DIV BX                ; Divide AX by 10
    MOV [SI], DX          ; Store the remainder (the last digit) in our array
    INC SI
    INC COUNT
    MOV DX, 0000H
    CMP AX, 0000H         ; Are we done dividing?
    JNZ LOOP2
    
    LEA DX, M2            ; Show "Equivalent BCD Number: "
    MOV AH, 09H
    INT 21H
    DEC SI
    MOV CH, 05H           ; Display up to 5 BCD digits

LOOP3: 
    MOV DL, [SI]          ; Load digit from the array
    CMP DL, 09H
    JBE SKIP2
    ADD DL, 07H

SKIP2: 
    ADD DL, 30H           ; Convert value back to ASCII for printing
    MOV AH, 02H           ; DOS function: Print single character
    INT 21H
    DEC SI
    DEC CH
    JNZ LOOP3
    RET
HEXTOBCD ENDP

; --- PROCEDURE: Convert BCD to Hexadecimal ---
BCDTOHEX PROC
    LEA DX, M3            ; Prompt for 5-digit BCD (e.g., 65535)
    MOV AH, 09H
    INT 21H	
    MOV BX, 0000H
    LEA SI, COUNT
    MOV DL, 05H
    MOV [SI], DL

LOOP4: 
    MOV AH, 01H           ; Read character
    INT 21H
    CMP AL, 39H
    JBE SKIP3
    SUB AL, 07H

SKIP3: 
    SUB AL, 30H           ; Convert ASCII to value
    MOV AH, 00H
    MUL NUM1              ; Multiply digit by its power of 10
    ADD BX, AX            ; Accumulate the result in BX
    MOV DX, 0000H
    MOV AX, NUM1	
    DIV NUM2              ; Decrease power of 10 for the next digit (10000 -> 1000 -> 100...)
    MOV NUM1, AX
    DEC COUNT
    JNZ LOOP4
    
    LEA DX, M4            ; Show result message
    MOV AH, 09H
    INT 21H
    MOV CH, 04H	          ; We will display 4 hex digits

LOOP5: 
    ROL BX, 04H           ; Rotate left by 4 bits to get the highest nibble
    MOV NUM3, BX
    AND BX, 000FH         ; Mask out everything except the lowest 4 bits
    CMP BL, 09H
    JBE SKIP4
    ADD BL, 07H

SKIP4: 
    ADD BL, 30H           ; Convert number to ASCII
    MOV DL, BL
    MOV AH, 02H           ; Print the hex digit
    INT 21H
    MOV BX, NUM3          ; Restore the original BX
    DEC CH
    JNZ LOOP5
    RET
BCDTOHEX ENDP

END
