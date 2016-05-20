section .text
   global _start

_start:

c1:
   mov eax, -1
   add eax, 2
c2:
   adc ebx, eax

b1:
   mov ecx, 2
   sub ecx, 3
b2:
   sbb edx, ecx

fim:
   mov rax, 1
   mov rbx, 0
   int 0x80
