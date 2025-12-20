; -------------------------------------------------------------------------------------------------
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to perform 8-bit subtraction.
; -------------------------------------------------------------------------------------------------

data segment
	a db 08h       ; Define 8-bit minuend 'a'
	b db 03h       ; Define 8-bit subtrahend 'b'
	c dw ?         ; Reserve 16-bit word for the result
data ends

code segment
assume cs:code, ds:data
	start:
	mov ax, data   ; Initialize Data Segment
	mov ds, ax
	
	mov al, a      ; Move 8-bit value from 'a' into AL
	mov bl, b      ; Move 8-bit value from 'b' into BL
	sub al, bl     ; Subtract BL from AL (AL = AL - BL)
	mov c, ax      ; Store result (AX register) in 'c'
	
	int 3          ; Breakpoint interrupt
	code ends
end start
