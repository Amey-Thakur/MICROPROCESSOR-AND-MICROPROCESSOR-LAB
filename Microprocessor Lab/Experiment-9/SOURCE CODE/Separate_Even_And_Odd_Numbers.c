/* -------------------------------------------------------------------------------------------------
 * AUTHOR      : Amey Thakur
 * REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
 * DESCRIPTION : C program to separate Even and Odd numbers from an array.
 * -------------------------------------------------------------------------------------------------
 */

#include <stdio.h>

void main() {
    int a[10], even[10], odd[10], i, j = 0, k = 0, n;

    // Prompt user for array size
    printf("Enter the size of the array: ");
    scanf("%d", &n);

    // Input array elements
    printf("Enter the elements of the array:\n");
    for (i = 0; i < n; i++) {
        scanf("%d", &a[i]);
    }

    // Process array to separate even and odd numbers
    for (i = 0; i < n; i++) {
        if (a[i] % 2 == 0) {
            even[j] = a[i]; // Store in even array
            j++;
        } else {
            odd[k] = a[i];  // Store in odd array
            k++;
        }
    }

    // Display Even numbers
    printf("\nEven numbers are: ");
    for (i = 0; i < j; i++) {
        printf("%d ", even[i]);
    }

    // Display Odd numbers
    printf("\nOdd numbers are: ");
    for (i = 0; i < k; i++) {
        printf("%d ", odd[i]);
    }
    printf("\n");
}
