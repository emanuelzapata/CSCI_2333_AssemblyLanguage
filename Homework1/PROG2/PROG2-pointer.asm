TITLE PROG1
;Emanuel Zapata
;CSCI 2333 - Assembly Language
;PROG1 
;Program reads in 4 integers then performs arithemtic operations and isplays final result

INCLUDE Irvine32.inc
	.data
titleProg BYTE "----Homework 1----",0dh,0ah,0	;title string----0dh, 0ah prints out new line with string
design BYTE "------------------", 0dh,0ah,0	;for separation
numberRequest BYTE "ENTER A NUMBER: ",0 ;numberRequest is a string with 0 at tend to clear for next input or else weird emoji thing pops up and also doesnt produce new line for styling
finalMessage BYTE "FINAL RESULT: ",0

	.code
Main PROC
	call Clrscr	;clears screen
	mov edx, OFFSET titleProg	;for styling
	call WriteString
	mov edx, OFFSET design	;for styling
	call WriteString
	mov edx, OFFSET numberRequest
	mov ebx, 0	;set ebx to zero for starting the addition
	mov ecx, 4	;set ecx counter to 4 to loop 4 times
		
	start:		;start of for loop for reading in integers
		call WriteString	;prints request to screen
		call ReadInt		;read int
		add ebx, eax	;mov number read into eax into array numbers at index ecx
	loop start	;end of loop
	
	mov edx, OFFSET finalMessage ;move finalMessage into edx for display
	call WriteString	;print to screen
	mov eax, ebx	;mov final result from ebx to eax to prepare for display
	call WriteInt	;print final result
		

	call CRLF	;prints newLine 
	invoke ExitProcess, 0
	;exit
main ENDP
END main

