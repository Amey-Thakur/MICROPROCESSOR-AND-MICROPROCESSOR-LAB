; -------------------------------------------------------------------------------------------------
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to find the Factorial of a given number.
; -------------------------------------------------------------------------------------------------

DATA SEGMENT
    M1 DB 10, 13, "ENTER THE NUMBER: $"
    M2 DB 10, 13, "FACTORIAL OF THE NUMBER IS: $"
    NUM DB ?
    FACT DW 01H        ; Default factorial value is 1 (for 0! and 1!)
DATA ENDS

CODE SEGMENT
ASSUME DS:DATA, CS:CODE
START:
    MOV AX, DATA       ; Initialize Data Segment
    MOV DS, AX

    LEA DX, M1         ; Display "ENTER THE NUMBER"
    MOV AH, 09H
    INT 21H

    MOV AH, 01H        ; Read a single digit number
    INT 21H
    SUB AL, 30H        ; Convert ASCII to numeric value
    MOV NUM, AL        ; Store in NUM

    MOV CL, AL         ; Load NUM into CL for loop counter
    MOV CH, 00H        ; Clear CH
    MOV AX, 0001H      ; Initialize AX with 1 (factorial starts at 1)

    CMP CX, 0000H      ; Check if number is 0
    JE RESULT          ; Factorial of 0 is 1, go to result

CALC_FACT:
    MUL CX             ; AX = AX * CX
    LOOP CALC_FACT     ; Decrement CX and repeat until CX = 0

RESULT:
    MOV FACT, AX       ; Store the result in FACT
    
    LEA DX, M2         ; Display result prefix
    MOV AH, 09H
    INT 21H

    MOV AX, FACT       ; Load the result for display
    CALL DISPLAY       ; Call procedure to display the factorial

    MOV AH, 4CH        ; Terminate program
    INT 21H

; Procedure to display a 16-bit number in AX as decimal
DISPLAY PROC
    MOV BX, 000Ah      ; Divisor
    MOV CX, 0000h      ; Digit counter

DIV_LOOP:
    MOV DX, 0000h
    DIV BX             ; AX / 10
    PUSH DX            ; Save remainder
    INC CX
    CMP AX, 0000h
    JNE DIV_LOOP

PRINT_LOOP:
    POP DX             ; Get digit
    ADD DL, 30H        ; Convert to ASCII
    MOV AH, 02H
    INT 21H
    LOOP PRINT_LOOP
    RET
DISPLAY ENDP

CODE ENDS
END START
