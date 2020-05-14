TITLE Klead Fusha

INCLUDE Irvine32.inc

.data
	promptInput BYTE "Enter number: ", 0
	promptInvalid BYTE "Invalid input !!! ", 0
	promptResult BYTE "Integer square root: ", 0
	promptDecision BYTE "Do you want to calculate again? (ONLY: y(Y) or n(N) ) ", 0

.code
main PROC

getInput:								; get input

		MOV EDX, OFFSET promptInput		; show input prompt
		CALL WriteString				;
		CALL ReadInt					; read input number ans store in EAX
		CMP EAX, 0		
		JG calculate					; compare EAX with 0. If input> 0, it will jump into calculate lable
		MOV EDX, OFFSET promptInvalid		; if input<=0, show invalid message	
		CALL WriteString				;
		CALL crlf						; new line
		JMP getInput					; repeat until get the right input

calculate:
		mov EBP, EAX					; store input, x= EBP
		mov EBX, EAX					; op = EBX =x
		mov ECX, 0					; res = ECX =0
		mov EDI, 1					; one = EDI
		SHL EDI, 30					; short way: mov EDI, 40000000h 
									; because 2^30= 1073741824= 40000000h

		firstWhile:
				CMP EDI, EBP			; compare EDI=one vs EBP = x
				JLE secondWhile		; if one <= x, jump into secondWhile
				SAR EDI, 2			; shift right "one" by 2
				JMP firstWhile			; repeat until one <=x
		secondWhile: 
				CMP EDI, 0			; compare 
				JE result				; if one = 0, then jump into result's label and print the result
				mov ESI, ECX			; ESI = res
				add ESI, EDI			; ESI = res + one
				cmp EBX, ESI
				JL nextStep			; if op < res + one, jump into nextStep
				SUB EBX, ESI			;op -= res + one;
				SAL EDI, 1			; shift left first
				ADD ECX, EDI			; then add, res += one << 1
				SAR EDI, 1			; shift right to return one's value

				nextStep:
					SAR ECX, 1		; res >>= 1; 
					SAR EDI, 2		; one >>= 2;
				     
				JMP secondWhile

result:
	MOV EAX, ECX
	MOV EDX, OFFSET promptResult			; show output prompt
	call WriteString
	call WriteDec						; display the result
	call crlf							; new line

decision:
	MOV EDX, OFFSET promptDecision		; prompt input decision
	call WriteString					
	call ReadChar						; get input
	call WriteChar						; 
	call crlf							; new line
	CMP AL, 'y'						
	JE getInput						; if users enter y, jump into getINput
	CMP AL, 'Y'
	JE getInput						; if users enter Y, jump into getINput
	CMP AL, 'n'
	JE done							; if users enter n, jump into done
	CMP AL, 'N'
	JE done							; if users enter N, jump into done

	mov EDX, OFFSET promptInvalid			; if users enter invalid character, it will show a message
	call WriteString
	call crlf							; new line
	JMP decision

	done:							; this label does not have anything
	
	exit
main ENDP
	
END main