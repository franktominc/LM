; multiplicacao por 4 de um vetor de 8 inteiros
;   depois divide por 2 
;     nasm -f elf64 a13e03.asm
;     gcc -m64 a13e03.o -o a13e03.x

section .data
   ; 8 ints * 4 bytes = 32 bytes
   vetInt1 : dd 1, 2, 3, 4, 5, 6, 7, -8 

section .bss
   vetResult1 : resd 8
   vetResult2 : resd 8

section .text
   global main

main:

   xor rcx, rcx ; contador
   ; opera em 2 ints por execucao
   ; multiplicacao por 4 via desloc a esquerda
   ; (pslld mm0, 2)
multi:
   movq mm0, [vetInt1+rcx]
   pslld mm0, 2
   movq [vetResult1+rcx], mm0
   add rcx, 8
   cmp rcx, 32
   jl multi

   xor rcx, rcx ;contador
   ; opera em 2 ints por execucao
   ; divisao por 2 via desloc a direita
   ; (pslld mm0, 2)
divid:
   movq mm0, [vetResult1+rcx]
   psrad mm0, 1
   movq [vetResult2+rcx], mm0
   add rcx, 8
   cmp rcx, 32
   jl divid

   ; Empty MMX Machine State
   emms
   
fim: 
   ret
