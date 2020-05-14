TITLE Klead Fusha

INCLUDE Irvine32.inc

.data
	rollResultText   BYTE "Dice Roll: ", 0
	equalsText       BYTE "= ", 0

	loserResultText  BYTE "You lose!", 0
	winnerResultText BYTE "You win!", 0

	numberWinnersText BYTE "Winners: ", 0
	numberLosersText  BYTE "Losers : ", 0
	
	winners DWORD 0
	losers  DWORD 0

.code

rollTwoDice PROC USES ebx ecx edx
	mov edx, OFFSET rollResultText
	call WriteString
	mov ebx, 0
	mov ecx, 2
again:
	mov eax, 6
	call RandomRange
	inc eax
	call WriteInt
	add ebx, eax
	mov eax, ' '
	call WriteChar
	loop again
complete:
	mov edx, OFFSET equalsText
	call WriteString
	mov eax, ebx
	call WriteInt
	call Crlf
	ret
rollTwoDice ENDP

main PROC
	mov ecx, 10
	call Randomize    
newRound:
	call rollTwoDice  
	cmp eax, 6
	jl tryAgain
	cmp eax, 8
	jg tryAgain
	jmp loser
tryAgain:
	call rollTwoDice  
	cmp eax, 6
	jl loser
	cmp eax, 8
	jg loser
winner:
	inc winners
	mov edx, OFFSET winnerResultText
	jmp roundComplete
loser:
	inc losers
	mov edx, OFFSET loserResultText
roundComplete:	
	call writeString
	call Crlf
	call Crlf
	loop newRound
results:
	call Crlf
	mov edx, OFFSET numberWinnersText
	call WriteString
	mov eax, winners
	call WriteInt
	call Crlf
	mov edx, OFFSET numberLosersText
	call WriteString
	mov eax, losers
	call WriteInt
	call Crlf

	call WaitMsg
	exit
main ENDP

END main