.data
	myString:
		.asciz "abcdefgh"

.text
	.globl _start
	.type TestFunc, @function

	TestFunc:
		# function prologue
		push %ebp		# preserve the old EBP value
		movl %esp, %ebp	
		
		# function body - same as example 1 code in AT&T syntax
		movl 8(%ebp), %edi 	# load the first function parameter in EDI - pointer to myStirng
		movl %edi, %edx    	# store the initial EDI value in EDX
		xor %eax, %eax	   	# EAX = 0
		or  $0xffffffff, %ecx 	# set ECX to the maximum representable value
		repne scasb	   	# compare EDI content byte by byte with AL (NULL) or ECX becomes 0 :)
		add $2, %ecx	   	# at the end of repne scasb ECX has value (-strlen -2). With this sum ECX = -strlen
		neg %ecx	   	# ECX = strlen
		movb 12(%ebp), %al 	# load second function argument
		movl %edx, %edi    	# load the initial EDI value (firts argument) back to EDI
		rep stosb	   	# store strlen number of bytes in EDI al with the al value (character) 
		movl %edx, %eax    	# store EDX value in EAX
		
		# function epilogue
		movl %ebp, %esp	   	# restore the old ESP value
		pop %ebp	   	# restore the old EBP value
		ret			

	_start:
		# push the function arguments into the stack
		push $0x2A		# ASCII '*'
		push $myString		# pointer to myString

		# call the funciton
		call TestFunc
		
		# exit gracefully
		movl $1, %eax
		movl $0, %ebx
		int $0x80
