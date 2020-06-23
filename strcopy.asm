TITLE Assignment 6_1 code : 20141362 Ji-hwan Cheon

INCLUDE irvine32.inc

.data
INCLUDE hw6_1.inc
buffer BYTE 100 dup(?)
lengcheck DWORD ?

strnum BYTE "20141362",0
copstr BYTE "Copied string :", 0


.code
main PROC
		INVOKE Str_length, ADDR strSrc
		cmp eax, 41
		ja lengover

		mov edx, OFFSET strnum
		call WriteString
		call Crlf
		
		movzx ecx, copyNum
		mov esi, OFFSET strSrc
		mov edi, OFFSET strDest

		call strcopy
		
		mov edx, OFFSET copstr
		call WriteString
		mov edx, OFFSET strDest
		call WriteString
		call Crlf

lengover:
	exit
main ENDP

strcopy PROC
	cld
	rep movsb
	ret
strcopy ENDP

END main
