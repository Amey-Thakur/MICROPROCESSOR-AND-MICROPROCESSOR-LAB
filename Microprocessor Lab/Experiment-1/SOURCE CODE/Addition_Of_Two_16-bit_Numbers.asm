; -------------------------------------------------------------------------------------------------
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to perform 16-bit addition of two numbers.
; -------------------------------------------------------------------------------------------------

data segment
	a dw 0202h      ; Define 16-bit word 'a' with value 0202h
	b dw 0408h      ; Define 16-bit word 'b' with value 0408h
	c dw ?          ; Reserve 16-bit word 'c' to store the result
data ends

code segment
assume cs:code, ds:data
	start:
	mov ax, data    ; Load the address of the data segment into AX
	mov ds, ax      ; Initialize the data segment (DS) with the value in AX
	
	mov ax, a       ; Move the 16-bit value from 'a' into the AX register
	mov bx, b       ; Move the 16-bit value from 'b' into the BX register
	add ax, bx      ; Add the value in BX to AX (AX = AX + BX)
	mov c, ax       ; Store the final sum from AX into the memory location 'c'
	
	int 3           ; Breakpoint interrupt for debugging
	code ends
end start