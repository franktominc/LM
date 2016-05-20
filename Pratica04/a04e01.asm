section .data
   v1: db 0x61 
   v2: dd 0x65646362

section .bss
   n1: resb 1
   n2: resd 1
   n3: resb 1

section .text
   global _start

_start:
   mov al   , [v1]
   mov [n1] , al
   mov [n3] , al
   mov ebx  , [v2]
   mov [n2] , ebx

fim:
   mov rax, 1
   mov rbx, 0
   int 0x80
