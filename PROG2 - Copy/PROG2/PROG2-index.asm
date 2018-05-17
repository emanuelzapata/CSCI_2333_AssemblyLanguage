;Emanuel Zapata
;CSCI 2333 - Assembly Language
;PROG2 - duedate
TITLE PROG2
INCLUDE Irvine32.inc

.data
	;messages
	sumMessage BYTE "SUM: ",0
	averageMessage BYTE "AVERAGE: ",0
	mainMessage BYTE "Insert 10 numbers below, program runs off of indexes",0dh,0ah,0
	;variables
	array DWORD 10 DUP(?)
	sum DWORD ?
	average DWORD ?
.code
main PROC
	call Clrscr
	
	;display main message and set up start of loop
	mov edx, OFFSET mainMessage	;moves mainMessage pointer int edx
	call WriteString	;prints the string to the screen
	mov ecx, LENGTHOF array	;mov size of array into ecx for counter
	mov esi, 0	;mov 0 into esi as counter
	
	;read in numbers
	READ:
		call ReadInt	;readInt number
		mov [array+esi], eax	;mov eax into array+esi
		add esi, 4	;increment esi by4
	LOOP READ	
	
	;reset variables for addition loop
	mov ecx, LENGTHOF array	;mov lengthof array into ecx
	mov esi, 0	;mov 0 into esi
	mov sum, 0	;clear sum by putting 0 into it

	;loop for addition
	ADDITION:
		mov eax, [array+esi]	;mov array+esi into eax for performing additiong
		add esi, 4	;add 4 into esi as increment counter
		add sum, eax	;add eax into sum for running total
	LOOP ADDITION
	
	;display sum
	mov eax, sum	;mov sum into eax
	mov edx, OFFSET sumMessage	;pointer of summessage into edx
	call WriteString	;write string to screen
	call WriteInt	;write current int stored in eax into screen
	call CRLF	;print newline

	;perform division
	mov edx, 0	;mov 0 into edx
	mov eax, sum	;mov sum into eax
	mov ecx, LENGTHOF array	;mov lengthof array into ecx
	div ecx	;div eax by ecx and store total in eax
	mov edx, OFFSET averageMessage	;mov averageMessage pointer into edx
	call WriteString	;print string in edx to screen
	call WriteInt	;print num stored in eax
	call CRLF	;print newline
exit
main ENDP
END main

;Insert 10 numbers below, program runs off of indexes
;14
;-32
;0
;7
;42
;-20
;18
;300
;-123
;-6
;SUM: +200
;AVERAGE: +20
;Press any key to continue . . .