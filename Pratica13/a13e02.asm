; ajuste de maiuscula e minuscula para
;  palavras de 8 bytes
;     nasm -f elf64 a13e02.asm
;     gcc -m64 a13e02.o -o a13e02.x

%define maxChar 8

section .data
   charMisto : db 'aBcDefGH', 0
   charMinus : db 'abcdefgh', 0
   charMaius : db 'ABCDEFGH', 0

   ; 0x20 = 0010 0000b
   mask2Minus : dq 0x2020202020202020

   ; 0xDF = 1101 1111b
   mask2Maius : dq 0xDFDFDFDFDFDFDFDF

   ; 0x20 = 0010 0000b
   mask2Inver : dq 0x2020202020202020

   ; para printf
   pfStr : db 'orig: %s alter: %s',10 ,0

section .bss
   charMisto2Minus : resb maxChar
   charMisto2Maius : resb maxChar
   charMaius2Minus : resb maxChar
   charMinus2Maius : resb maxChar
   charMisto2Inver : resb maxChar 

extern printf

section .text
   global main

main:

   ; charMisto para Minuscula (charMisto2Minus)
   movq mm0, [charMisto]
   por  mm0, [mask2Minus]
   movq [charMisto2Minus], mm0
   mov byte [charMisto2Minus+maxChar], 0 ; printf null-terminated

   xor rax, rax
   mov rdi, pfStr
   mov rsi, charMisto
   mov rdx, charMisto2Minus
   call printf

L0:
   ; charMisto para Maiuscula (charMisto2Maius)
   movq mm1, [charMisto]
   pand mm1, [mask2Maius]
   movq [charMisto2Maius], mm1
   mov byte [charMisto2Maius+maxChar], 0

   xor rax, rax
   mov rdi, pfStr
   mov rsi, charMisto
   mov rdx, charMisto2Maius
   call printf

L1:
   ; charMinus para Maiuscula (charMinus2Maius)
   movq mm2, [charMinus]
   pand mm2, [mask2Maius]
   movq [charMinus2Maius], mm2
   mov byte [charMinus2Maius+maxChar], 0

   xor rax, rax
   mov rdi, pfStr
   mov rsi, charMinus
   mov rdx, charMinus2Maius
   call printf
   
L2:
   ; charMaius para Minuscula (charMaius2Minus)
   movq mm3, [charMaius]
   por  mm3, [mask2Minus]
   movq [charMaius2Minus], mm3
   mov byte [charMaius2Minus+maxChar], 0

   xor rax, rax
   mov rdi, pfStr
   mov rsi, charMaius
   mov rdx, charMaius2Minus
   call printf
   
L3:
   ; charMisto para inversao (charMisto2Inver)
   movq mm4, [charMisto]
   pxor mm4, [mask2Inver]
   movq [charMisto2Inver], mm4
   mov byte [charMisto2Inver+maxChar], 0

   xor rax, rax
   mov rdi, pfStr
   mov rsi, charMisto
   mov rdx, charMisto2Inver
   call printf

   ; Empty MMX Machine State
   emms
fim:
   ret
   
