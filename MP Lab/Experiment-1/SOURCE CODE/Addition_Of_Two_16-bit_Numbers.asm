data segment
	a dw 0202h
	b dw 0408h
	c dw ?
data ends

code segment
assume cs:code,ds:data
	start:
	mov ax,data
	mov ds,ax
	mov ax,a
	mov bx,b
	add ax,bx
	mov c,ax
	int 3
	code ends
end start