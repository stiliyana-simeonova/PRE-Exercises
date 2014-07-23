section	.data
	demoString1	db	'abcd',0
	demoString2	db	'ABCD',0

section	.text
	global _start

strcmpAsm:
	; function implementing int strcmp(const char *s1, const char *s2);  
	; The function compares the two strings s1 and s2 and It returns an integer less than, equal to, or greater than zero if s1 is found
	; respectively, to be less than, to match, or be greater than s2. 

	;prologue
	push	ebp
	mov	ebp, esp

	;function body
	; first calculate the string length of both strings and compare them
	xor	eax, eax
	or	ecx, 0FFFFFFFFh
	mov	edi, [ebp+8]
	repne	scasb
	add	ecx, 2
	neg	ecx
	mov	edx, ecx
	mov	ecx, 0FFFFFFFFh
	mov	edi, [ebp+0Ch]
	repne 	scasb
	add	ecx,2
	neg	ecx
	cmp	edx, ecx
	je	compareSymbols
	jg	s1abs2
  s1bels2:
	mov	eax, -1		
	jmp	commonEnd
  s1abs2:
	mov	eax, 1
	jmp	commonEnd
  s1eqs2:
	mov	eax, 0
	jmp	commonEnd
  compareSymbols:
	mov	esi, [ebp+8]
	mov	edi, [ebp+0Ch]
	repe	cmpsb
	je	s1eqs2
	ja	s1bels2
	jmp	s1abs2
commonEnd:
	mov	esp,ebp	
	pop	ebp
	retn
_start:

	xor 	eax, eax
	mov	eax, demoString2
	push 	eax
	mov	eax, demoString1
	push	eax
	call	strcmpAsm
	add	esp, 8	

	;exit
	mov	eax, 1
	mov	ebx, 0
	int	080h

