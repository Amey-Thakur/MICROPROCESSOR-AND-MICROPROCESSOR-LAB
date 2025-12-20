; -------------------------------------------------------------------------------------------------
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program for Hexadecimal to BCD and BCD to Hexadecimal conversion.
; -------------------------------------------------------------------------------------------------

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

main: 
	lea dx,menu          ; Display choice menu
	mov ah,09H
	int 21h
	mov ah,01h           ; Read choice
	int 21h
	cmp al,'1'           ; Check if choice is 1 (Hex to BCD)
	je case1
	cmp al,'2'           ; Check if choice is 2 (BCD to Hex)
	je case2
	jmp exit             ; Exit if choice is 3 or other

exit: 
	mov ah,4Ch           ; Terminate program
	int 21h

case1: 
	call hextobcd        ; Run Hex to BCD conversion
	jmp main

case2: 
	call bcdtohex        ; Run BCD to Hex conversion
	jmp main

hextobcd proc
	lea dx,m1            ; Prompt for Hex number
	mov ah,09h
	int 21h
	mov ch,04h           ; Count for 4 digits

loop1: 
	mov ah,01h           ; Read character
	int 21h
	cmp al,39h           ; Check if digit is 0-9
	jbe skip1
	sub al,07h           ; Convert A-F to numeric value

skip1: 
	sub al,30h           ; ASCII to Hex
	mov ah,00h
	add num,ax           ; Add to num
	rol num,04           ; Shift left for next digit
	dec ch
	jnz loop1
	rol num,04           ; Correct position after rolling
	
	mov ax,num
	mov dx,0000h
	mov bx,000Ah         ; Divisor for BCD conversion
	lea si,arr

loop2: 
	div bx               ; Divide by 10
	mov [si],dx          ; Store remainder (BCD digit)
	inc si
	inc count
	mov dx,0000h
	cmp ax,0000h
	jnz loop2
	
	lea dx,m2            ; Display result prefix
	mov ah,09h
	int 21h
	dec si
	mov ch,05h           ; Display 5 digits

loop3: 
	mov dl,[si]          ; Get digit from array
	cmp dl,09h           ; Check if digit is 0-9
	jbe skip2
	add dl,07h

skip2: 
	add dl,30h           ; Hex to ASCII
	mov ah,02h           ; Display character
	int 21h
	dec si
	dec ch
	jnz loop3
	ret
hextobcd endp

bcdtohex proc
	lea dx,m3            ; Prompt for 5-digit BCD
	mov ah,09h
	int 21h	
	mov bx,0000h
	lea si,count
	mov dl,05h
	mov [si],dl

loop4: 
	mov ah,01h           ; Read character
	int 21h
	cmp al,39h
	jbe skip3
	sub al,07h

skip3: 
	sub al,30h           ; ASCII to value
	mov ah,00h
	mul num1             ; Multiply by current power of 10
	add bx,ax            ; Accumulate in BX
	mov dx,0000h
	mov ax,num1	
	div num2             ; Reduce power of 10 (10000 -> 1000 -> 100...)
	mov num1,ax
	dec count
	jnz loop4
	
	lea dx,m4            ; Display result prefix
	mov ah,09h
	int 21h
	mov ch,04h	

loop5: 
	rol bx,04h           ; Get highest hex nibble
	mov num3,bx
	and bx,000Fh         ; Mask all but 4 bits
	cmp bl,09h
	jbe skip4
	add bl,07h

skip4: 
	add bl,30h           ; Num to ASCII
	mov dl,bl
	mov ah,02h           ; Display hex digit
	int 21h
	mov bx,num3
	dec ch
	jnz loop5
	ret
bcdtohex endp

end
