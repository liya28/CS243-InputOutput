.model small
.stack 100h
.data

    buffer db 100 dup('$')
    prompt db 'Enter a string: $'
    msg db 'You entered: $'
    newline db 13, 10, '$'

.code

main:

    mov ax, @data
    mov ds, ax 

    ; Print prompt
    mov ah, 09h
    lea dx, prompt 
    int 21h

    ; Read string from user
    lea dx, buffer
    mov ah, 0Ah ; DOS Function for buffered input
    int 21h

    ; Print newline
    mov ah, 09h
    lea dx, newline
    int 21h
    
    ; Print "You entered: "
    mov ah, 09h
    lea dx, msg 
    int 21h

    ; Print the entered string
    mov ah, 09h
    lea dx, buffer + 2 ; Skips the first 2 bytes (for buffer length and actual length)
    mov ah, 09h
    int 21h

    mov ah, 4Ch
    int 21h

end main