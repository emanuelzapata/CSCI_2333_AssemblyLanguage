;Emanuel Zapata
;CSCI 2333 - Assembly Language
;Program 9
;Description: User thinks of a number annd the computer guesses it, works always in less than 10 tries. Average case is 7
TITLE PROG2
INCLUDE Irvine32.inc

.data
	prompt BYTE "Is your number ( too low / too high / yes ) : ",0
	done BYTE "Your number is: ",0
	userInput BYTE 50 DUP(0)
	tooHigh BYTE "too high",0
	tooLow BYTE "too low",0
	yes BYTE "yes",0
	min DWORD 0
	max DWORD 100
	guess DWORD ?
.code
main PROC
	;algorithm to find center. Add min and max. Divide by 2. 
generateGuess:
	mov eax, max
	add eax, min
	mov ebx, 2
	mov edx, 0
	div ebx
	mov edx, OFFSET prompt
	call WriteString
	call WriteInt
	mov guess, eax
	call CRLF
	mov edx, OFFSET userInput
	mov ecx, sizeof userInput
	call ReadString
	INVOKE Str_compare, ADDR userInput, ADDR tooLow
	je lowLabel
	INVOKE Str_compare, ADDR userInput, ADDR tooHigh
	je highLabel
	INVOKE Str_compare, ADDR userInput, ADDR yes
	jmp finish

highLabel:
	mov eax, guess
	mov max, eax
	jmp generateGuess
lowLabel:
	mov eax, guess
	add eax, 1
	mov min, eax
	jmp generateGuess

finish:
	mov edx, OFFSET done
	call WriteString
	mov eax, guess
	call WriteInt

	call CRLF						;print newline
	invoke ExitProcess,0			;exit
main ENDP
END main

