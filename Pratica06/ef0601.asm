section .data
   saida:   db "this isn't working!",10
   saidaL: equ $ - saida

section .bss

section .text
   global _start

_start:

   ; aqui deve ser inserido código suicida

   mov rax, 4
   mov rbx, 1
   mov rcx, saida
   mov rdx, saidaL
   int 0x80

fim:
   mov rax, 1
   mov rbx, 0
   int 0x80
