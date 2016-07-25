; code 32 bits
; montar: nasm -f elf32 a09e02_x32.asm
; ligar : ld a09e02_x32.o -m elf_i386 -o a09e02_x32.x

section .data
   v1 : db 'a'
   v2 : dw '2b'
   v3 : dd '4ccc'
   v4 : dq '8ddddddd'

section .text
   global _start

_start:

   ;push byte  [v1] ; x32 e x64 não permitido 
   push word  [v2]
   push dword [v3] 
   ;push qword [v4] ; x32 não permitido


fim:
   mov eax, 1
   mov ebx, 0
   int 0x80
