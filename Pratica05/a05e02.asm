section .text
   global _start

_start:
   mov ax, 0x7fff ; 32767
   mov bx, 0xffff ; 65535

overflow:
   add ax, 1 ; -32768

carry:
   add bx, 1 ; 0

fim:
   mov rax, 1
   mov rbx, 0
   int 80h
