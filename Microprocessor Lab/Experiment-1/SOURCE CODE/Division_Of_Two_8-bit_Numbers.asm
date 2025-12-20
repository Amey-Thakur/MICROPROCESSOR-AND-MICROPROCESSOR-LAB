; -------------------------------------------------------------------------------------------------
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to perform 8-bit division.
; -------------------------------------------------------------------------------------------------

data segment
	a db 28h       ; Define 8-bit dividend 'a' (40 in decimal)
	b db 02h       ; Define 8-bit divisor 'b'
	c dw ?         ; Reserve word to store Quotient (AL) and Remainder (AH)
data ends

code segment
assume cs:code, ds:data
start:
	mov ax, data   ; Initialize Data Segment
	mov ds, ax
	
	mov ax, 0000h  ; Clear AX register
	mov bx, 0000h  ; Clear BX register
	mov al, a      ; Load 8-bit dividend into AL
	mov bl, b      ; Load 8-bit divisor into BL
	div b          ; Divide AL by BL (AL = Quotient, AH = Remainder)
	mov c, ax      ; Store the result (AX) into 'c'
	
	int 3          ; Breakpoint interrupt
	code ends
end start