data segment
	msg1 db "This is a message $"
	display macro msg1
	push ax
	push dx
	lea dx,msg1
	mov ah, 09h
	int 21h
	pop dx
	pop ax
	endm
data ends

code segment
assume cs:code, ds:data
	start:
	mov ax, data
	mov ds,ax
	display msg1
	mov ah, 4ch
	int 21h
	code ends
end start