section.text
global _start
	_start:
	MOV bx, 3
	call proc_fact
	add ax, 30h
	MOV [fact], ax
	MOVedx,len
	MOVecx,msg
	MOVebx,1
	MOVeax,4
	int 0x80
	MOV edx,1
	MOVecx,fact
	MOVebx,1
	MOVeax,4
	int 0x80
	MOVeax,1
	int 0x80
	
	proc_fact:
	cmp bl, 1
	jg do_calculation
	MOV ax, 1
	ret
	do_calculation:
	dec bl
	call proc_fact
	inc bl
	mul bl
	ret
	
	section.data
	msg db 'Factorial 3 is:',0xa
	len equ $ - msg
	
	section .bss
	fact resb 1