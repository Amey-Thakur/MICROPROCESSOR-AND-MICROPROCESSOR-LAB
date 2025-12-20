; =================================================================================================
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to fetch and display the current System Time (HH:MM:SS).
; -------------------------------------------------------------------------------------------------
; HOW IT WORKS: 
; 1. Request the current time from the computer's system (BIOS) using an 'interrupt'.
; 2. The system returns hours, minutes, and seconds in numeric (binary) form.
; 3. Use an 'Adjustment' instruction (AAM) to split these numbers into two separate digits.
; 4. Convert these digits into printable ASCII characters and show them on the screen.
; =================================================================================================

.MODEL SMALL
.DATA
    ; --- Message header ---
    MSG DB 10, 13, " CURRENT SYSTEM TIME IS : $"

.CODE
    ; -- Initialization: Tell the CPU where our data is --
    MOV AX, @DATA        
    MOV DS, AX

    ; -- Step 1: Show the "CURRENT SYSTEM TIME IS : " message --
    LEA DX, MSG          
    MOV AH, 09H          ; DOS function: Display string
    INT 21H

    ; -- Step 2: Ask the computer for the time --
    MOV AH, 2CH          ; DOS function 2CH: Get System Time
    INT 21H              ; This returns: CH=Hour, CL=Minute, DH=Second
    
    ; -- Step 3: Display Hours --
    MOV AL, CH           ; AL now holds the hours (0-23)
    CALL DISPLAY_DIGITS  ; Call our helper to show the number

    ; -- Step 4: Display a colon ':' as a separator --
    MOV DL, ':'
    MOV AH, 02H          ; DOS function: Display single character
    INT 21H

    ; -- Step 5: Display Minutes --
    MOV AL, CL           ; AL now holds the minutes (0-59)
    CALL DISPLAY_DIGITS

    ; -- Step 6: Display another colon ':' --
    MOV DL, ':'
    MOV AH, 02H
    INT 21H

    ; -- Step 7: Display Seconds --
    MOV AL, DH           ; AL now holds the seconds (0-59)
    CALL DISPLAY_DIGITS

    ; -- Step 8: Exit the program --
    MOV AH, 4CH          
    INT 21H

; --- HELPER PROCEDURE: Convert a number (0-59) to two ASCII digits and print them ---
; Input: AL = Number to display
DISPLAY_DIGITS PROC
    ; The 'AAM' instruction is a special trick. It takes a number in AL 
    ; (like 45) and splits it between AH and AL (AH=4, AL=5).
    AAM                  
    
    MOV BX, AX           ; Save those two digits in the BX register
    
    ; -- Print the first digit (Tens place) --
    MOV DL, BH           ; Move the tens digit into DL
    ADD DL, 30H          ; Convert the number (e.g., 4) to ASCII character ('4')
    MOV AH, 02H          ; DOS function: Print character
    INT 21H
    
    ; -- Print the second digit (Units place) --
    MOV DL, BL           ; Move the units digit into DL
    ADD DL, 30H          ; Convert the number (e.g., 5) to ASCII character ('5')
    MOV AH, 02H
    INT 21H
    
    RET
DISPLAY_DIGITS ENDP

END
