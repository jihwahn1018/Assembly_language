INCLUDE irvine32.inc

.data
var1 BYTE "65",0
count DWORD ?
sum DWORD 0

.code
main PROC
	mov eax, 0
	mov ecx, LENGTHOF var1
	dec ecx

L1:
	mov ebx, LENGTHOF var1
	dec ebx

	mov count, ecx
	sub ebx, ecx
	mov ecx, 7
	movzx edx, [var1+ebx]
	sub edx, '0'
	mov sum, eax
	add sum, edx

	mov eax, 0
L2:
	add eax, sum
	loop L2

	mov ecx, count
	loop L1

	mov eax, sum

	call DumpRegs
	exit
main ENDP
END main
