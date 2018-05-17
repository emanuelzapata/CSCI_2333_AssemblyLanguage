;Emanuel Zapata
;CSCI 2333 - Assembly Language
;Homework 2
;Description: reads in digits and performs arithmatetic on them.
TITLE PROG2
include Irvine32.inc

.data
prompt BYTE "Enter your name:", 13,10
myName BYTE 101 DUP (0)
key BYTE "Here is your key ", 13,10

.code
main proc
mov edx, OFFSET prompt
call WriteString ; Prompt user to enter their name

mov edx, OFFSET myName
mov ecx, 100
call ReadString

mov ecx, eax
mov esi, 0

L1:
movzx bx, [myName + esi] 
PUSH bx
inc esi
loop L1 

call Crlf

mov ecx, eax
mov esi, 0

;call Crlf

mov edx, OFFSET key
call WriteString ; Prompt user to copy their key
L2:
POP ax
XOR ax, 29
call WriteChar ; Write each char byte
inc esi
loop L2

call Crlf
call Crlf
Call ReadString
invoke ExitProcess,0
main endp
end main