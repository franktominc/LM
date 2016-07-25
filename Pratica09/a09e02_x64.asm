; code 64 bits
; montar: nasm -f elf64 a09e02_x64.asm
; ligar : ld a09e02_x64.o -o a09e02_x64.x

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
   ;push dword [v3] ; x64 não permitido
   push qword [v4]


fim:
   mov rax, 1
   mov rbx, 0
   int 0x80
