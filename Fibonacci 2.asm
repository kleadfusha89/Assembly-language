TITLE Klead Fusha

INCLUDE Irvine32.inc
.data

	arrSize		= 30
	arr			DWORD arrSize DUP(?)
	fileHandle	DWORD ?
	fileName	BYTE "Fibonacci sequence.txt", 0


.code


store PROC
	mov		eax, 0				; The first element that we'll store in the array
	mov		ebx, 1				; The first addition in the Fibonacci sequence
	
again:
	call	WriteDec			; Priting the Fibonacci number
	add		eax, ebx			; Adding with the previous number
	call	CrlF				; End line

	mov		[esi], eax			; Move the value of eax to the content of the pointer esi, which
								; we set as the first element of the array

	add		esi, TYPE arr		; Point to another element which will hold the next Fibonacci value,
								; after the next iteration

	xchg	eax, ebx			; Change the content of the two registers
	loop	again

	ret
store ENDP



main PROC
	call	Clrscr
	mov		edx, OFFSET fileName	; Move to the first charcter of filename variable
	call	CreateOutputFile		; Create the file that will have the edx value as its name

	mov		fileHandle, eax			; Moves the value of eax to the file handle
	mov		esi, OFFSET arr			; Point to the first variable in the array
	mov		ecx, arrSize			; Set counter equal to the size of the constant

	call	store					; Call the function that will store the values in the array

	mov		eax, fileHandle			; Filehandle will write the array to file
	mov		edx, OFFSET arr			; Writing from the first element of the array
	mov		ecx, SIZEOF arr			; Size of array
	call	WriteToFile

	mov		eax, fileHandle
	call	CloseFile				; Irvine library function to close the file

	call	WaitMsg
	exit
main ENDP

END main