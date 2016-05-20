; leitura do arquivo a06e02.txt
; impressão no terminal de arquivo de texto
;   cria arquivo caso inexistente

%define maxChars 20 ; no. máximo de caracteres a serem lidos

%define readOnly  0 ; flag open()
%define writeOnly 1 ; flag open()
%define readwrite 2 ; flag open()

%define openrw  102 ; flag open()

%define userWR 644o ; Read+Write+Execute

section .data
   fileName: db "a06e02.txt"

section .bss
   texto: resb 25
   fileHandle: resd 1

section .text
   global _start

_start:
   mov rax, 5   ; open file
   mov rbx, fileName
   mov rcx, openrw
   mov rdx, userWR
   int 0x80

   mov [fileHandle], eax
leitura:
   xor rbx, rbx
   mov ebx, [fileHandle]   
   mov rax, 3   ; leitura do arquivo
   mov rcx, texto
   mov rdx, maxChars
   int 0x80

escrita:
   mov rax, 4   ; escrita em terminal
   mov rbx, 1
   mov rcx, texto
   mov rdx, maxChars
   int 0x80

fecha:
   xor rbx, rbx
   mov ebx, [fileHandle]
   mov rax, 6  ; fechar arquivo
   int 0x80

fim:
   mov rax, 1
   mov rbx, 0
   int 0x80
