; =================================================================================================
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to perform 16-bit subtraction of two hexadecimal numbers.
; -------------------------------------------------------------------------------------------------
; HOW IT WORKS: 
; 1. Define two 16-bit numbers in the data section.
; 2. Load the numbers into CPU registers (AX and BX).
; 3. Execute 'SUB' to find the difference.
; 4. Save the result into a specific memory location.
; =================================================================================================

; --- DATA SEGMENT ---
DATA SEGMENT
    A DW 9A88H     ; Minuend: The number to be subtracted from (16-bit)
    B DW 8765H     ; Subtrahend: The number being subtracted (16-bit)
    C DW ?         ; Reserve 16 bits for the resulting difference
DATA ENDS

; --- CODE SEGMENT ---
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
    START:
    ; -- Initialization --
    MOV AX, DATA   
    MOV DS, AX
    
    ; -- Core Logic: Performing Subtraction --
    MOV AX, A      ; Move value from 'A' into AX register
    MOV BX, B      ; Move value from 'B' into BX register
    SUB AX, BX     ; Subtract value in BX from AX (AX = AX - BX)
    MOV C, AX      ; Save the calculated difference into variable 'C'
    
    ; -- Cleanup --
    INT 3          ; Halt for status check
    CODE ENDS
END START
