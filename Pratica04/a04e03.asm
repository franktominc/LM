section .data
   v1: dq 0x61
   v2: dq 97d
   v3: dq 141o
   v4: dq 1100001b

section .text
   global _start

_start:

fim:
   mov r8, _start
   mov r9, fim

fim2:
   mov rax, 1
   mov rbx, 0
   int 80h
