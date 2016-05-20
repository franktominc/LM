section .text
   global _start
_start:
   mov r8, 10
repete:
   dec r8
   jnz repete
fim:
   mov rax, 1
   mov rbx, 0
   int 0x80
