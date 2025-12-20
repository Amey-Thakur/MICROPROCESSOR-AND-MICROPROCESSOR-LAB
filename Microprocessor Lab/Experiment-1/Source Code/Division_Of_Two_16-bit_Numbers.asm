; =================================================================================================
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to perform 16-bit division of two hexadecimal numbers.
; -------------------------------------------------------------------------------------------------
; HOW IT WORKS: 
; 1. Define a 16-bit dividend and a 16-bit divisor.
; 2. Load the dividend into the AX register and the divisor into BX.
; 3. Execute the 'DIV' instruction.
; 4. The quotient is automatically stored in AX and the remainder in DX.
; =================================================================================================

; --- DATA SEGMENT: Variables are defined here ---
DATA SEGMENT
    A DW 4444H     ; Dividend: The number being divided (16-bit)
    B DW 0002H     ; Divisor: The number dividing the dividend (16-bit)
    C DW ?         ; Memory location reserved for storing the Quotient
DATA ENDS

; --- CODE SEGMENT: Instructions are written here ---
CODE SEGMENT
ASSUME DS:DATA, CS:CODE
START:
    ; -- Initialization: Set up the program to access its data --
    MOV AX, DATA   
    MOV DS, AX
    
    ; -- Core Logic: Performing the Division --
    MOV AX, A      ; Move the dividend 'A' into the AX register
    MOV BX, B      ; Move the divisor 'B' into the BX register
    DIV BX         ; Perform the division (AX = AX / BX).
                   ; Note: DX register will hold the remainder (if any).
    MOV C, AX      ; Store the 16-bit quotient into the variable 'C'
    
    ; -- Cleanup --
    INT 3          ; Breakpoint for debugger to inspect results
CODE ENDS
END START