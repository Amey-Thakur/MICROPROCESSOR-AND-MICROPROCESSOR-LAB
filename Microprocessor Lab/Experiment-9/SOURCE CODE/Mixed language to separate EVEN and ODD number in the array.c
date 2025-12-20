#include<conio.h>
#include<stdio.h>
#include<stdlib.h>

void main()
{
	int arr[10], ev[10], odd[10];
	int no;
	char rem, dv=2;
	int i, j=0, k=0, l1, l2;
	clrscr();
	printf("\n enter the array elements: ");
	for(i=0; i<10; i++)
		scanf("%d",&arr[i]);
	asm lea si, arr
	asm mov cx, 0AH
	back: asm mov ax,[si]
	asm mov no, ax
	asm mov bl, dv
	asm div bl
	asm mov rem, ah
	if(rem==1)
	{
		odd[j]=no;
		j++;
		l1=j;
	}
	else
	{
		ev[k]=no;
		k++;
		l2=k;
	}	
	asm inc si
	asm inc si
	asm dec cx
	asm jnz back
	printf("\n even array : ");
	for(i=0; i<l2; i++)	
		printf("%d", ev[i]);
	printf("\n odd array : ");
	for(i=0; i<l1; i++)
		printf("%d", odd[i]);
	getch();
}