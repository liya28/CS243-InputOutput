.model small
.stack 100h
.data 

    ; Data section: define messages

    prompt_char db 'Enter a single character: $'
    char_result db 0 ; To store the entered character

    prompt_digit db 'Enter a single digit number (0-9): $'
    digit_result db 0 ; To store the entered digit

    newline db 13, 10, '$' ; For a new line

.code 
main:

    ; Initialize data segment
    mov ax, @data 
    mov ds, ax

; --------------------------------------------
; Take and print a single character
; --------------------------------------------

    ; Display message asking for a character
    mov ah, 09h
    lea dx, prompt_char 
    int 21h

    ; Read a single character from the user
    mov ah, 01h ; DOS function to read a character
    int 21h     ; Interrupt call to execute the function specified in AH
    ; Store the character in char_result
    mov [char_result], al 

    ; Print a newline
    mov ah, 09h
    lea dx, newline 
    int 21h

    ; Display the character back
    mov ah, 02h
    mov dl, [char_result] ; Load the character into DL for printing
    int 21h

    ; Print a newline before the digit prompt
    mov ah, 09h
    lea dx, newline 
    int 21h

; --------------------------------------------
; Take and print a single digit number
; --------------------------------------------

    ; Display message asking for a digit
    mov ah, 09h
    lea dx, prompt_digit
    int 21h

    ; Read a single digit from the user
    mov ah, 01h 
    int 21h
    ; Store the digit in digit_result
    mov [digit_result], al

    mov ah, 09h
    lea dx, newline 
    int 21h

    ; Display the single digit back
    mov ah, 02h
    mov dl, [digit_result] ; Load the digit into DL for printing
    int 21h

    ; Exit the program
    mov ah, 4Ch 
    int 21h
end main