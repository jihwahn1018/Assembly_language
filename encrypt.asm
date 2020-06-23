TITLE Assignment 5_1 code : 20141362 Ji-hwan Cheon

INCLUDE irvine32.inc

.data
INCLUDE hw5_1.inc
stunum BYTE "20141362" ,0 
Otext BYTE "Original Text : ",0
Etext BYTE "Encrypted Text : ",0
Dtext BYTE "Decrypted Text : ",0
LOtext BYTE "Length of text is over 40 or length of key is over 10",0


.code
main PROC
	mov ecx, LENGTHOF PlainText
	.IF ecx>40
		jmp lengover
	.ENDIF
	mov ecx, LENGTHOF KeyRotate
	.IF ecx>10
		jmp lengover
	.ENDIF
	
	mov edx, OFFSET stunum
	call WriteString
	call Crlf

	mov edx, OFFSET Otext
	call WriteString
	mov edx, OFFSET PlainText
	call WriteString
	call Crlf

	
	call Encrypte
	
	mov edx, OFFSET Etext
	call WriteString
	mov edx, OFFSET PlainText
	call WriteString
	call Crlf

	call Decrypte

	mov edx, OFFSET Dtext
	call WriteString
	mov edx, OFFSET PlainText
	call WriteString
	call Crlf
	
	jmp rend

lengover:
	mov edx, OFFSET LOtext
	call WriteString
	call Crlf

rend:
	exit
main ENDP

Encrypte PROC
	mov eax, LENGTHOF PlainText
	mov ecx, LENGTHOF KeyRotate
	mov esi, 0
	mov ebx, 0
	.WHILE eax>0
		.IF esi>ecx
			sub esi,ecx
		.ENDIF
		PUSH ecx
		mov cl, KeyRotate[esi]
		.IF cl>0
		ror PlainText[ebx], cl
		.ELSEIF cl<0
		neg cl
		rol PlainText[ebx], cl
		.ENDIF

		POP ecx
		inc esi
		inc ebx
		dec eax
	.ENDW
	ret
Encrypte ENDP

Decrypte PROC
	mov eax, LENGTHOF PlainText
	mov ecx, LENGTHOF KeyRotate
	mov esi, 0
	mov ebx, 0
	.WHILE eax>0
		.IF esi>ecx
			sub esi,ecx
		.ENDIF
		PUSH ecx
		mov cl, KeyRotate[esi]
		.IF cl>0
		rol PlainText[ebx], cl
		.ELSEIF cl<0
		neg cl
		ror PlainText[ebx], cl
		.ENDIF

		POP ecx
		inc esi
		inc ebx
		dec eax
	.ENDW
	ret
Decrypte ENDP

END main
