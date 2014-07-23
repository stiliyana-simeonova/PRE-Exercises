section .data
	demoString db "This is just a demo string"

section .text
	global	_start

strsetAsm:
	; function implementing char *strset(char *string, int c);
	; the function replaces all characters form a srting with given character c  
	
	;prologue
	push	ebp
	mov	ebp, esp
	; function body
	
	;first find the string length
	xor	eax, eax
	or	ecx, 0FFFFFFFFh
	mov	edi, [ebp+8]
	mov	edx, edi
	repne	scasb
	add	ecx,2
	neg	ecx
	xor	eax, eax
	mov	al,  [ebp+0Ch]	; load the c in AL
	mov	edi, [ebp+8]	; load the target string in EDI
	rep	stosb
	mov	eax, edx

	;epilogue
	mov	esp, ebp
	pop	ebp
	retn

_start:
	xor	eax, eax
	mov 	eax, 'x'
	push	eax
	mov	eax, demoString
	push 	eax
	call	strsetAsm
	add	esp, 8
	
	; exit
	mov	eax, 1
	mov	ebx, 0
	int	080h
