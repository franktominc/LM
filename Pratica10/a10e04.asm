; deslocamento aritmético

section .text
   global _start

_start:
   mov ax, 0xEE01
   mov bx, 0xEE01
desloc1:
   rol ax, 1 ; 0xDC03
   ror bx, 1 ; 0xF700
desloc2:
   rol ax, 4 ; 0xC03D
   ror bx, 4 ; 0x0F70
fim:
   mov eax, 1
   mov ebx, 0
   int 0x80
