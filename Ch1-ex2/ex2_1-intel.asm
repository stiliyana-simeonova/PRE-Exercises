
	global _start

section .text

read_eip:
	push ebp
	mov ebp, esp
	mov eax, [ebp+4] ; move the return value in the EAX register
	mov esp, ebp
	pop ebp
	ret

_start:
	xor eax, eax
	call read_eip ; after returning from this function the EAX contains the EIP value
	; exit gracefully
	mov eax, 1
	mov ebx, 0
	int 080h
