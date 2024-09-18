.model small
.stack 100h
.data
    ; Data section: define strings, buffers, etc.
    char_msg db 'Enter a character: $'
    char_result db 0  ; To store the entered character

    str_msg db 'Enter a string: $'
    str_result db 20, 0  ; Buffer to store input string (max length 20 characters)
    str_output db 'You entered: $'

    int_msg db 'Enter a number: $'
    int_input db 5, 0  ; Buffer for integer input (max length 5 digits)
    int_result db 'You entered the number: $'
    newline db 13, 10, '$'

.code
main:
    ; Initialize the data segment
    mov ax, @data
    mov ds, ax

    ; -------------------------------------------
    ; Take single character input and display it
    ; -------------------------------------------
    ; Display message to prompt user input
    mov ah, 09h
    lea dx, char_msg
    int 21h

    ; Read a single character
    mov ah, 01h
    int 21h
    ; Store the character in memory
    mov [char_result], al

    ; Display the entered character
    mov ah, 09h
    lea dx, newline  ; Newline for neatness
    int 21h
    mov ah, 02h
    mov dl, [char_result]
    int 21h

    ; -------------------------------------------
    ; Take string input and display it
    ; -------------------------------------------
    ; Display message to prompt user input
    mov ah, 09h
    lea dx, newline
    int 21h
    mov ah, 09h
    lea dx, str_msg
    int 21h

    ; Read string input
    mov ah, 0Ah
    lea dx, str_result
    int 21h

    ; Output the entered string
    mov ah, 09h
    lea dx, newline
    int 21h
    lea dx, str_output
    int 21h

    lea dx, str_result + 2  ; Point to the start of the input string (skip length bytes)
    int 21h

    ; -------------------------------------------
    ; Take integer input and display it
    ; -------------------------------------------
    ; Display message to prompt user input
    mov ah, 09h
    lea dx, newline
    int 21h
    lea dx, int_msg
    int 21h

    ; Read integer input as a string
    mov ah, 0Ah
    lea dx, int_input
    int 21h

    ; Convert string to integer (simple conversion)
    mov si, 2              ; Skip the first two bytes of the input buffer
    mov cx, 0              ; Clear CX (we'll store the integer here)

convert_loop:
    mov al, [int_input + si]  ; Get each digit character from the buffer
    cmp al, 0Dh               ; Check if it's Enter (carriage return)
    je print_number           ; If Enter is pressed, we are done
    sub al, '0'               ; Convert from ASCII to actual digit
    mov bx, 10                ; We will multiply CX by 10
    mul bx                    ; Multiply the current number by 10
    add cx, ax                ; Add the new digit
    inc si                    ; Move to the next character
    jmp convert_loop          ; Repeat for the next digit

print_number:
    ; Output the converted number as a string
    mov ah, 09h
    lea dx, newline
    int 21h
    lea dx, int_result
    int 21h

    ; Now convert the integer back to a string to display it
    mov bx, 10         ; Prepare divisor 10 for converting integer to string
    mov di, 5          ; Start at the end of a temporary buffer for the result
    mov si, di         ; SI is the counter for digits

convert_to_string:
    xor dx, dx         ; Clear DX for division
    div bx             ; Divide CX by 10
    add dl, '0'        ; Convert remainder to ASCII digit
    mov [int_input + di], dl  ; Store the digit in the buffer
    dec di             ; Move to the previous position
    test cx, cx        ; Check if the quotient is 0
    jnz convert_to_string ; Repeat until we are done

    ; Display the integer digits
    lea dx, int_input + di + 1  ; Point to the start of the digits
    mov ah, 09h
    int 21h

    ; Exit the program
    mov ah, 4Ch
    int 21h

end main
