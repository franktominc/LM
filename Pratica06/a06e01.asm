%define maxChars 10

section .data
   strOla : db "Hello?", 10
   strOlaL: equ $ - strOla

   strBye : db "Voce digitou: "
   strByeL: equ $ - strBye

   strLF  : db 10 ; quebra de linha
   strLFL : db 1

section .bss
   strLida   : resb maxChars
   strLidaL : resd 1

section .text
	global _start

_start:
   ; ssize_t write(int fd , const void *buf, size_t count);
   ; eax     write(int ebx, const void *ecx, size_t edx  );
   mov eax, 4  ; WRITE
   mov ebx, 1
   mov ecx, strOla
   mov edx, strOlaL
   int 0x80

leitura:
   mov dword [strLidaL], maxChars

   ; ssize_t read(int fd , const void *buf, size_t count);
   ; eax     read(int ebx, const void *ecx, size_t edx  );
   mov eax, 3  ; READ
   mov ebx, 1
   mov ecx, strLida
   mov edx, [strLidaL]
   int 0x80

   mov [strLidaL], eax

resposta:
   mov eax, 4  ; WRITE
   mov ebx, 1
   mov ecx, strBye
   mov edx, strByeL
   int 0x80

   mov eax, 4  ; WRITE
   mov ebx, 1
   mov ecx, strLida
   mov edx, [strLidaL]
   int 0x80

fim:
   ; void _exit(int status);
   ; void _exit(int ebx   );
   mov eax, 1
   mov ebx, 0
   int 0x80
