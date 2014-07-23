section .data
	demoString db	'This is a test string',0

section .text

	global	_start

strchrAsm:
	;function analogue to  char *strchr(const char *s, int c); which locates the first occurrence of a char in a string
	; prologue
	push	ebp
	mov	ebp, esp
	push	edi
	push 	edx

	;begin the function body
	mov	edi, [ebp+8]
	mov	edx, edi	;save it so we can restore it later
	xor	eax, eax	; we are going to search null char
	or	ecx, 0FFFFFFFFh ; set EAX -1
	repne	scasb
	add	ecx, 1		
	neg	ecx		; the length of the string including the null character
	mov	edi, edx	; move back the EDI to the firts char
	mov	al, [ebp+0Ch]	; load the second parameter into AL
	repne	scasb
	test	ecx, ecx	; check if we reached the end of the string without exit i.e. no match
	jz	notFound
	mov	eax, edi	; the edi will point to the 
	jmp	commonEnd	
   notFound:
	xor	eax, eax
   commonEnd:		
	;epilogue
	pop	edx
	pop	edi
	mov	esp, ebp
	pop	ebp
	retn

_start:
	xor	eax, eax
	mov	eax, 'a'
	push	eax
	mov	eax, demoString
	push	eax
	call	strchrAsm
	pop 	ebx
	pop	ebx

	;exit
	mov	eax, 1
	mov	ebx, 0
	int	080h

	
