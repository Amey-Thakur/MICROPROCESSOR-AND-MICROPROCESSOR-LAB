; -------------------------------------------------------------------------------------------------
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to perform 16-bit multiplication.
; -------------------------------------------------------------------------------------------------

data segment
	a dw 1234h     ; Define 16-bit multiplicand 'a'
	b dw 5678h     ; Define 16-bit multiplier 'b'
	c dd ?         ; Reserve 32-bit double-word 'c' for result
data ends

code segment
assume ds:data, cs:code
start:
	mov ax, data   ; Initialize Data Segment
	mov ds, ax
	
	mov ax, a      ; Load 'a' into AX
	mov bx, b      ; Load 'b' into BX
	mul bx         ; Multiply AX by BX (DX:AX = AX * BX)
	mov word ptr c, ax   ; Store the lower 16 bits of the result in the lower word of 'c'
	mov word ptr c+2, dx ; Store the upper 16 bits of the result in the upper word of 'c'
	
	int 3          ; Breakpoint interrupt
	code ends
end start