TITLE Klead Fusha

INCLUDE Irvine32.inc

.data
	prompt	BYTE "Enter a character: ", 0
	mssg	BYTE "The corresponding digit is: ", 0
	err		BYTE "Please enter a letter from the alphabet!"
.code
main PROC

start:
	mov edx, OFFSET prompt			; Prompt the user to enter a character
	call WriteString

	call ReadChar					; Read a character input
	call WriteChar					; Print the character
	call Crlf

;---------------------------------------------------
; The comparison instructions below, will basically
; compare the character that was entered, until 
; it's found, which will jump to the corresponding
; label, that will print the corresponding digit.
; If it's not found, it will jump to an error
; message which will prompt again and start over.
;----------------------------------------------------
	cmp al, 'a'
	je L2
	cmp al, 'b'
	je L2
	cmp al, 'c'
	je L2

	cmp al, 'd'
	je L3
	cmp al, 'e'
	je L3
	cmp al, 'f'
	je L3

	cmp al, 'g'
	je L4
	cmp al, 'h'
	je L4
	cmp al, 'i'
	je L4

	cmp al, 'j'
	je L5
	cmp al, 'k'
	je L5
	cmp al, 'l'
	je L5

	cmp al, 'm'
	je L6
	cmp al, 'n'
	je L6
	cmp al, 'o'
	je L6

	cmp al, 'p'
	je L7
	cmp al, 'q'
	je L7
	cmp al, 'r'
	je L7
	cmp al, 's'
	je L7

	cmp al, 't'
	je L8
	cmp al, 'u'
	je L8
	cmp al, 'v'
	je L8

	cmp al, 'w'
	je L9
	cmp al, 'x'
	je L9
	cmp al, 'y'
	je L9
	cmp al, 'z'
	je L9

	jmp error


;---------------------------------------------
; The labels will print the relevant digit,
; based on where the jump was made form.
;---------------------------------------------
L2:
	mov edx, OFFSET mssg
	call WriteString
	mov eax, 2
	call WriteDEc
	jmp done
	
L3:
	mov edx, OFFSET mssg
	call WriteString
	mov eax, 3
	call WriteDEc
	jmp done	
	
L4:
	mov edx, OFFSET mssg
	call WriteString
	mov eax, 4
	call WriteDEc
	jmp done
	
L5:
	mov edx, OFFSET mssg
	call WriteString
	mov eax, 5
	call WriteDEc
	jmp done	

L6:
	mov edx, OFFSET mssg
	call WriteString
	mov eax, 6
	call WriteDEc
	jmp done

L7:
	mov edx, OFFSET mssg
	call WriteString
	mov eax, 7
	call WriteDEc
	jmp done

L8:
	mov edx, OFFSET mssg
	call WriteString
	mov eax, 8
	call WriteDEc
	jmp done

L9:
	mov edx, OFFSET mssg
	call WriteString
	mov eax, 9
	call WriteDEc
	jmp done


;----------------------------------------
; If the user didn't enter any of
; the letters from the alphabet,
; print error message and prompt again
;-----------------------------------------
error:
	mov edx, OFFSET err
	call WriteString
	call Crlf
	jmp start
	
	
done:	

	call Crlf
	call WaitMsg

	   
	exit
main ENDP
END main