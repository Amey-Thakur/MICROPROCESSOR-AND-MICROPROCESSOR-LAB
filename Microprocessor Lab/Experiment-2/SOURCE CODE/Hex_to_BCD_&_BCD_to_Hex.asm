.model small
.data
	menu db 10d,13d," MENU"
		db 10d,"1. Hex to BCD"
		db 10d,"2. BCD to Hex"
		db 10d,"3. Exit"
		db 10d,"Enter your choice: $"
	m1 db 10d,"Enter 4 Digit Hex Number: $"
	m2 db 10d,"Equivalent BCD Number: $"
	num dw 0000h
	arr db 5 dup(0)
	count db 00h
	
	m3 db 10d,"Enter 5 Digit BCD Number: $"
	m4 db 10d,"Equivalent Hex Number: $"
	num1 dw 10000D
	num2 dw 10d
	num3 dw ?
	
.code
	mov ax,@data
	mov ds,ax

main: lea dx,menu
	mov ah,09H
	int 21h
	mov ah,01h
	int 21h
	cmp al,'1'
	je case1
	cmp al,'2'
	je case2
	jmp exit

exit: mov ah,4Ch
	int 21h
case1: call hextobcd
	jmp main
case2: call bcdtohex
	jmp main

hextobcd proc
	lea dx,m1
	mov ah,09h
	int 21h
	mov ch,04h

loop1: mov ah,01h
	int 21h
	cmp al,39h
	jbe skip1
	sub al,07h

skip1: sub al,30h
	mov ah,00h
	add num,ax
	rol num,04
	dec ch
	jnz loop1
	rol num,04
	mov ax,num
	mov dx,0000h
	mov bx,000Ah
	lea si,arr

loop2: div bx
	mov [si],dx
	inc si
	inc count
	mov dx,0000h
	cmp ax,0000h
	jnz loop2
	
	lea dx,m2
	mov ah,09h
	int 21h
	dec si
	mov ch,05h

loop3: mov dl,[si]
	cmp dl,09h
	jbe skip2
	add dl,07h

skip2: add dl,30h
	mov ah,02h
	int 21h
	dec si
	dec ch
	jnz loop3
	ret
endp
bcdtohex proc
	lea dx,m3
	mov ah,09h
	int 21h	
	mov bx,0000h
	lea si,count
	mov dl,05h
	mov [si],dl

loop4: mov ah,01h
	int 21h
	cmp al,39h
	jbe skip3
	sub al,07h

skip3: sub al,30h
	mov ah,00h
	mul num1	
	add bx,ax
	mov dx,0000h
	mov ax,num1	
	div num2
	mov num1,ax
	dec count
	jnz loop4
	lea dx,m4
	mov ah,09h
	int 21h
	mov ch,04h	

loop5: rol bx,04h
	mov num3,bx
	and bx,000Fh
	cmp bl,09h
	jbe skip4
	add bl,07h

skip4: add bl,30h
	mov dl,bl
	mov ah,02h
	int 21h
	mov bx,num3
	dec ch
	jnz loop5
	ret
endp
end