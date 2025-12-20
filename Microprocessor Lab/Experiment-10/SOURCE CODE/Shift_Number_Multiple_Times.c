/* -------------------------------------------------------------------------------------------------
 * AUTHOR      : Amey Thakur
 * REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
 * DESCRIPTION : Mixed C and Assembly program to shift a number a given number of times.
 * -------------------------------------------------------------------------------------------------
 */

#include<stdio.h>

void main() {
    int val, n, res;

    // Prompt user for the number and number of shifts
    printf("Enter the number to be shifted: ");
    scanf("%d", &val);
    printf("Enter the number of times to shift: ");
    scanf("%d", &n);

    // Perform logical shift left using inline assembly
    asm {
        mov ax, val  // Load values into AX register
        mov cx, n    // Load shift count into CX
        shl ax, cl   // Shift AX left by CL bits
        mov res, ax  // Store result back in C variable
    }

    // Display the result
    printf("\nThe result after shifting %d left by %d times is: %d\n", val, n, res);
}
