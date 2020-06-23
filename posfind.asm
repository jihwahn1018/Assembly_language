TITLE Assignment 6_2 code : 20141362 Ji-hwan Cheon

INCLUDE irvine32.inc

.data
INCLUDE hw6_2.inc
strnum BYTE "20141362",0
posval BYTE "Position value : ",0
tarlen DWORD ?
sourcelen DWORD ?

.code
main PROC
	INVOKE Str_length, ADDR target
	mov tarlen, eax
	cmp eax, 41
	ja lengover
	INVOKE Str_length, ADDR source
	mov sourcelen,eax
	cmp eax,41
	ja lengover
	mov eax, sourcelen
	cmp eax, tarlen
	ja lengover

	mov ecx, tarlen
	call posfind

	cmp pos, 100
	je lengover

	mov edx, OFFSET strnum
	call WriteString
	call Crlf


	mov edx, OFFSET posval
	call WriteString
	mov eax, pos
	call WriteDec
	call Crlf

lengover:
exit
main ENDP

posfind PROC
	mov edx,0
L1:
	push edx
	mov ebx,0

	.WHILE ebx<sourcelen
		mov al, target[edx]
		cmp source[ebx], al
		jne L2
		inc ebx
		inc edx
	.ENDW

	pop eax
	mov pos, eax
	jmp L3

L2:	
	pop edx
	inc edx
	loop L1
L3:
ret
posfind ENDP

END main
