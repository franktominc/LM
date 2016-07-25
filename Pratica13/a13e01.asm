; copia de palavras entre mem e mmx
;     nasm -f elf64 a13e01.asm
;     gcc -m64 a13e01.o -o a13e01.x
;     p = palavra
;     b = byte

section .data
   ; 8p*1b = 8 bytes
   vetorChar    : db 'aBcdEFGh'     

   ; 4p*2b = 8 bytes
   vetorHalfInt : dw 0x1111, 0x2222, 0x3333, 0x4444 

   ; 2p*4b = 8 bytes
   vetorInt     : dd 0x55556666, 0x77778888       

   ; 1p*8b = 8 bytes
   vetorLongInt : dq 0x9999123499995678           

section .bss
   vetorb : resb 8
   vetorw : resw 4
   vetord : resd 2
   vetorq : resq 1

section .text
   global main:

main:
loads:
   ; mm0 = vetorChar[0-7]
   movq mm0, [vetorChar]

   ; mm1 = vetorChar[0-3]
   movd mm1, [vetorChar]

   ; mm2 = vetorHalfInt[0-3]
   movq mm2, [vetorHalfInt]

   ; mm3 = vetorHalfInt[0-1]
   movd mm3, [vetorHalfInt]

   ; mm4 = vetorInt[0-1]
   movq mm4, [vetorInt]

   ; mm5 = vetorInt[0]
   movd mm5, [vetorInt]

   ; mm6 = vetorLongInt[0]
   movq mm6, [vetorLongInt]

stores1:
   ; vetorb = mm0
   movq [vetorb], mm0

   ; vetorw = mm2
   movq [vetorw], mm2

   ; vetord = mm4
   movq [vetorw], mm4

   ; vetorq = mm6
   movq [vetorq], mm6

stores2:
   ; rax = mm6
   movq rax, mm6

   ; ebx = mm4 (LS4B)
   movd ebx, mm4

   ; Empty MMX Machine State
   emms

fim:
   ret
