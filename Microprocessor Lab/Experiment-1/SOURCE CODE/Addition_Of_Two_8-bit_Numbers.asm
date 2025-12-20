; =================================================================================================
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to perform 8-bit addition of two hexadecimal numbers.
; -------------------------------------------------------------------------------------------------
; HOW IT WORKS: 
; 1. Define two 8-bit numbers in the data section.
; 2. Load the numbers into 8-bit registers (AL and BL).
; 3. Perform the 'ADD' operation.
; 4. Store the result in a 16-bit variable to accommodate potential carry-overs.
; =================================================================================================

; --- DATA SEGMENT: This is where we define the variables used in our program ---
DATA SEGMENT
    A DB 02H       ; 'DB' (Define Byte) creates an 8-bit variable 'A' with value 02H
    B DB 05H       ; 'DB' creates another 8-bit variable 'B' with value 05H
    C DW ?         ; 'DW' (Define Word) reserves a 16-bit space for the result
DATA ENDS

; --- CODE SEGMENT: This is where the actual logic/instructions of the program reside ---
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
    START:
    ; -- Initialization: We must tell the CPU where our data is stored --
    MOV AX, DATA   ; Load the memory address of the DATA segment into AX
    MOV DS, AX     ; Initialize the Data Segment register (DS)
    
    ; -- Core Logic: Performing the Addition --
    MOV AL, A      ; Copy the 8-bit value of 'A' into the AL (Lower Accumulator) register
    MOV BL, B      ; Copy the 8-bit value of 'B' into the BL (Lower Base) register
    ADD AL, BL     ; Add BL to AL. The 8-bit result is stored in AL.
    MOV C, AX      ; Store the 16-bit register AX contents into 'C'
                   ; (AL contains the sum, and AH will be 0 if there was no overflow)
    
    ; -- Cleanup: Stop the program --
    INT 3          ; Generate a 'Breakpoint' interrupt (used for debugging/halting)
CODE ENDS
END START