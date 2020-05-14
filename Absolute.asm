TITLE Klead Fusha

INCLUDE Irvine32.inc

.data


.code
Abs PROC
	push	ebp							; EBP nonsense
	mov		ebp, esp
	mov		eax, [ebp+8]				; Blindly set EAX
	cmp		eax, 0
	jge		done
	neg		eax
done:									
	pop		ebp							; Put EBP back
	ret 4								; Return and pop the 1 parameter
Abs ENDP

main PROC
	push	ebp							; EBP nonsense
	mov		ebp, esp
	sub		esp, 4						; Add local variable a
	; -----------------------------------------------------------
	push	-5
	call	Abs							; Call Abs(-5)
	mov		DWORD PTR [ebp-4], eax		; a = 5
	mov		eax, DWORD PTR [ebp-4]		; Move a into eax... Deosn't really have to be here but it works....
	call	WriteInt					; So we can print its value
	call	Crlf						; endl
	; ------------------------------------------------------------
	add		esp, 4						; Remove local variable
	pop		ebp							; Put back EBP

	call	WaitMsg

	exit
main ENDP
END main