/* =================================================================================================
 * AUTHOR      : Amey Thakur
 * REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
 * DESCRIPTION : Mixed C and Assembly program to separate Even and Odd numbers from an array.
 * -------------------------------------------------------------------------------------------------
 * HOW IT WORKS:
 * 1. Read 10 numbers from the user using standard C 'scanf'.
 * 2. Use 'Inline Assembly' (the 'asm' blocks) to interact directly with the CPU.
 * 3. Assembly Logic:
 *    - Load the array address into SI and set a counter (CX) to 10.
 *    - For each number:
 *      - Divide it by 2.
 *      - Check the remainder (stored in the 'AH' register).
 *      - If Remainder == 1, it's ODD. Otherwise, it's EVEN.
 * 4. Use C to display the organized Even and Odd lists.
 * =================================================================================================
 */

#include <stdio.h>

void main() {
    int arr[10], ev[10], odd[10];
    int current_val;
    char remainder;
    int divisor = 2;
    int i, j = 0, k = 0;
    int odd_count = 0, even_count = 0;

    printf("\n --- Mixed C and Assembly: Even/Odd Separator --- \n");
    printf("\n Enter 10 elements for the array: \n");
    
    // -- Step 1: Input Phase (Standard C) --
    for (i = 0; i < 10; i++) {
        printf(" Element %d: ", i + 1);
        scanf("%d", &arr[i]);
    }

    // -- Step 2: Processing Phase (Mixed C and Assembly) --
    // We use assembly for the core logic of checking the remainder.
    for (i = 0; i < 10; i++) {
        current_val = arr[i];

        // This block tells the computer to use its own low-level language (Assembly)
        asm {
            mov ax, current_val   // Load the number into AX register
            mov bl, divisor       // Load 2 into BL
            div bl                // Divide AX by BL. Remainder is kept in AH.
            mov remainder, ah     // Move the remainder back into our C variable
        }

        if (remainder == 1) {
            odd[j] = current_val; // If remainder is 1, it's an Odd number
            j++;
            odd_count = j;
        } else {
            ev[k] = current_val;  // If remainder is 0, it's an Even number
            k++;
            even_count = k;
        }
    }

    // -- Step 3: Output Phase (Standard C) --
    printf("\n ===========================");
    printf("\n EVEN ARRAY: ");
    for (i = 0; i < even_count; i++) {
        printf("%d ", ev[i]);
    }

    printf("\n ODD ARRAY: ");
    for (i = 0; i < odd_count; i++) {
        printf("%d ", odd[i]);
    }
    printf("\n ===========================\n");
}
