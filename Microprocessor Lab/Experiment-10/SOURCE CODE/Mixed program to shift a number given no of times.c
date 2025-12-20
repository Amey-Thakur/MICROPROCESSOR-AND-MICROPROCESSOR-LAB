#include<stdio.h>
#include<conio.h>

void main()
{
	int num=0, times=0, choice=0;
	clrscr();
	printf("ENTER A NUMBER: ");
	scanf("%d", &num);
	printf("\nENTER NUMBER OF TIMES TO ROTATE: ");
	scanf("%d", &times);
	printf("\n1.LEFT SHIFT");
	printf("\n2.RIGHT SHIFT");
	printf("\nENTER CHOICE: ");
	scanf("%d", &choice);
	asm mov ax, num
	asm mov cx, times
	if (choice == 1)	
	{
		asm shl ax, cl
	}
	else if (choice == 2)
	{
		asm shr ax, cl
	}	
	else
	{
		printf("\nINVALID CHOICE");
	}
	asm mov num, ax
	printf("\nRESULT: %d", num);
	getch();
}