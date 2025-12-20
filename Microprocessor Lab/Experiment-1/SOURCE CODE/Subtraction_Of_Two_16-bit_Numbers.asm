; -------------------------------------------------------------------------------------------------
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to perform 16-bit subtraction.
; -------------------------------------------------------------------------------------------------

data segment
	a dw 9A88h     ; Define 16-bit minuend 'a'
	b dw 8765h     ; Define 16-bit subtrahend 'b'
	c dw ?         ; Reserve 16-bit word for the result
data ends

code segment
assume cs:code, ds:data
	start:
	mov ax, data   ; Initialize Data Segment
	mov ds, ax
	
	mov ax, a      ; Move value from 'a' into AX register
	mov bx, b      ; Move value from 'b' into BX register
	sub ax, bx     ; Subtract BX from AX (AX = AX - BX)
	mov c, ax      ; Store the difference in 'c'
	
	int 3          ; Breakpoint interrupt
	code ends
end start
