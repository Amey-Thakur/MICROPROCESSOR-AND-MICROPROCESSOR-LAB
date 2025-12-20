; -------------------------------------------------------------------------------------------------
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to display a string using a Macro.
; -------------------------------------------------------------------------------------------------

; Macro definition to display a string
DISPLAY_STR MACRO MSG
    LEA DX, MSG        ; Load effective address of the message
    MOV AH, 09H        ; DOS function to display string
    INT 21H            ; Call DOS interrupt
ENDM

DATA SEGMENT
    MES1 DB 10, 13, "DISPLAYING STRING USING A MACRO: $"
    MES2 DB 10, 13, "EXPERIMENTAL PROGRAM COMPLETED SUCCESSFULLY! $"
DATA ENDS

CODE SEGMENT
ASSUME DS:DATA, CS:CODE
START:
    MOV AX, @DATA      ; Initialize Data Segment
    MOV DS, AX

    DISPLAY_STR MES1   ; Call macro to display first message
    DISPLAY_STR MES2   ; Call macro to display second message

    MOV AH, 4CH        ; Terminate program
    INT 21H
CODE ENDS
END START
