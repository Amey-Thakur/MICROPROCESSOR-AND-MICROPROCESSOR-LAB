; =================================================================================================
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to perform 16-bit addition of two hexadecimal numbers.
; -------------------------------------------------------------------------------------------------
; HOW IT WORKS: 
; 1. Define two 16-bit numbers in the data section.
; 2. Load the numbers into the processor's registers (AX and BX).
; 3. Perform the 'ADD' operation.
; 4. Store the final result back into a memory location.
; =================================================================================================

; --- DATA SEGMENT: This is where we define the variables used in our program ---
DATA SEGMENT
    A DW 0202H      ; 'DW' (Define Word) creates a 16-bit variable 'A' with value 0202H
    B DW 0408H      ; 'DW' creates another 16-bit variable 'B' with value 0408H
    C DW ?          ; '?' indicates that the value is currently unknown/uninitialized
DATA ENDS

; --- CODE SEGMENT: This is where the actual logic/instructions of the program reside ---
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
    START:
    ; -- Initialization: We must tell the CPU where our data is stored --
    MOV AX, DATA    ; Load the memory address of the DATA segment into the AX register
    MOV DS, AX      ; Move that address from AX into DS (Data Segment register)
    
    ; -- Core Logic: Performing the Addition --
    MOV AX, A       ; Copy the 16-bit value of 'A' into the AX (Accumulator) register
    MOV BX, B       ; Copy the 16-bit value of 'B' into the BX (Base) register
    ADD AX, BX      ; Add the value in BX to AX. The result is stored back in AX (AX = AX + BX)
    MOV C, AX       ; Move the final calculated sum from the AX register into variable 'C'
    
    ; -- Cleanup: Stop the program --
    INT 3           ; Generate a 'Breakpoint' interrupt (used for debugging/halting)
CODE ENDS
END START