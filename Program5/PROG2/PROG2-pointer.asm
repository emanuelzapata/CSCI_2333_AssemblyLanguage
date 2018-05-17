;Emanuel Zapata
;CSCI 2333 - Assembly Language
;Homework 2
;Description: reads in digits and performs arithmatetic on them.
TITLE PROG2
INCLUDE Irvine32.inc

.data
	;numberRequest BYTE "Enter 10 numbers: ", 0dh, 0ah, 0
	;split BYTE "------------------", 0dh, 0ah, 0
	;printingNumbers BYTE "Here are the digits: ", 0dh, 0ah, 0
	;numbers DWORD 10 DUP(?)  ;create array of size 4 and initializes all too ?

.code
main PROC
	
	
	call CRLF						;print newline
	invoke ExitProcess,0			;exit
main ENDP
END main

