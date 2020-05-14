TITLE Klead Fusha

INCLUDE Irvine32.inc

.data

.code

Maximum PROC
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8]			; Moving b to eax
	cmp [ebp + 12], eax
	jle nope
	mov eax,[ebp + 12]

nope:
	pop ebp
	ret 8			; The number of parameters you put in, times 4 , should be the return

Maximum ENDP

main PROC
	push 11
	push 12
	call Maximum
	call WriteDec
	call Crlf
	call WaitMsg
	exit
main ENDP
END main