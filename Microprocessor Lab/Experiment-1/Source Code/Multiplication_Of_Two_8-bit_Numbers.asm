; =================================================================================================
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to perform 8-bit multiplication of two hexadecimal numbers.
; -------------------------------------------------------------------------------------------------
; HOW IT WORKS: 
; 1. Define two 8-bit numbers.
; 2. Load the multiplicand into AL and the multiplier into a general purpose register or variable.
; 3. Execute 'MUL'. The 16-bit result is automatically stored in the AX register.
; =================================================================================================

; --- DATA SEGMENT ---
DATA SEGMENT
    A DB 02H       ; Multiplicand (8-bit)
    B DB 04H       ; Multiplier (8-bit)
    C DW ?         ; Reserve 16 bits (Word) to store the product result
DATA ENDS

; --- CODE SEGMENT ---
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    ; -- Initialization --
    MOV AX, DATA   
    MOV DS, AX
    
    ; -- Core Logic: Performing Multiplication --
    MOV AX, 0000H  ; Clear AX register to ensure clean calculations
    MOV BX, 0000H  ; Clear BX register
    MOV AL, A      ; Load 'A' into the 8-bit AL register
    MOV BL, B      ; Load 'B' into the 8-bit BL register
    MUL B          ; Multiply AL by 'B'. The 16-bit result is stored in AX.
    MOV C, AX      ; Save the final product from AX into memory variable 'C'
    
    ; -- Cleanup --
    INT 3          ; Halt for debugging
CODE ENDS
END START