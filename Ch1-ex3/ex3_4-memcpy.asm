section	.data
	demoString	db	'This is a test string',0
	demoString2	db	'xxxxxxxxxxxxxxxxxxxxx',0

section	.text
	global _start



memcpyAsm:
	; function implementing void *memcpy(void *dest, const void *src, size_t n); 
	; the function copies n bytes from memory area src to memory area dest and returns a pointer to dest.

	;prologue
	push	ebp
	mov	ebp, esp

	;function body
	mov	edi, [ebp+8]	;load dest address in EDI
	mov	edx, edi	; store for further use
	mov	esi, [ebp+0Ch]	;load src address in  ESI
	mov	ecx, [ebp+10h]	; load n (number of bytes to copy) in ECX
	rep	movsb		; move byte from src to dest n times
	mov	eax, edx

	;epilogue
	mov	esp,ebp	
	pop	ebp
	retn
_start:

	xor 	eax, eax
	mov	eax, 3
	push	eax
	mov	eax, demoString
	push 	eax
	mov	eax, demoString2
	push	eax
	call	memcpyAsm
	pop	ebx
	pop	ebx
	pop	ebx

	;exit
	mov	eax, 1
	mov	ebx, 0
	int	080h

