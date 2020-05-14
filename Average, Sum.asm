TITLE Klead Fusha

INCLUDE Irvine32.inc

.data
	prompt	BYTE "Enter an integer value: ", 0
	array	DWORD 5 DUP(?)
	thesize	DWORD 5

.code
getSum PROC
	push	ebp
	mov		ebp, esp
	sub		esp, 4
	push	ecx
	push	esi
	mov		[ebp - 4], DWORD PTR 0
	mov		ecx, [ebp + 8]
	mov		esi, [ebp + 12]
again:
	mov		eax, [esi]
	add		[ebp - 4], eax
	add		esi, 4
	loop	again
	mov		eax, [ebp - 4]
	pop		esi
	pop		ecx
	add		esp, 4
	pop		ebp
	ret	8	; The number of parameters times 4
getSum ENDP

getAverage PROC
	push	ebp
	mov		ebp, esp
	push	edx
	push	DWORD PTR [ebp + 12]
	push	DWORD PTR [ebp + 8]
	call	getSum
	mov		edx, 0
	div		DWORD PTR [ebp + 8]
	pop		edx
	pop		ebp
	ret
getAverage ENDP

main PROC

	mov		ecx, 5
	mov		esi, OFFSET array
again:
	mov		edx, OFFSET prompt
	call	WriteString
	call	ReadInt
	mov		[esi], eax
	add		esi, 4
	loop	again

	push	OFFSET array
	push	thesize
	call	getSum
	call	WriteInt
	call	Crlf

	push	OFFSET array
	push	thesize
	call	getAverage
	call	WriteInt
	call	Crlf

	call	WaitMsg
	exit
main ENDP
END main
