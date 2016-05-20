
section .text
   global _start

_start:
   mov   eax, -100d
   movsx rcx, eax
   
fim:
   mov rax, 1
   mov rbx, 0
   int 0x80
