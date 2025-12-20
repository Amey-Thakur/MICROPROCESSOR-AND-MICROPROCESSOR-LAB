; -------------------------------------------------------------------------------------------------
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to find the Minimum number in an array.
; -------------------------------------------------------------------------------------------------

DATA SEGMENT
	ARRAY DB 9, 5, 8, 3, 9, 2, 1, 4, 7  ; Define the array of numbers
	MIN DB ?                            ; Variable to store the minimum value
	LEN DW $-ARRAY                      ; Calculate length of the array
DATA ENDS

CODE SEGMENT
ASSUME DS:DATA CS:CODE
	START:
	MOV AX, DATA        ; Initialize Data Segment
	MOV DS, AX
	
	LEA SI, ARRAY       ; Point SI to the start of the array
	MOV AL, [SI]        ; Initialize AL with the first element
	MOV CX, LEN         ; Set loop counter to array length
	DEC CX              ; Decrement CX as we already loaded the first element

FIND_MIN:
	INC SI              ; Move to next element
	CMP AL, [SI]        ; Compare current minimum (AL) with next element
	JL SKIP_UPDATE      ; If AL < [SI], current min is still valid
	MOV AL, [SI]        ; If AL >= [SI], update current minimum in AL

SKIP_UPDATE:
	LOOP FIND_MIN       ; Decrement CX and repeat until CX = 0

	MOV MIN, AL         ; Store the final minimum value in 'MIN'

	MOV AH, 4CH         ; Terminate program
	INT 21H
CODE ENDS
END START
