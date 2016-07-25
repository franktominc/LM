; negação

section .text
   global _start

_start:
   mov ax, 0xEE01
negacao:
   neg ax

fim:
   mov eax, 1
   mov ebx, 0
   int 0x80
