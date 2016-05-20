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
   mov rax, v1
   mov rbx, v2
   mov rcx, n1
   mov rdx, n2
   mov r8 , n3
   mov r9 , _start

fim:
   mov rax, 1
   mov rbx, 0
   int 0x80
