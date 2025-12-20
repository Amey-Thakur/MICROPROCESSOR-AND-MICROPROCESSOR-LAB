; =================================================================================================
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to display a string using a Macro.
; -------------------------------------------------------------------------------------------------
; WHAT IS A MACRO?
; A macro is like a "shortcut" or a "template" for code. Instead of writing the same 3 or 4 
; lines every time you want to print a message, you define a macro once and just use its 
; name whenever you need it. The assembler "copies and pastes" the actual code for you.
;
; HOW IT WORKS: 
; 1. Define a macro named 'DISPLAY_STR' that takes one argument (the message to print).
; 2. In the main program, simply "call" the macro by writing its name followed by the message.
; 3. This makes the code much cleaner and easier to read.
; =================================================================================================

; --- MACRO DEFINITION ---
; This is our reusable template for displaying strings.
DISPLAY_STR MACRO MSG
    LEA DX, MSG        ; Load the memory address of the message into the DX register
    MOV AH, 09H        ; DOS function: Display a '$'-terminated string
    INT 21H            ; Trigger the interrupt to perform the display
ENDM

DATA SEGMENT
    MES1 DB 10, 13, " ------------------------------"
         DB 10, 13, " DISPLAYING STRING USING MACRO"
         DB 10, 13, " ------------------------------$"
    MES2 DB 10, 13, " HELLO! THIS PROGRAM WAS BUILT USING REUSABLE MACROS.$"
DATA ENDS

CODE SEGMENT
ASSUME DS:DATA, CS:CODE
START:
    ; -- Initialization --
    MOV AX, @DATA      
    MOV DS, AX

    ; -- Using the Macro --
    DISPLAY_STR MES1   ; The assembler replaces this line with the code from the macro
    DISPLAY_STR MES2   ; It also replaces this with the same code, but for MES2

    ; -- Exit Program --
    MOV AH, 4CH        
    INT 21H
CODE ENDS
END START
