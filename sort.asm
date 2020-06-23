TITLE Assignment 5_2 code : 20141362 Ji-hwan Cheon

INCLUDE irvine32.inc

.data
INCLUDE hw5_2.inc
strnum BYTE "20141362",0
Bsort BYTE "Before sort : ",0
Asort BYTE "After sort : ",0

.code
main PROC
	mov edx, OFFSET strnum
	call WriteString
	call Crlf


	mov edx, OFFSET Bsort
	call WriteString

	mov ecx, LenData
	mov esi, 0

	.WHILE ecx>0
		mov eax, ArrData[esi]
		call WriteHex
		mov al, ' '
		call WriteChar
		dec ecx
		add esi,4
	.ENDW
	call Crlf

	call Sort

	mov edx, OFFSET Asort
	call WriteString

	mov ecx, LenData
	mov esi, 0

	.WHILE ecx>0
		mov eax, ArrData[esi]
		call WriteHex
		mov al, ' '
		call WriteChar
		dec ecx
		add esi, 4
	.ENDW
	call Crlf

exit
main ENDP

Sort PROC
	mov ecx, 0
	mov esi, 0

	.WHILE ecx<LenData
		pushad
		mov eax, ArrData[esi]
		mov edx, esi
		add ecx,2
		add esi,8
		.WHILE ecx<LenData
			mov ebx, ArrData[esi]
			push eax
			push ebx
			ror eax,16
			ror ebx,16
			.IF ax> bx
				pop ebx
				pop eax
				xchg eax,ArrData[esi]
				mov ArrData[edx], eax
			.ELSEIF ax==bx
				pop ebx
				pop eax
				.IF ax<bx
					xchg eax,ArrData[esi]
					mov ArrData[edx], eax
				.ENDIF
			.ELSE
				pop ebx
				pop eax
			.ENDIF
			add esi,8
			add ecx,2
		.ENDW

		popad
		pushad
		add ecx, 1
		add esi, 4
		mov eax, ArrData[esi]
		mov edx, esi
		add ecx, 2
		add esi,8
		.WHILE ecx<LenData
			mov ebx, ArrData[esi]
			push eax
			push ebx
			ror eax,16
			ror ebx,16
			.IF ax<bx
				pop ebx
				pop eax
				xchg eax,ArrData[esi]
				mov ArrData[edx],eax
			.ELSEIF ax==bx
				pop ebx
				pop eax
				.IF ax>bx
					xchg eax,ArrData[esi]
					mov ArrData[edx], eax
				.ENDIF
			.ELSE
				pop ebx
				pop eax
			.ENDIF
			add esi,8
			add ecx,2
		.ENDW
		popad
		add esi,8
		add ecx,2
	.ENDW
	ret
Sort ENDP

END main
