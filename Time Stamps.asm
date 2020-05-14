TITLE Klead Fusha

INCLUDE Irvine32.inc

.data

	hours	DWORD 00001b
	seconds DWORD 00011b
	mins DWORD 00111b

.code

	push OFFSET hours
	push OFFSET mins
	push OFFSET seconds

ShowFileTime PROC

	push ebp

	and eax,0FFFFh	; clear upper half of EAX
	mov bx,ax	; BX = a copy of the file time
	shr ax,11	; shift hour to the right
	cmp ax,10	; is the hour >= 10?
	jae L1	; yes: display it
	call DisplayZero	; no: display a leading zero

L1:	call WriteDec	; display the hour

	mov al,':'	; display a ":"
	call WriteChar

	mov ax,bx	; AX = file time
	shr ax,5	; shift minutes to the right
	and ax,0000000000111111b	; discard bits other than minutes
	cmp ax,10	; minutes >= 10?
	jae L2	; yes: display them now
	call DisplayZero	; no: display a leading zero

L2:	call WriteDec	; display the minutes

	mov al, ':'	; display a ":"
	call WriteChar

	mov ax,bx	; AX = file time
	and ax,0000000000001111b	; discard bits other than seconds
	cmp ax,10	; seconds >= 10?
	jae L3	; yes: display them now
	call DisplayZero	; no: display a leading zero

L3:	call WriteDec	; display seconds
	call Crlf

	pop ebp

	ret
ShowFileTime ENDP

;--------------------------------------------------------
DisplayZero PROC
;
; Displays a zero character
; Receives: nothing
; Returns: nothing
;--------------------------------------------------------
	push eax

	mov al,'0'	; char to display
	call WriteChar

	pop eax
	ret
DisplayZero ENDP

main PROC
	; Your code goes here
	call Clrscr

	call ShowFileTime
	call waitmsg
	exit
main ENDP
END main