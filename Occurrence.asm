TITLE Klead Fusha

INCLUDE Irvine32.inc

.data
	prompt BYTE "Enter number [0 to quit]: " ,0
	intNum    DWORD ?
	promptBad BYTE "Invalid input, please enter again",0
	maximum DWORD 1
	occurr  DWORD 0
	largest BYTE "The largest number is: ", 0
	countocc BYTE "The occurrence count of the largest number is: ", 0

.code
main PROC

read:  
	mov edx, OFFSET prompt
	call WriteString				; Prompt the user to enter a number

	call ReadInt					; Read a number from the console
    jno  goodInput					; If the overflow is not set jump to good input label
	
	mov  edx,OFFSET promptBad		; Otherwise, print an error message
    call WriteString				
	call Crlf
    jmp  read						; Prompt the user to enter again a correct value

goodInput:
	cmp eax, maximum
	jl nope							; If the new number is less than the previous one, skip to nope label

	cmp eax, maximum				; If the numbers are not equal, (which means we have a new max value)
	jne reset						; Skip to reset, which will reset the occurrence

	mov maximum, eax				; The only possibility left is when the numbers are equal, which
	inc occurr						; will increase the occurrence and skip the reset label by
	jmp nope						; jumping to nope

reset:
	mov maximum, eax				; Reset when a new maximum number occurs
	mov occurr, 1					; Reset the occurrence, since it's a new number

nope:
	cmp eax, 0						; If the value entered was a 0
	je done							; Jump to done
	jmp read						; Otherwise, start all over by prompting again the user


done:
	mov edx, OFFSET largest			; Print the string for the largest number
	call WriteString
	mov eax, maximum				; Moving maximum to the eax register so we can print the max value
	call WriteDec
	call Crlf

	mov edx, OFFSET countocc		; Print the string for the count occurrence
	call WriteString
	mov eax, occurr					; Moving the occurrence to the eax register so we can print the occurence
	call WriteDec
	call Crlf

	call WaitMsg
	exit
main ENDP
END main