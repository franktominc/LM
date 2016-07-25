%define maxChars 21

section .data
   strOla  : db 'Entrada (max 20 char): '
   strBye  : db 'Vc digitou           : '
   strByeL : equ $-strBye

section .bss
   strLida : resb maxChars ; 'char + enter'

section .text
   global _start

_start:
   ; write
   mov eax, 4
   mov ebx, 1
   mov ecx, strOla
   mov edx, strByeL ; mesmo tamanho
   int 0x80

   ; read
   mov eax, 3
   mov ebx, 1
   mov ecx, strLida
   mov edx, maxChars
   int 0x80

l1:
   ; guarda no. chars lidos
   push rax 

l2:
   ; write
   mov eax, 4
   mov ebx, 1
   mov ecx, strBye
   mov edx, strByeL ; mesmo tamanho
   int 0x80   
 
   ; write
   mov eax, 4
   mov ebx, 1
   mov ecx, strLida
l3:
   ; retorna no. de chars lidos
   pop rdx          
l4:
   int 0x80  

fim:
   mov eax, 1
   mov ebx, 0
   int 0x80
