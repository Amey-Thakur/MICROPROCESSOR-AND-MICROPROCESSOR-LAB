; =================================================================================================
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to perform 16-bit multiplication of two hexadecimal numbers.
; -------------------------------------------------------------------------------------------------
; HOW IT WORKS: 
; 1. Define two 16-bit numbers.
; 2. Load them into registers (AX and BX).
; 3. Execute 'MUL'. The 32-bit result is stored across two registers: DX (High) and AX (Low).
; 4. Move the result from registers into a 32-bit (Double-Word) memory variable.
; =================================================================================================

; --- DATA SEGMENT ---
DATA SEGMENT
    A DW 1234H     ; Multilicand (16-bit)
    B DW 5678H     ; Multiplier (16-bit)
    C DD ?         ; 'DD' (Define Double-word) reserves 32 bits for the product result
DATA ENDS

; --- CODE SEGMENT ---
CODE SEGMENT
ASSUME DS:DATA, CS:CODE
START:
    ; -- Initialization --
    MOV AX, DATA   
    MOV DS, AX
    
    ; -- Core Logic: Performing Multiplication --
    MOV AX, A      ; Move 'A' into AX register
    MOV BX, B      ; Move 'B' into BX register
    MUL BX         ; Multiply AX by BX (DX:AX = AX * BX).
                   ; The result of multipling two 16-bit numbers can be up to 32 bits.
    
    ; -- Storing the 32-bit result --
    MOV WORD PTR C, AX   ; Store the lower 16 bits (from AX) into the first word of 'C'
    MOV WORD PTR C+2, DX ; Store the upper 16 bits (from DX) into the second word of 'C'
    
    ; -- Cleanup --
    INT 3          ; Stop program for result verification
CODE ENDS
END START