; -------------------------------------------------------------------------------------------------
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to perform 8-bit addition of two numbers.
; -------------------------------------------------------------------------------------------------

data segment
	a db 02h       ; Define 8-bit byte 'a' with value 02h
	b db 05h       ; Define 8-bit byte 'b' with value 05h
	c dw ?         ; Reserve 16-bit word 'c' to store the result (up to 16 bits for carry)
data ends

code segment
assume cs:code, ds:data
	start:
	mov ax, data   ; Load the address of the data segment into AX
	mov ds, ax     ; Initialize the data segment (DS)
	
	mov al, a      ; Move the 8-bit value from 'a' into the AL register
	mov bl, b      ; Move the 8-bit value from 'b' into the BL register
	add al, bl     ; Add the value in BL to AL (AL = AL + BL)
	mov c, ax      ; Store the 16-bit register AX contents into 'c' (AL contains sum, AH is 0 if no carry)
	
	int 3          ; Breakpoint interrupt
	code ends
end start