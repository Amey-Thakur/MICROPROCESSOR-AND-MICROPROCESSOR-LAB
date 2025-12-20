; =================================================================================================
; AUTHOR      : Amey Thakur
; REPOSITORY  : https://github.com/Amey-Thakur/MICROPROCESSOR-AND-MICROPROCESSOR-LAB
; DESCRIPTION : 8086 Assembly program to calculate the length of a string entered by the user.
; -------------------------------------------------------------------------------------------------
; HOW IT WORKS:
; 1. Display a prompt asking the user to enter a string.
; 2. Read characters one by one from the keyboard until the 'Enter' key is pressed.
; 3. Count each character and store the string in a buffer.
; 4. Convert the count (number) to a readable ASCII format and display it on the screen.
; =================================================================================================

.MODEL SMALL
.DATA
    ; --- Messages to show the user ---
    M1 DB 10D, 13D, " Enter the String: $"
    M2 DB 10D, 13D, " Length of the String is: $"
    
    ; --- Storage ---
    STR1 DB 50 DUP('$')   ; Buffer: Creates a 'bag' that can hold up to 50 characters
    LEN DB 00H             ; Variable: To keep track of the character count

.CODE
    ; -- Initialization: Set up the memory to access our variables --
    MOV AX, @DATA
    MOV DS, AX

    ; -- Step 1: Tell the user to enter a string --
    LEA DX, M1             ; Load the address of the prompt message
    MOV AH, 09H            ; DOS function: Display string
    INT 21H

    ; -- Step 2: Set up a pointer to the start of our 'bag' (buffer) --
    LEA SI, STR1           

INPUT_LOOP:
    ; -- Step 3: Read a single character from the user --
    MOV AH, 01H            ; DOS function: Read character with echo (shows it on screen)
    INT 21H
    
    ; -- Check: Did the user press 'Enter' (Carriage Return)? --
    CMP AL, 13D            ; ASCII 13 is the 'Enter' key
    JE DISPLAY_RESULT      ; If 'Enter', we are done reading. Skip to display.
    
    ; -- Save the character and increment count --
    MOV [SI], AL           ; Put the character currently in AL into the buffer at SI
    INC SI                 ; Move our pointer to the next spot in the 'bag'
    INC LEN                ; Add 1 to our count
    JMP INPUT_LOOP         ; Go back and wait for the next key press

DISPLAY_RESULT:
    ; -- Step 4: Show the "Length is: " message --
    LEA DX, M2             
    MOV AH, 09H
    INT 21H

    ; -- Step 5: Convert the numeric length to decimal characters --
    MOV AL, LEN            ; Load the final count into AL
    MOV AH, 00H            ; Ensure the higher part is empty for division
    MOV CX, 0000H          ; CX will count how many decimal digits we produce
    MOV BX, 000AH          ; We will divide by 10 to get digits

DECONSTRUCT_NUMBER:
    MOV DX, 0000H          ; Clear DX for the division operation
    DIV BX                 ; Divide AX by 10. Quotient in AX, Remainder in DX.
    PUSH DX                ; Save the remainder (the digit) on the 'stack' (last-in, first-out)
    INC CX                 ; Mark that we have one digit saved
    CMP AX, 0000H          ; Is there anything left in the quotient?
    JNE DECONSTRUCT_NUMBER ; If yes, keep dividing

PRINT_DIGITS:
    ; -- Step 6: Fetch digits from the stack and print them --
    POP DX                 ; Take the last digit saved back out
    ADD DL, 30H            ; Convert the value (0-9) to ASCII ('0'-'9')
    MOV AH, 02H            ; DOS function: Display a single character
    INT 21H
    LOOP PRINT_DIGITS      ; Repeat for all digits we found

    ; -- Step 7: Gracefully exit the program --
    MOV AH, 4CH            
    INT 21H
END
