TITLE Klead Fusha

INCLUDE Irvine32.inc

.data
	array		DWORD 15, 6, 22, 3, 7, 11, 4, 7, 9, 10, 5, 33, 2, 11, 0
	sample		DWORD 9
	arraySize	= LENGTHOF array
	index		DWORD 2
	sum			DWORD 100
.code
main PROC

	mov		eax, sum			; EAX = sum
	mov		ebx, sample			; EBX = sample
	mov		edx, index			; EDX = index

	mov		ecx, arraySize		; Counter will equal the length of array
	sub		ecx, 2				; Subtracting 2 from it, since the outter while loop is (index < arraySize - 2)

	mov		esi, OFFSET array	; Point to the first element of the array

	add		esi, TYPE array
	add		esi, TYPE array		; Move the pointer to the third element in the array,
								; that's where we'll start looping, since index is equal to 2 (third element)
	
again:
	mov edi, [esi]			; Move to edi register the dereferenced value of esi (which points to the third element in the array)

	cmp edi, ebx			; Compare array[index] and sample 
	jbe skip				; If array[index] is below or equal, skip the if statement inside the loop,
							; and jump to the label that will increment the index and loop again


	sub eax, edi			; Subtract array[index] from sum
	mov edx, eax			; Move the sum value to edx, we'll need to print it after the loop is done

	mov eax, [esi]			; Move array[index] to eax
	Call WriteInt			; cout << array[index]
	Call Crlf				; endl;
	
skip:
	add esi, TYPE array		; Move pointer to the next element in the array
	inc edx					; ++ index
	loop again				; Loop

done:
	mov eax, edx			; Move to the eax register the value of sum which we stored in the edx register
	call WriteInt			; cout << sum

	call WaitMsg
	exit
main ENDP
END main