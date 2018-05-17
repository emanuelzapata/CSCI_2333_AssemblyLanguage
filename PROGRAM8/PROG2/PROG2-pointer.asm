;Emanuel Zapata
;CSCI 2333 - Assembly Language
;Program 8
;Description: allows user to guess the number the PC randomnly has guessed
TITLE PROG2
INCLUDE Irvine32.inc

.data
	prompt BYTE "Enter your guess: ",0
	tooHigh BYTE "Too High, try again", 0
	tooLow BYTE "Too Low, try again", 0
	congrats BYTE "Congrats, you got it right!",0
	correct BYTE "It took you these many tries: ",0

	randomNumber DWORD ?	;used to store randomNumber generated
	counter DWORD 0			;used to keep track of guesses

.code
main PROC
	call Randomize		;seed random number generator so its always random
	mov eax, 100		;set the range to generate number from
	call RandomRange	;generate random number
	inc eax				;so it goes from 0-99 to 1-100 instead
	mov randomNumber, eax	;store random in in random number
	
	check:						;check label where we come back to check if the number is correct
		mov edx, OFFSET prompt
		call WriteString
		call ReadInt
		inc counter				;counter to keep track of tries initially set to 0
		cmp eax, randomNumber	;compare number read in and stored in eax to randomNumber which is random number we generated
		jl tooLowLabel			;if too low we go to tooLowLabel
		jg tooHighLabel			;if too high we go to tooHighLabel
		jmp finished			;else we go to finished because we guessed right
	;too low
	tooLowLabel:				
		mov edx, OFFSET tooLow	
		call WriteString
		call CRLF
		jmp check				;return back to check because all this does is print that we guessed too low
	;too high
	tooHighLabel:				
		mov edx, OFFSET tooHigh	
		call WriteString	
		call CRLF
		jmp check				;return back to check because all this does is print that we guessed too high
	;finished
	finished:			
		mov edx, OFFSET congrats
		call WriteString
		call CRLF
		mov edx, OFFSET correct
		call WriteString
		mov eax, counter		;move counter into eax and print it to display amount of times guessed. 
		call WriteInt

	call CRLF						;print newline
	invoke ExitProcess,0			;exit
main ENDP
END main

