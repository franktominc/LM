; exemplo de 
;    chamada de sub-programas em x64

; sub-programa para encontrar o tamanho de string null-terminated
; cabeçalho em C: int strLength(char *c[]);

%define _write  4
%define _exit   1
%define _kernel 0x80

section .data
   strTeste1 : db 'string null-terminated', 0       ; 22 + 1
   strTeste2 : db 'outra string null-terminated', 0 ; 28 + 1
   strTeste3 : db 'Yes Captain', 0                  ; 11 + 1

section .bss
   str1L : resd 1
   str2L : resd 1
   str3L : resd 1

section .text
   global _start

_start:
   ; valores para teste de salvamento de registradores
   mov rax, 1
   mov rbx, 2
   mov rcx, 3
   mov rdx, 4
   mov r8 , 5
   mov r9 , 6
   mov r10, 7
   mov r11, 8
   mov r12, 9
   mov r13, 10
   mov r14, 11
   mov r15, 12
   mov rdi, 13
   mov rsi, 14

   ; passo 1 - Antes da chamada CALL
   ; salvar registradores RAX, RCX, RDX, R8 - R11
   push rax
   push rcx
   push rdx
   push r8
   push r9
   push r10
   push r11

   ; passo 2 - Antes da chamada CALL
   ; Passagem de parâmetros
   mov rdi, strTeste1

   ; passo 3 - chamada CALL
   call strLength

   ; retorno do sub-programa em EAX
   mov [str1L], eax ; inteiro de 32bit

   ; passo 4
   ; remover parâmetros da PILHA
   ; add rsp, 8 ; +4 para cada parâmetro empilhado
                ; porém não existem neste exemplo
                ; 90% dos códigos utilizam até 6 parâmetros

   ; passo 5
   ; recuperar registradores RAX, RCX, RDX, R8 - R1
   pop r11 ; último empilhado
   pop r10
   pop r9
   pop r8
   pop rdx
   pop rcx
   pop rax  ; primeiro empilhado

fim:
   mov rax, _exit
   mov rbx, 0
   int _kernel


strLength:
   ; passo 1 - Antes do corpo do sub-programa
   ; criar stack-frame
   push rbp
   mov rbp, rsp

   ; passo 2 - Antes do corpo do sub-programa
   ; criar espaço para variáveis locais
   sub rsp, 4  ; 4 bytes para uma variável inteira local
   ; [rsp-4] é o deslocador até encontrar '0'

   ; passo 3 - Antes do corpo do sub-programa
   ; salvar registradores RBX, RDI, RSI, R12 - R15
   push rbx
   push rdi
   push rsi
   push r12
   push r13
   push r14
   push r15

   ; sub-programa - inicio -----------------------------
   ; RDI = char *c[] - parâmetro 1
   mov dword [rbp-4], 0
   laco:
      mov edx, [rbp-4]  ; deslocador de 32 bits
      mov al, [rdi+rdx] ; char[deslocador]
      ; inc edx           ; para contar '\0'
      cmp al, 0         ; char é zero?
      je finaliza
      inc edx           ; desloc++
      mov [rbp-4], edx  ; guarda deslocador
      jmp laco

   finaliza:   
   ; sub-programa - fim --------------------------------
   
   ; passo 4 - depois do corpo do sub-programa
   ; copiar resultado para EAX
   mov eax, [rbp-4]

   ; passo 5 - depois do corpo do sub-programa
   ; recuperar registradores RBX, RDI, RSI, R12 - R15
   pop r15 ; último empilhado
   pop r14
   pop r13
   pop r12
   pop rsi 
   pop rdi
   pop rbx ; primeiro empilhado

   ; passo 6 - depois do corpo do sub-programa
   ; desalocar variáveis locais
   mov rsp, rbp

   ; passo 7 - depois do corpo do sub-programa
   ; recuperar ebp antigo e garantir endereço de retorno
   pop rbp

   ; passo 8 - depois do corpo do sub-programa
   ; sempre, sempre, sempre retorne com RET
   ret
   
