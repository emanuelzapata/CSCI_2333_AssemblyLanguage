;Emanuel Zapata
;CSCI 2333 - Assembly Language
;Homework 2
;Description: reads in digits and performs arithmatetic on them.
TITLE PROG2
INCLUDE Irvine32.inc

.data
	numberRequest BYTE "Enter 10 numbers: ", 0dh, 0ah, 0
	split BYTE "------------------", 0dh, 0ah, 0
	printingNumbers BYTE "Here are the digits: ", 0dh, 0ah, 0
	numbers DWORD 10 DUP(?)  ;create array of size 4 and initializes all too ?

.code
main PROC
	;prepre for display and reading in
	mov edx, OFFSET numberRequest	;moves numberRequst string into offset for displaying
	mov ecx, LENGTHOF numbers		;moves the lengthof numbers/size of array into ECX for counter
	mov edi, OFFSET numbers			;moves a pointer to numbres into EDI to access the variables
	call WriteString				;prints out the string in edx

	;loop and read in
	start:							;start of loop
		call ReadInt				;reads in int
		mov [edi], eax				;moves number read in from eax and stores it INTO edi thats why [] are used
		add edi, TYPE numbers		;add/increment edi using the TYPE that numbers is, this case is DWORD
	loop start						;end of loop

	mov edx, OFFSET split			;moves bars into offset to print to clear up 
	call WriteString				;print
	mov edx, OFFSET printingNumbers	;moves itns edx
	call WriteString				;print
	mov ecx, LENGTHOF numbers		;lengthof numbers array into ecx, 10
	mov edi, OFFSET numbers			;pointer to start of numbers into edi

	;loop to print out stored ints
	print:
		mov eax,[edi]				;mov var stored in [edi] into eax
		call WriteInt				;print it
		call CRLF					;print new line
		add edi, TYPE numbers		;increment counter
	loop print

	
	
	call CRLF						;print newline
	invoke ExitProcess,0			;exit
main ENDP
END main

