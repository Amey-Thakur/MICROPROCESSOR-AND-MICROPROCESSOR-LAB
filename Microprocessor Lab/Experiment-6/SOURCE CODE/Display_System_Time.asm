; -------------------------------------------------------------------------------------------------
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to fetch and display the System Time (HH:MM:SS).
; -------------------------------------------------------------------------------------------------

.MODEL SMALL
.DATA
    MSG DB 10, 13, "CURRENT SYSTEM TIME IS : $"

.CODE
    MOV AX, @DATA        ; Initialize Data Segment
    MOV DS, AX

    LEA DX, MSG          ; Display result prefix message
    MOV AH, 09H
    INT 21H

    MOV AH, 2CH          ; DOS function to get system time
    INT 21H              ; Returns: CH=Hour, CL=Minute, DH=Second, DL=1/100 sec

    ; Display Hours
    MOV AL, CH           ; AL = Hours (binary)
    CALL DISPLAY         ; Display AL in decimal format

    ; Display Separator ':'
    MOV DL, ':'
    MOV AH, 02H
    INT 21H

    ; Display Minutes
    MOV AL, CL           ; AL = Minutes (binary)
    CALL DISPLAY

    ; Display Separator ':'
    MOV DL, ':'
    MOV AH, 02H
    INT 21H

    ; Display Seconds
    MOV AL, DH           ; AL = Seconds (binary)
    CALL DISPLAY

    MOV AH, 4CH          ; Terminate program
    INT 21H

; Procedure to convert binary AL (0-59) to ASCII and display
DISPLAY PROC
    AAM                  ; ASCII Adjust for Multiplication
                         ; Splits AL into AH (tens) and AL (units)
    MOV BX, AX           ; Save result in BX
    
    ; Display tens digit
    MOV DL, BH           ; BH contains tens digit
    ADD DL, 30H          ; Convert to ASCII
    MOV AH, 02H
    INT 21H
    
    ; Display units digit
    MOV DL, BL           ; BL contains units digit
    ADD DL, 30H          ; Convert to ASCII
    MOV AH, 02H
    INT 21H
    
    RET
DISPLAY ENDP

END
