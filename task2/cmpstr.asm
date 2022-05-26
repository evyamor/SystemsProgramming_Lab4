section .text
	global cmpstr ;make cmpstr transparent to other modules

cmpstr:
	push ebp ;stack maintenance
	mov ebp, esp ;stack maintenance
	mov edx,ebx
	mov eax, -1

.L2:
	add eax,1
	mov ebx, eax
	mov ecx,eax
	add ebx,[ebp+8]
	add ecx,[ebp+12]
	movzx ebx,BYTE[ebx]
	movzx ecx,BYTE[ecx]
	cmp ebx, ecx
	jne NotEq
	test bl,cl
	je Eq
	jmp .L2

NotEq:
	sub ebx, ecx
	mov eax, ebx
	jmp _exit

Eq:
	mov eax,0
	jmp _exit

_exit:
	mov esp,ebp
	mov ebx,edx
	pop ebp
	ret 

	