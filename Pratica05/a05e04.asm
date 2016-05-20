section .data
   v1: dw 0xfffb ; 1111.1111 1111.1011
   v2: dw 0xaaaa ; 1010.1010 1010.1010

section .bss
   v1orv2:  resw 1
   v1andv2: resw 1
   v1xorv2: resw 1

section .text
   global _start

_start:
   mov ax, [v1]
   mov bx, [v2]
   mov cx, [v2]

   ; or reg x reg
   or cx, ax

   ; or mem x reg
   mov [v1orv2], ax
   or  [v1orv2], bx

   ; or reg, imm
   or bx, 0x00ff

andlabel:
   ; and
   mov ax, [v1]
   mov bx, [v2]
   mov cx, [v2]

   ; and reg x reg
   and cx, ax

   ; and mem x reg
   mov [v1andv2], ax
   and [v1andv2], bx

   ; and reg, imm
   and bx, 0x00ff

xorlabel:
   ; xor
   mov ax, [v1]
   mov bx, [v2]
   mov cx, [v2]   

   ; xor reg x reg
   xor cx, ax

   ; xor mem x reg
   mov [v1xorv2], ax
   xor [v1xorv2], bx

   ; xor reg, imm
   xor bx, 0x00ff

fim:
   mov rax, 1 
   mov rbx, 0
   int 0x80


