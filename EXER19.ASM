; Filename: EXER19.ASM
; Programmer Name: ALIYAH KHAET REGACHO
; Date: SEPTEMBER 20, 2024
; Description: This assembly language program will get 3 character inputs.
; Then, it will display each character on its own line.

.MODEL small 
.STACK 200h
.DATA 

    Prompt1 DB 'Enter first character: $'
    Prompt2 DB 'Enter second character: $'
    Prompt3 DB 'Enter third character: $'

    Output1 DB 'The first character is $'
    Output2 DB 'The second character is $'
    Output3 DB 'The third character is $'

    newline DB 0Dh, 0Ah, '$'
    period  DB '.$'

    Char1 DB ?
    Char2 DB ?
    Char3 DB ?

.CODE     

start:

    mov ax, @data 
    mov ds, ax 

    ; Prompt for 1st char
    mov ah, 09h
    lea dx, Prompt1
    int 21h

    ; Get 1st char
    mov ah, 01h
    int 21h
    mov Char1, al

    ; Output newline
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Prompt for 2nd char
    mov ah, 09h
    lea dx, Prompt2
    int 21h 

    ; Get 2nd char
    mov ah, 01h
    int 21h
    mov Char2, al

    ; Output newline
    mov ah, 09h
    lea dx, newline 
    int 21h

    ; Prompt for 3rd char
    mov ah, 09h
    lea dx, Prompt3
    int 21h 

    ; Get 3rd char
    mov ah, 01h 
    int 21h
    mov Char3, al

    ; Output newline
    mov ah, 09h
    lea dx, newline 
    int 21h

    ; Display 1st char
    mov ah, 09h
    lea dx, Output1 
    int 21h

    mov ah, 02h
    mov dl, Char1
    int 21h

    mov ah, 09h
    lea dx, period
    int 21h

    ; Output newline
    mov ah, 09h
    lea dx, newline 
    int 21h

    ; Display 2nd char
    mov ah, 09h
    lea dx, Output2 
    int 21h

    mov ah, 02h
    mov dl, Char2
    int 21h

    mov ah, 09h
    lea dx, period
    int 21h    

    ; Output newline
    mov ah, 09h
    lea dx, newline 
    int 21h
    
    ; Display 3rd char
    mov ah, 09h
    lea dx, Output3 
    int 21h

    mov ah, 02h
    mov dl, Char3
    int 21h

    mov ah, 09h
    lea dx, period
    int 21h

end start 