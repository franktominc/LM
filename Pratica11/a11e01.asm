; exemplo de chamada de procedimento

%define _exit  1
%define _write 4
%define _kernel 0x80

section .data
   strOla  : db "You can't take the sky from me", 10
   strOlaL : equ $-strOla

section .text
   global _start

_start:
   ; PUSH fim
   ; PC = procAsk  
   call procAsk   

fim:
   mov eax, _exit
   mov ebx, 0
   int _kernel

procAsk:
   mov eax, _write
   mov ebx, 1
   mov ecx, strOla
   mov edx, strOlaL
   int _kernel
   
   ; POP PC (!?)
   ret
