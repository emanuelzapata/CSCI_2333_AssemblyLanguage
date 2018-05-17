;Emanuel Zapata
;CSCI 2333 - Assembly Language
;Homework 2
;Description: reads in digits and performs arithmatetic on them.
TITLE PROG2
INCLUDE Irvine32.inc

.data
	numberRequest BYTE "Enter a number: ", 0dh, 0ah, 0
	numbers DWORD 4 DUP(?)  ;create array of size 4 and initializes all too ?

.code
main PROC
	;prepre for display and reading in
	mov edx, OFFSET numberRequest	;moves numberRequst string into offset for displaying
	mov ecx, LENGTHOF numbers		;moves the lengthof numbers/size of array into ECX for counter
	mov edi, OFFSET numbers			;moves a pointer to numbres into EDI to access the variables

	;loop and read in
	start:							;start of loop
		call WriteString			;prints out the string in edx
		call ReadInt				;reads in int
		mov [edi], eax				;moves number read in from eax and stores it INTO edi thats why [] are used
		add edi, TYPE numbers		;add/increment edi using the TYPE that numbers is, this case is DWORD
	loop start						;end of loop


	;perform require arithmetic
	mov edi, OFFSET numbers			;set edi to point to beginning of array of numbers using offset

	mov eax, [edi]					;mov whats stored in edi into eax
	add edi, TYPE numbers			;increment edi by type of NUMBERS wshich is DWORD

	add eax, [edi]					;repeat, sorta
	add edi, TYPE numbers	

	sub eax, [edi]					;now subtract
	add edi, TYPE numbers			;increment

	add eax, [edi]					;add 
	call WriteInt					;print out the final result thats stored in eax
	
	call CRLF						;print newline
	invoke ExitProcess,0			;exit
main ENDP
END main

