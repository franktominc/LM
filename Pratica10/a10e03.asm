; deslocamento aritmético

section .text
   global _start

_start:
   mov ax, 0xEE01
   mov bx, 0xEE01
desloc1:
   sal ax, 1
   sar bx, 1
desloc2:
   sal ax, 4
   sar bx, 4
fim:
   mov eax, 1
   mov ebx, 0
   int 0x80
