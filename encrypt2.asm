INCLUDE irvine32.inc

.data
strtext BYTE "Enter a plain text:",0
strkey BYTE "Enter a key:",0
strorg BYTE "Original Text:",0
stren BYTE "Encrypted Text:",0
strde BYTE "Decrypted Text:",0
strbye BYTE "Bye!",0

buffertext BYTE 40 DUP(0)
bufferkey BYTE 10 DUP(0)
textleng DWORD ?
keyleng DWORD ?

num DWORD ?

.code
main PROC
L1:
	mov edx, OFFSET strtext
	call WriteString
	mov edx, OFFSET buffertext
	mov ecx, SIZEOF buffertext
	call ReadString
	mov textleng, eax
	cmp textleng, 0
	je ENTERCASE

	mov edx, OFFSET strkey
	call WriteString
	mov edx, OFFSET bufferkey
	mov ecx, SIZEOF bufferkey
	call ReadString
	mov keyleng, eax
	call Crlf
	call Crlf

	mov edx, OFFSET strorg
	call WriteString
	mov edx, OFFSET buffertext
	call WriteString
	call Crlf

	call entext
	
	mov edx, OFFSET stren
	call WriteString
	mov edx, OFFSET buffertext
	call WriteString
	call Crlf

	call entext

	mov edx, OFFSET strde
	call WriteString
	mov edx, OFFSET buffertext
	call WriteString
	call Crlf
	call Crlf

jmp L1

ENTERCASE:
	mov edx, OFFSET strbye
	call WriteString
	call Crlf
exit
main ENDP

entext PROC
	mov ecx, textleng
	mov esi, 0

L2:
	mov num, esi
KEY:
	mov eax, keyleng
	cmp num, eax
	jbe DONE

	sub num,eax
	jmp KEY
DONE:
	mov eax, OFFSET bufferkey
	add eax, num
	mov bl,[eax]
	xor buffertext[esi],bl
	inc esi
loop L2
	
ret
entext ENDP


END main
