; Filename: EXER20.ASM
; Programmer Name: ALIYAH KHAET REGACHO
; Date: SEPTEMBER 20, 2024
; Description: This assembly language program will ask the user tO input a character.
; If it is an A, it will display the message "Yes, you have entered letter A."
; If not, it will display the message "No, you have not entered letter A. You entered character _."

.model small
.stack 100h
.data

    ; Input Prompt Display
    CharPrompt db 'Enter a character: $'
    YesMsg db 'Yes, you have entered letter $'
    NoMsg db 'No, you have not entered letter A. You entered character $'

    newline db 0Dh, 0Ah, '$'
    period db '.', '$'
    
    CharInput db ? ; To store the input

.code 

start:

    mov ax, @data
    mov ds, ax

    ; Output the prompt
    mov ah, 09h
    lea dx, CharPrompt
    int 21h 

    ; Store the character inputted
    mov ah, 01h
    int 21h
    mov CharInput, al

    ; Newline
    mov ah, 09h
    lea dx, newline 
    int 21h
    
    ; Check if the character is 'A'
    cmp CharInput, 'A'
    je PrintYesMsg ; If yes, jump to PrintYesMsg
    ; If not, the PrintNoMsg will occur
    cmp CharInput, 'a'
    je PrintYesMsg

PrintNoMsg:

    ; Output the corresponding line
    mov ah, 09h
    lea dx, NoMsg
    int 21h 

    ; Output the input
    mov ah, 02h
    mov dl, CharInput
    int 21h 

    ; Period
    mov ah, 09h
    lea dx, period  
    int 21h

    ; Newline
    mov ah, 09h
    lea dx, newline 
    int 21h

    jmp ExitProgram

PrintYesMsg:

    ; Output the corresponding line
    mov ah, 09h
    lea dx, YesMsg
    int 21h 

    ; Output the input
    mov ah, 02h
    mov dl, CharInput
    int 21h 

    ; Period
    mov ah, 09h
    lea dx, period  
    int 21h

    ; Newline
    mov ah, 09h
    lea dx, newline 
    int 21h

ExitProgram:

    mov ah, 4Ch
    int 21h

end start
