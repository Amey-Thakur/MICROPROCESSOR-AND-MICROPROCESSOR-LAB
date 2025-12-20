; =================================================================================================
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to find the Minimum (smallest) number in an array.
; -------------------------------------------------------------------------------------------------
; HOW IT WORKS: 
; 1. Start by assuming the first number in the list is the smallest.
; 2. Compare this "current minimum" with the next number in the list.
; 3. If the next number is even smaller, make it the new "current minimum".
; 4. Repeat until you have checked every number in the list.
; 5. The final "current minimum" is the smallest number in the entire array.
; =================================================================================================

DATA SEGMENT
    ARRAY DB 9, 5, 8, 3, 9, 2, 1, 4, 7  ; Our list of numbers
    MIN DB ?                            ; Variable to store the final smallest value
    LEN DW $-ARRAY                      ; Automatically calculate how many numbers are in the list
DATA ENDS

CODE SEGMENT
ASSUME DS:DATA CS:CODE
    START:
    ; -- Initialization: Point the CPU to our data variables --
    MOV AX, DATA        
    MOV DS, AX
    
    ; -- Preparation --
    LEA SI, ARRAY       ; SI (Source Index) points to the first number in our array
    MOV AL, [SI]        ; Assume the first number is the smallest, load it into AL
    MOV CX, LEN         ; Load the total number of elements into CX for the loop
    DEC CX              ; We already checked the first one, so we have (Length - 1) left

FIND_MIN_LOOP:
    INC SI              ; Move our pointer to the next number in the array
    
    ; -- Comparison: Is the current candidate smaller? --
    CMP AL, [SI]        ; Compare our "current smallest" (AL) with the "next number" ([SI])
    JL SKIP_UPDATE      ; If AL is already smaller (Lower), keep it and skip the update
    
    ; -- Update: We found an even smaller number! --
    MOV AL, [SI]        ; Replace the value in AL with the new, smaller value found at [SI]

SKIP_UPDATE:
    ; -- Repeat until every number is checked --
    LOOP FIND_MIN_LOOP  ; CX decreases. If CX > 0, check the next number.

    ; -- Final Step: Save the winning smallest number --
    MOV MIN, AL         ; Transfer the final smallest value from AL register to variable 'MIN'

    ; -- Exit Program --
    MOV AH, 4CH         
    INT 21H
CODE ENDS
END START
