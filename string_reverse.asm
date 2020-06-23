INCLUDE irvine32.inc

.data
buffer BYTE 42 DUP(0)
bytecount DWORD ?
inword BYTE "Type_A_String_To_Reverse:",0
outword BYTE "Reversed_String:",0


.code
main PROC
	
L1:
	call Rev_input
	cmp bytecount, 0
	je ENDPROC
JMP L1

ENDPROC:	
exit
main ENDP

Rev_input PROC
START:
	mov edx, OFFSET inword
	call WriteString

	mov edx, OFFSET buffer
	mov ecx, SIZEOF buffer
	call ReadString
	mov bytecount, eax
	cmp bytecount, 40
	ja START
	cmp bytecount, 0
	je ENTERCASE
	mov ecx, bytecount
	mov esi,0

L1:
	cmp buffer[esi],32
	je DONE
	cmp buffer[esi],0
	je DONE
	cmp buffer[esi],'a'
	jb SMALL
	
	sub buffer[esi], 32
	jmp DONE
SMALL:
	add buffer[esi], 32

DONE:
	movzx eax, buffer[esi]
	push eax
	inc esi
loop L1

	mov ecx, bytecount
	mov esi, 0

L2:
	pop eax
	mov buffer[esi], al
	inc esi
loop L2

	mov edx, OFFSET outword
	call WriteString
	mov edx, OFFSET buffer
	call WriteString
	call Crlf
ENTERCASE:
	ret
Rev_input ENDP

END main
