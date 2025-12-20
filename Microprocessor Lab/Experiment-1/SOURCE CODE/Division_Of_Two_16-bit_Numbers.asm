; -------------------------------------------------------------------------------------------------
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to perform 16-bit division.
; -------------------------------------------------------------------------------------------------

data segment
	a dw 4444h     ; Define 16-bit dividend 'a'
	b dw 0002h     ; Define 16-bit divisor 'b'
	c dw ?         ; Reserve 16-bit word for quotient
data ends

code segment
assume ds:data, cs:code
start:
	mov ax, data   ; Initialize Data Segment
	mov ds, ax
	
	mov ax, a      ; Load dividend into AX
	mov bx, b      ; Load divisor into BX
	div bx         ; Divide AX by BX (AX = AX / BX, DX = remainder)
	mov c, ax      ; Store the quotient in 'c'
	
	int 3          ; Breakpoint interrupt
	code ends
end start