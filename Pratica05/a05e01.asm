section .text
   global _start

_start:

   mov eax, 10
   mov ebx, 20
   mov ecx, 30
   mov edx, 0xfffffffe

   add ebx, eax
   add edx, eax

   sub ecx, eax
   sub eax, ecx

fim:
   mov rax, 1
   mov rbx, 0
   int 0x80
