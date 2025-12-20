; -------------------------------------------------------------------------------------------------
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to sort an array of numbers in Descending Order using Bubble Sort.
; -------------------------------------------------------------------------------------------------

DATA SEGMENT
	ARRAY DB 5, 2, 8, 3, 9, 6, 4, 0, 1, 7 ; Define the array of numbers
	LEN DW $-ARRAY                        ; Calculate length of the array
DATA ENDS

CODE SEGMENT
ASSUME DS:DATA CS:CODE
	START:
	MOV AX, DATA        ; Initialize Data Segment
	MOV DS, AX
	
	MOV CX, LEN         ; Load total number of elements
	DEC CX              ; Outer loop counter (n-1 passes)

OUTER_LOOP:
	LEA SI, ARRAY       ; Point SI to the start of the array
	MOV BX, 0           ; Reset inner loop counter

INNER_LOOP:
	INC BX              ; Increment inner counter
	MOV AL, ARRAY[SI]   ; Load current element into AL
	INC SI              ; Increment SI to point to next element
	CMP ARRAY[SI], AL   ; Compare next (ARRAY[SI]) with current (AL)
	JB SKIP_SWAP        ; If next < current, no swap needed (Descending order)
	
	XCHG AL, ARRAY[SI]  ; Swap elements if next > current
	MOV ARRAY[SI-1], AL ; Store the larger value back
	
SKIP_SWAP:
	CMP BX, CX          ; Check if inner loop pass is complete
	JL INNER_LOOP       ; Repeat inner loop if BX < CX
	
	LOOP OUTER_LOOP     ; Decrement CX and repeat outer loop until CX = 0

	MOV AH, 4CH         ; Terminate program
	INT 21H
CODE ENDS
END START
