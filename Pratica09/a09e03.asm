section .data
   nomeP : db 10, 'Nome do programa: '
   strl1 : equ $-nomeP
   param : db 10, 'param           : '
   strl2 : equ $-param

   lf    : db 10,10

section .bss
   temp : resb 1  ; char para impressao
   argc : resq 1  ; numero de parametros
   desl : resd 1  ; int 80h altera regs
 
section .text
   global _start

_start:
   xor r9, r9

   pop qword [argc]  ; no. de parametros

   mov rax, 4
   mov ebx, 1
   mov ecx, nomeP
   mov edx, strl1 
   int 0x80

printSaida:
   pop r15   ; parametro *string

laco:
   mov r9d, [desl]
   mov r8b, [r15+r9]
   cmp r8b, 0
   je testaParam

laco2:

   mov [temp], r8b
   mov rax, 4
   mov ebx, 1
   mov ecx, temp
   mov edx, 1 ; char-a-char
   int 0x80

   inc dword [desl]
   jmp laco


testaParam:
   mov dword [desl], 0
   dec dword [argc]
   jz fim
   mov rax, 4
   mov ebx, 1
   mov ecx, param
   mov edx, strl2
   int 0x80

   jmp printSaida

fim:
   mov rax, 4
   mov ebx, 1
   mov ecx, lf
   mov edx, 2 
   int 0x80

   mov eax, 1
   mov ebx, 0
   int 0x80
