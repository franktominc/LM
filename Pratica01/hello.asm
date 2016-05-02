section .data
   strOla :  db "Ola", 10
   strOlaL:  equ $ - strOla

section .text
	global _start

_start:
   mov eax, 4
   mov ebx, 1
   mov ecx, strOla
   mov edx, strOlaL
   int 0x80

   mov eax, 1
   mov ebx, 0
   int 0x80
