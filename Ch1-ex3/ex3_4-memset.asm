section .data
	demoString db "This is just a demo string"

section .text
	global	_start

memsetAsm:
	; function implementing void *memset(void *s, int c, size_t n) which fills the first n bytes of the memory area pointed to by s with the constant byte c 
	
	;prologue
	push	ebp
	mov	ebp, esp
	; function body
	mov	ecx, [ebp+010h]	; load the number of bytes n in ECX
	mov	al,  [ebp+0Ch]	; load the c in AL
	mov	edi, [ebp+8]	; load the target string in EDI
	rep	stosb

	;epilogue
	mov	esp, ebp
	pop	ebp
	retn

_start:
	xor	eax, eax
	mov	eax, 7
	push	eax
	mov 	eax, 'x'
	push	eax
	mov	eax, demoString
	push 	eax
	call	memsetAsm
	add	esp, 12
	
	; exit
	mov	eax, 1
	mov	ebx, 0
	int	080h
