; Identifica que v1 é maior, menor ou igual à v2
; Entradas:
;     v1 e v2 (dígitos)
; Saída:
;     string maior, menor ou igual

section .data
   maior    : db "v1 eh maior do que v2", 10
   menor    : db "v1 eh menor do que v2", 10
   mTamanho : equ $-menor

   iguais   : db "v1 eh igual a v2", 10
   iTamanho : equ $-iguais

   d1 : db "Entre com digito v1: "
   d2 : db "Entre com digito v2: "
   dTamanho : equ $-d2

section .bss
   v1: resb 2 ; "enter"
   v2: resb 2 ; "enter"

section .text
   global _start

_start:

   ; entrada de v1
   mov rax, 4
   mov rbx, 1
   mov rcx, d1
   mov rdx, dTamanho
   int 0x80

   ; leitura de v1
   mov rax, 3
   mov rbx, 1
   mov rcx, v1
   mov rdx, 2
   int 0x80

   ; entrada de v2
   mov rax, 4
   mov rbx, 1
   mov rcx, d2
   mov rdx, dTamanho
   int 0x80

   ; leitura de v2
   mov rax, 3
   mov rbx, 1
   mov rcx, v2
   mov rdx, 2
   int 0x80

   ; compara v1 com v2 (valores ASCII)
   mov al, [v1]
   cmp al, [v2]
   je lIguais ; v1 = v2 ; observação: pode ser removido
   jl lMenor  ; v1 < v2
   jg lMaior  ; v1 > v2

lIguais:
   mov rax, 4
   mov rbx, 1
   mov rcx, iguais
   mov rdx, iTamanho
   int 0x80   
   jmp fim

lMenor:
   mov rax, 4
   mov rbx, 1
   mov rcx, menor
   mov rdx, mTamanho
   int 0x80
   jmp fim

lMaior:
   mov rax, 4
   mov rbx, 1
   mov rcx, menor
   mov rdx, mTamanho
   int 0x80
   jmp fim ; observação: pode ser removido

fim:
   mov rax, 1
   mov rbx, 0
   int 0x80
