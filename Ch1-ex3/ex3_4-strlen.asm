section .data
	demoString db "This is a test string", 0

section .text
	global _start

strlenAsm:
	;function equivalent to strlen C size_t strlen(const char *str) 
	push	ebp
	mov	ebp, esp
	
	mov	edi, [ebp+8]	;move the function argument into EDI
	xor	eax, eax	; we will search for 0 terminator
	or	ecx, 0FFFFFFFFh	; set ECX to -1
	repne	scasb
	add	ecx, 2
	neg	ecx
	mov	eax, ecx	; move the result to eax	
	mov	esp, ebp
	pop 	ebp
	retn
_start:
	xor 	eax, eax
	mov 	eax, demoString
	push 	eax
	call 	strlenAsm
	pop	ebx	; clean the stack
	
	;exit gracefully
	mov eax, 1	; call interrupt 1
	mov ebx, 0	; result is 0
	int 080h 	; software interrupt

