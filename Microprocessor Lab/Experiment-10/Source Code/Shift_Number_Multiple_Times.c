/* =================================================================================================
 * AUTHOR      : Amey Thakur
 * REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
 * DESCRIPTION : Mixed C and Assembly program to perform bitwise Shifting on a number.
 * -------------------------------------------------------------------------------------------------
 * WHAT IS SHIFTING?
 * Shifting is like moving the digits of a binary number (0s and 1s) to the left or right.
 * - Left Shift: Moving bits to the left effectively multiplies the number by 2 for each shift.
 * - Right Shift: Moving bits to the right effectively divides the number by 2 for each shift.
 *
 * HOW IT WORKS: 
 * 1. Ask the user for a number and how many times they want to shift it.
 * 2. Ask whether they want a Left Shift or a Right Shift.
 * 3. Use 'Inline Assembly' to execute the 'SHL' (Shift Left) or 'SHR' (Shift Right) 
 *    instructions directly on the CPU registers.
 * 4. Display the resulting modified number.
 * =================================================================================================
 */

#include <stdio.h>

void main() {
    int val, n, choice, res;

    printf("\n --- Mixed C and Assembly: Bitwise Shifter --- \n");
    
    // -- Step 1: Get user data --
    printf(" Enter the number: ");
    scanf("%d", &val);
    printf(" Enter how many times to shift: ");
    scanf("%d", &n);
    
    // -- Step 2: Get user's choice --
    printf("\n CHOOSE AN OPERATION:");
    printf("\n 1. Left Shift (Multiply effect)");
    printf("\n 2. Right Shift (Divide effect)");
    printf("\n Choice (1/2): ");
    scanf("%d", &choice);

    // -- Step 3: Perform the Shift using Assembly --
    if (choice == 1) {
        // -- Left Shift --
        asm {
            mov ax, val   // Load the original number into AX
            mov cx, n     // Load the shift count into CX
            shl ax, cl    // SHift Left AX register by the count in CL
            mov res, ax   // Move the result back into our C variable
        }
        printf("\n [%d] shifted LEFT [%d] times results in: %d\n", val, n, res);
    } 
    else if (choice == 2) {
        // -- Right Shift --
        asm {
            mov ax, val   // Load the original number into AX
            mov cx, n     // Load the shift count into CX
            shr ax, cl    // SHift Right AX register by the count in CL
            mov res, ax   // Move the result back into our C variable
        }
        printf("\n [%d] shifted RIGHT [%d] times results in: %d\n", val, n, res);
    } 
    else {
        printf("\n Invalid Choice! \n");
    }

    printf("\n ============================================= \n");
}
