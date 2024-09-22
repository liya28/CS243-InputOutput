; Filename: EXER22.ASM
; Programmer Name: Aliyah Khaet Regacho
; Date: September 20, 2024
; Description: Create a College Enrollment Form. Get user input. 
; Display a summary of the inputs. 
; Include the necessary documentation as comments in your code.
 
.model small
.stack 200h
.data
 prompt1 db 'Cebu Institute of Technology - University', 13,10
 db 'STUDENT ENROLLMENT FORM', 13, 10, 10
 db 'Please enter the following information:', 13, 10, '$'
 
 idPrompt db 'Student ID Number: $'
 firstNamePrompt db 13, 10,'First Name: $'
 middleNamePrompt db 13, 10,'Middle Name: $'
 lastNamePrompt db 13, 10,'Last Name: $'
 addressPrompt db 13,10,'Address: $'
 coursePrompt db 13,10,'Course: $'
 yearPrompt db 13,10,'Year: $'
 bdayMonthPrompt db 13,10,'Birthday Month: $'
 bdayDayPrompt db 13,10,'Birthday Day: $'
 bdayYearPrompt db 13,10,'Birthday Year: $'
 emailPrompt db 13,10,'Email Address: $'
 
 ; Variables to store inputs
 idInput db 20, 20 dup(?)
 firstNameInput db 20, 20 dup(?)
 middleNameInput db 20, 20 dup(?)
 lastNameInput db 20, 20 dup(?)
 addressInput db 100, 100 dup(?)
 courseInput db 20, 20 dup(?)
 yearInput db 10, 10 dup(?)
 bdayMonthInput db 15, 15 dup(?)
 bdayDayInput db 10, 10 dup(?)
 bdayYearInput db 10, 10 dup(?)
 emailInput db 50, 50 dup(?)
 
 prompt2 db 13,10,10,'SUMMARY',13,10
 db 'Please check if all information are correct.',13,10,10 , '$'
 
 idOutput db 'ID Number: $'
 fullNameOutput db 13,10,'Full Name: $'
 addressOutput db 13,10,'Address: $'
 courseYearOutput db 13,10,'Course & Year: $'
 bdayOutput db 13,10,'Birthday: $'
 emailOutput db 13,10,'Email Address: $'
 
 prompt3 db 13,10,10,'Thank you for enrolling at CIT-U.',13,10
 db 'Copyright 2024',13,10
 db 'Programmer: ALIYAH KHAET REGACHO' , '$'
 
.code

; For printing

print PROC
 mov ah, 09h
 int 21h
 ret
print ENDP
 
; For scanning the input

scan PROC
 mov ah, 0AH
 int 21h
 ret
scan ENDP
 
; For displaying

displaychar PROC
 mov dl, [si]
 mov ah, 02h
 int 21h
 inc si
 ret
displaychar ENDP
 
; Main 
 main: 
 mov ax, @data
 mov ds, ax

; Output prompt 1

 lea dx, prompt1
 call print
 
; Output ID Prompt and scan its input

 lea dx, idPrompt
 call print
 lea dx, idInput
 call scan
 
; Output First Name Prompt and scan its input

 lea dx, firstNamePrompt
 call print
 lea dx, firstNameInput
 call scan
 
; Output Middle Name Prompt and scan its input

 lea dx, middleNamePrompt
 call print
 lea dx, middleNameInput
 call scan
 
; Output Last Name Prompt and scan its input

 lea dx, lastNamePrompt
 call print
 lea dx, lastNameInput
 call scan
 
; Output Address Prompt and scan its input

 lea dx, addressPrompt
 call print
 lea dx, addressInput
 call scan
 
; Output Course Prompt and scan its input

 lea dx, coursePrompt
 call print
 lea dx, courseInput
 call scan
 
; Output Year Prompt and scan its input

 lea dx, yearPrompt
 call print
 lea dx, yearInput
 call scan
 
; Output Birthday Prompt and scan its input

 lea dx, bdayMonthPrompt
 call print
 lea dx, bdayMonthInput
 call scan
 
 lea dx, bdayDayPrompt
 call print
 lea dx, bdayDayInput
 call scan
 
 lea dx, bdayYearPrompt
 call print
 lea dx, bdayYearInput
 call scan

; Output Email Address Prompt and scan its input
 
 lea dx, emailPrompt
 call print
 lea dx, emailInput
 call scan
 
; Output "SUMMARY..."

 lea dx, prompt2
 call print

; Print ID
 
 lea dx, idOutput
 call print
 lea si, idInput + 2
 mov cl, [idInput + 1]
 DisplayId: 
 call displaychar
 loop DisplayId
 
; Print Full Name

 lea dx, fullNameOutput
 call print
 lea si, lastNameInput + 2
 mov cl, [lastNameInput+1]
 DisplayLastName: 
 call displaychar
 loop DisplayLastName
 mov dl, ','
 mov ah, 02h
 int 21h
 mov dl, ' '
 mov ah, 02h
 int 21h
 
 
 lea si, firstNameInput + 2
 mov cl, [firstNameInput+1]
 DisplayFirstName:
 call displaychar
 loop DisplayFirstName
 mov dl, ' '
 mov ah, 02h
 int 21h
 
 
 lea si, middleNameInput + 2
 mov cl, [middleNameInput+1]
 DisplayMiddleName:
 call displaychar
 loop DisplayMiddleName

; Print Address
 
 lea dx, addressOutput
 call print
 lea si, addressInput + 2
 mov cl, [addressInput+1]
 DisplayAddress: 
 call displaychar
 loop DisplayAddress
 
; Print Course and Year

 lea dx, courseYearOutput
 call print
 lea si, courseInput + 2
 mov cl, [courseInput +1]
 DisplayCourse: 
 call displaychar
 loop DisplayCourse
 mov dl, ' '
 mov ah, 02h
 int 21h
 
 
 lea si, yearInput + 2
 mov cl, [yearInput + 1]
 DisplayYear: 
 call displaychar
 loop DisplayYear

; Print Birthday

 lea dx, bdayOutput
 call print
 lea si, bdayMonthInput+2
 mov cl, [bdayMonthInput+1]
 DisplayBdayMonth:
 call displaychar
 loop DisplayBdayMonth
 mov dl, ' '
 mov ah, 02h
 int 21h
 
 lea si, bdayDayInput+2
 mov cl, [bdayDayInput+1]
 DisplayBdayDay: 
 call displaychar
 loop DisplayBdayDay
 mov dl, ','
 mov ah, 02h
 int 21h
 mov dl, ' '
 mov ah, 02h
 int 21h
 
 lea si, bdayYearInput +2
 mov cl, [bdayYearInput+1]
 DisplayBdayYear: 
 call displaychar
 loop DisplayBdayYear
 
; Print Email Address

 lea dx, emailOutput
 call print
 lea si, emailInput+2
 mov cl, [emailInput+1]
 DisplayEmail: 
 call displaychar
 loop DisplayEmail
 
; Print Last Part

 lea dx, prompt3
 call print
 mov ax, 4C00h
 int 21h
 
end main