; =================================================================================================
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to perform 8-bit division of two hexadecimal numbers.
; -------------------------------------------------------------------------------------------------
; HOW IT WORKS: 
; 1. Define an 8-bit dividend and an 8-bit divisor.
; 2. Load the dividend into the AL register (part of the larger AX register).
; 3. Load the divisor into a general register (BL).
; 4. Execute 'DIV'. The Quotient goes to AL and the Remainder goes to AH.
; =================================================================================================

; --- DATA SEGMENT ---
DATA SEGMENT
    A DB 28H       ; Dividend (8-bit)
    B DB 02H       ; Divisor (8-bit)
    C DW ?         ; Word (16-bit) to store both Quotient (AL) and Remainder (AH)
DATA ENDS

; --- CODE SEGMENT ---
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    ; -- Initialization --
    MOV AX, DATA   
    MOV DS, AX
    
    ; -- Core Logic: Performing the Division --
    MOV AX, 0000H  ; Clear the AX register to avoid garbage values
    MOV BX, 0000H  ; Clear BX register
    MOV AL, A      ; Load the 8-bit dividend into AL
    MOV BL, B      ; Load the 8-bit divisor into BL
    DIV B          ; Perform division (AX / B). Result: AL = Quotient, AH = Remainder.
    MOV C, AX      ; Save the combined result (AX) into memory location 'C'
    
    ; -- Cleanup --
    INT 3          ; Halt for inspection
CODE ENDS
END START