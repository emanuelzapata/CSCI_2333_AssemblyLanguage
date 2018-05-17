; Emanuel Zapata
; CSCI 2333
TITLE PROG3

INCLUDE Irvine32.inc
.data
	mainMessage BYTE "Pythagorean Triples: ",0dh, 0ah, 0
	messageX BYTE "X: ", 0
	messageY BYTE "Y: ", 0
	messageZ BYTE "Z: ", 0
	space BYTE " ",0 
	u DWORD ?
	v DWORD ?
	x DWORD ?
	y DWORD ?
	z DWORD ?
	temp DWORD ?
.code
main PROC
	mov edx, OFFSET mainMessage
	call WriteString

	mov u, 2
	whileLoop1:
		test u, 1
		jz isEven
		mov v, 2
		jmp isEven
	isEven:
		mov v, 1
	endEven:
	whileLoop2:
		mov eax, u
		mov ebx, v
		call GCD
		cmp eax, 1
		jnbe isNot1
		mov eax, u
		mov ebx, v
		call TRIPLE
		call CRLF
	isNot1:
		add v, 2
		mov eax, v
		cmp eax, u
		jb whileLoop2

		inc u
		cmp u, 10
		jb whileLoop1
	endWhileLoop1:
			
exit
main ENDP

;------------------------------------------------------
GCD PROC 
;
;	finds the greatest common GCD of 2 given numbers
;	
;------------------------------------------------------
	loop1:
		cmp ebx, 0
		jna leaveLoop
		CDQ
		idiv ebx
		mov eax, edx
		xchg eax, ebx
		jmp loop1
	leaveLoop:
	ret	;end of function
GCD ENDP

;------------------------------------------------------
TRIPLE PROC 
;
;	performs main function for fidning triples
;
;------------------------------------------------------
	mov temp, eax
	mul eax
	mov ecx, eax
	mov eax, ebx
	mul eax
	sub ecx, eax
	mov x, ecx
	mov eax, temp
	mul ebx
	add eax, eax
	mov y, eax
	mov eax, temp
	mul eax
	mov ecx, eax
	mov eax, ebx
	mul eax
	add eax, ecx
	mov z, eax
	mov edx, OFFSET space 
	mov eax, x
	cmp eax, y
	jna ifStatement
	xchg eax, y
	mov x, eax
ifStatement:
	mov eax, x
	 call WriteInt
	 call WriteString 
	 mov eax, y
	 call WriteInt
	 call WriteString
	 mov eax, z
	 call WriteInt
	ret	;end of function					
TRIPLE ENDP
													
END main	
