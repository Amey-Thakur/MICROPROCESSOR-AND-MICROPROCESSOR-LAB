data segment
	a dw 9A88h
	b dw 8765h
	c dw ?
data ends

code segment
assume cs:code,ds:data
	start:
	mov ax,data
	mov ds,ax
	mov ax,a
	mov bx,b
	sub ax,bx
	mov c,ax
	int 3
	code ends
end start