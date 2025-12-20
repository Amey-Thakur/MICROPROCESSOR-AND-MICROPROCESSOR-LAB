; =================================================================================================
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to sort an array of numbers in Ascending Order (Smallest to Largest).
; -------------------------------------------------------------------------------------------------
; ALGORITHM   : Bubble Sort
; HOW IT WORKS: 
; 1. Compare the first two numbers.
; 2. If the first is bigger than the second, swap them.
; 3. Move to the next pair and repeat until the end of the array.
; 4. After one full pass, the largest number 'bubbles up' to the end.
; 5. Repeat the process for the remaining numbers until the entire list is sorted.
; =================================================================================================

DATA SEGMENT
    ARRAY DB 6, 5, 8, 3, 9, 2, 1, 4, 7  ; Our list of unsorted numbers
    LEN DW $-ARRAY                      ; Automatically calculate the number of elements
DATA ENDS

CODE SEGMENT
ASSUME DS:DATA CS:CODE
    START:
    ; -- Initialization: Set up the data segment pointer --
    MOV AX, DATA        
    MOV DS, AX
    
    ; -- Setup Loop Counters --
    MOV CX, LEN         ; Load total number of elements into CX
    DEC CX              ; Outer loop runs (n-1) times

OUTER_LOOP:
    LEA SI, ARRAY       ; SI points to the start of the array for a new pass
    MOV BX, 0           ; BX will be our inner counter to track progress in this pass

INNER_LOOP:
    INC BX              ; Increment inner counter
    MOV AL, ARRAY[SI]   ; Load the CURRENT number into AL
    INC SI              ; Increment SI to point to the NEXT number
    
    ; -- Comparison: Is the current number smaller than the next one? --
    CMP AL, ARRAY[SI]   ; Compare 'Current' (AL) with 'Next' (ARRAY[SI])
    JB SKIP_SWAP        ; If Current < Next, they are in the right order. Skip the swap.
    
    ; -- Swap Logic: If they are in the wrong order, swap their positions --
    XCHG AL, ARRAY[SI]  ; Put the larger value into the 'Next' position
    MOV ARRAY[SI-1], AL ; Put the smaller value back into the 'Current' position
    
SKIP_SWAP:
    ; -- Check: Have we reached the end of this pass? --
    CMP BX, CX          
    JL INNER_LOOP       ; If NOT at the end, continue the INNER_LOOP
    
    ; -- Repeat: Start another pass until the whole array is sorted --
    LOOP OUTER_LOOP     ; CX decreases by 1. If CX > 0, do another outer pass.

    ; -- Exit Program --
    MOV AH, 4CH         
    INT 21H
CODE ENDS
END START
