TITLE Klead Fusha

INCLUDE Irvine32.inc

.data



.code

fibonacci PROC
	push	ebp
	mov		ebp, esp
	sub		esp, 4
	mov		SDWORD PTR [ebp - 4], -1
	cmp		SDWORD PTR [ebp + 8], 0
	jl		done
	mov		SDWORD PTR [ebp - 4], 0
	cmp		SDWORD PTR [ebp + 8], 0
	je		done
	mov		SDWORD PTR [ebp - 4], 1
	cmp		SDWORD PTR [ebp + 8], 1
	je		done
	mov		eax, [ebp + 8]
	sub		eax, 2
	push	eax
	call	fibonacci
	mov		[ebp - 4], eax
	mov		eax, [ebp + 8]
	sub		eax, 1
	push	eax
	call	fibonacci
	add		eax, [ebp - 4]
	mov		[ebp - 4], eax
done:
	mov		eax, [ebp - 4]
	add		esp, 4
	pop		ebp
	ret		4
fibonacci ENDP



main PROC
	push	9
	call	fibonacci

	call	WriteDec
	call	Crlf
	call	WaitMsg
	exit
main ENDP
END main