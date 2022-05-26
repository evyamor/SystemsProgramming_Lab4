%define X 'A'
%define STR string3

section .rodata
    print_format db '"%c" appears in "%s" %d times', 10, 0
    string1 db 'ABBA', 0
    string2 db 'BBA', 0
    string3 db 'BB', 0
    string4 db '', 0

section .text
    global _start
    extern printf

_start:
   mov eax,-1
   mov ecx,0

L2:  
    	add eax, 1
	mov ebx,eax
	add ebx, STR
	movzx ebx,BYTE[ebx]
	cmp ebx, X
	jne continueT
	inc ecx
	
continueT:
	test bl,bl
	jne L2
	
printer:
	sub esp,4
	push ecx
	push STR
	push X
	push print_format
	call printf
	add esp,12
	

		
_exit:
    mov ebx, 0
    mov eax, 1
    int 80h
