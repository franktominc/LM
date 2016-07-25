; chamada para printf
;  x86

%define _exit   1
%define _kernel 0x80

section .data
   strCtrl : db 'I can kill you %s, %d times!', 10, 0 ; null-terminated
   umInt   : dd 2
   umaStr  : db 'with my brain', 0 ; null-terminated

extern printf

section .text
   global main

main:
   ; não será salvo registradores

   ; empilha parâmetros da direita para esquerda
   push dword [umInt] ; conteúdo do inteiro 'umInt'
   push umaStr ; endereço para string 'umaStr'
   push strCtrl ; string de controle para printf
   call printf

fim:
   mov eax, _exit
   mov ebx, 0
   int _kernel
