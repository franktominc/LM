section .data
   v1: dq  100d
   v2: dq -100d

section .text
   global _start
 
_start:
fim:
   mov rax, 1
   mov rbx, 0
   int 80h
