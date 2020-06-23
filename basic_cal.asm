INCLUDE irvine32.inc

.data
INCLUDE hw2.inc

.code
main PROC
	mov ECX, val1
	add ECX, ECX
	add ECX, ECX
	add ECX, ECX
	mov EAX, ECX
	mov EBX, ECX

	mov ECX, val1
	add ECX, ECX
	add ECX, ECX
	add EAX, ECX
	add EBX, ECX
	add EBX, val1
	add EBX, val1

	mov ECX, val2
	add ECX, ECX
	add ECX, ECX
	add ECX, ECX
	add EBX, ECX
	add ECX, ECX
	add ECX, ECX
	add EAX, ECX
	
	mov ECX, val2
	add ECX, ECX
	add ECX, ECX
	add EBX, ECX
	add ECX, ECX
	add ECX, ECX
	add EAX, ECX
	
	mov ECX, val2
	add EBX, ECX
	add ECX, ECX
	add ECX, val2
	add EAX, ECX

	mov ECX, val4
	sub ECX, val3
	add ECX, ECX
	add ECX, ECX
	add ECX, val4
	sub ECX, val3
	sub EAX, ECX
	add EBX, ECX
	add EBX, ECX
	add EBX, ECX
	
	call DumpRegs
	exit
main ENDP
END main
