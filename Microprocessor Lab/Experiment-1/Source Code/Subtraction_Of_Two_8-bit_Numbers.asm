; =================================================================================================
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to perform 8-bit subtraction of two hexadecimal numbers.
; -------------------------------------------------------------------------------------------------
; HOW IT WORKS: 
; 1. Define two 8-bit numbers.
; 2. Load them into 8-bit registers (AL and BL).
; 3. Perform the 'SUB' instruction.
; 4. Store the 8-bit result safely in memory.
; =================================================================================================

; --- DATA SEGMENT ---
DATA SEGMENT
    A DB 08H       ; Minuend (8-bit)
    B DB 03H       ; Subtrahend (8-bit)
    C DW ?         ; Word (16-bit) to store result (AL contains the difference)
DATA ENDS

; --- CODE SEGMENT ---
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
    START:
    ; -- Initialization --
    MOV AX, DATA   
    MOV DS, AX
    
    ; -- Core Logic: Performing Subtraction --
    MOV AL, A      ; Move 8-bit value from 'A' into AL
    MOV BL, B      ; Move 8-bit value from 'B' into BL
    SUB AL, BL     ; Subtract BL from AL (AL = AL - BL)
    MOV C, AX      ; Store result (AX register) into 'C'
    
    ; -- Cleanup --
    INT 3          ; Halt for status check
    CODE ENDS
END START
