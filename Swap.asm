TITLE Klead Fusha

INCLUDE Irvine32.inc

.data

    arr DWORD 1, 2, 3, 4, 5, 6, 7, 8
	temp DWORD ?,0

.code





main PROC

	mov edx, 0
	mov ecx, LENGTHOF arr		; Loop counter
	mov esi, OFFSET arr			; Pointing to the first element of the array


pusharr:
	mov eax, [esi]				; Moving to eax the value of each element of the array 
	push eax					; Pushing to the stack all the elements of the array
	call WriteDec				; Printing the original order of the array

	mov eax, " "
	call WriteChar				; Space in between the numbers

	add esi, TYPE arr			; Pointing to the next element after each iteration
	loop pusharr				; Loop again until all elements are pushed to the stack and printed to the console

	call Crlf

	call swap


	call WaitMsg
	exit

main ENDP




swap PROC

	push ebp
	mov ebp, esp

	mov eax, [ebp + 12]
	mov edx, [ebp + 32]
	mov temp, edx
	mov DWORD PTR [ebp + 32], eax
	mov eax, temp
	mov DWORD PTR[ebp + 12], eax

	mov eax, [ebp + 20]
	mov edx, [ebp + 24]
	mov temp, edx
	mov DWORD PTR [ebp + 24], eax
	mov eax, temp
	mov DWORD PTR[ebp + 20], eax


	mov eax, [ebp + 8]
	call WriteDec
	mov eax, " "
	call WriteChar

	mov eax, [ebp + 12]
	call WriteDec
	mov eax, " "
	call WriteChar

	mov eax, [ebp + 14]
	call WriteDec
	mov eax, " "
	call WriteChar

	mov eax, [ebp + 18]
	call WriteDec
	mov eax, " "
	call WriteChar

	mov eax, [ebp + 22]
	call WriteDec
	mov eax, " "
	call WriteChar

	mov eax, [ebp + 26]
	call WriteDec
	mov eax, " "
	call WriteChar

	mov eax, [ebp + 30]
	call WriteDec
	mov eax, " "
	call WriteChar

	mov eax, [ebp + 34]
	call WriteDec
	mov eax, " "
	call WriteChar

	mov eax, [ebp + 38]
	call WriteDec
	mov eax, " "
	call WriteChar

	pop ebp
		
	ret
swap ENDP

END main
