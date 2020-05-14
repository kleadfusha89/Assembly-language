TITLE Klead Fusha

INCLUDE Irvine32.inc

.data
	chckVal	WORD 2
	
.code

checkPrime PROC
	mov		si, chckVal				; Move the number that will be checked if it's prime or not to the si register

again:
    mov		cx, si					; Move the number to be checked to the cx register (counter)

divide:
	mov		di, cx					; Move counter to di temporarely. We need it for the division we'll do later
	dec		di						; Decrement di
	mov		edx, 0					; Clear the edx register for the remainder

	mov		ax, si					; Move test integer into ax for division
    div		di						; Divide by test integer
    cmp		dx, 0					; Compare the remainder
	jz		notPrime				; If the remainder is 0, which means it's evenly divided, jump to the notPrime label
	
	dec		cx						; Decrement the counter, if it's not evenly divisible,
	cmp		cx, 1					; try with all the numbers until the counter reaches one
	ja		divide					; These three lines will be skipped if the number is not prime
									; If they're not skipped after all the iterations until, cx hits 1, it
									; means that the number is prime.

	inc		bh						; Here we have a prime number, we compare the outer loop counter to three to 
	cmp		bh, 3					; find the third largest value, and jump to label "done" which will return that value
	je		done					; If it's not equal it will continue to notprime which will loop it again
    

notPrime:
	dec		si						; Decrement the number which will be tested and loop again
	loop	again

done:
	mov		ax, si					; Move the third largest prime to ax register and return the value
	ret

checkPrime ENDP



main PROC
	mov		bh, 2					; Move the first value that will be checked if it's prime (0 and 1 are not prime)
	call	checkPrime				; Call the function that will check if the number is prime
	call	WriteInt				; Write the returned value
	call	WaitMsg	
	exit

main ENDP
END main
