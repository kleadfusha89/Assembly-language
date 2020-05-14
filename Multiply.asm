TITLE Klead Fusha

INCLUDE Irvine32.inc

.data

	prompt  BYTE "Enter an integer: "

.code

multiply PROC

	push	ebp
	mov		ebp, esp 

	mov		eax, [ebp+12]		; Assign the two values we saved on the stack to
	mov		ebx, [ebp+8]		; eax and ebx and then multiply them
	mul		ebx					; ebx * eax

	call	WriteDec			; Print the result
	call	Crlf				; endl

	pop		ebp	
	ret		8 

multiply ENDP	



main PROC
	
	call	ReadDec				; Input how many times does the user want to call the multiply function (presuming the input value will be a positive number)
	mov		ecx, eax			; Assign the input value to ecx

again:

	mov		edx, OFFSET prompt
	call	WriteString			; Print the prompt message
	call	ReadInt				; Ask an input value for the first integer
	push	eax					; Push the first integer to the stack

	mov		edx, OFFSET prompt
	call	WriteString			; Print the prompt message
	call	ReadInt				; Ask an input value for the second integer
	push	eax					; Push the second input to the stack

	call	Crlf				; endl

	call	multiply			; Call the function that multiplies the two values
	call    Crlf

	loop	again				; Loop again

	call	Waitmsg 
	
	exit
main ENDP



END main