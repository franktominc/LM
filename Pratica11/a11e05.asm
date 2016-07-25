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
   ; printf("Ola mundo %d %s\n", umInt, umaStr);

   ; não será salvo registradores

   ; não será passado ponto-flutuante
   xor rax,rax      ; número de registradores xmm0 é zero

   ; carrega parâmetros da esquerda para direita nos registradores
   ; RDI, RSI, RDX
   mov rdi, strCtrl ; string de controle para printf
   mov esi, umaStr  ; endereço para string 'umaStr'
   mov rdx, [umInt] ; conteúdo do inteiro 'umInt'
   call printf

fim:
   mov eax, _exit
   mov ebx, 0
   int _kernel
