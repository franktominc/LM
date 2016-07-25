; percorre vetores de char e inteiros
; utilizando modos de endereçamento

section .data
   v1 : db 'a', 'b', 'c', 'd', 'e'        ; vetor de char (char v1[5];)
   v2 : dd 1024, 2048, 4096,  8192, 16384 ; vetor de int  (int  v2[5];)

section .text
   global _start

_start:
   mov eax, 0    ; end. imediato
   mov r15d, eax ; end. por registrador
   ; r15d é contador de posição

   mov r8, v1   ; r8 = &v1 (r8 é ponteiro para v1)
   mov r9, v2   ; r9 = &v2 (r9 é ponteiro para v2)

laco:
   mov al , [r8]         ; end. indireto por registrador

   mov bl , [v1+r15d]    ; end. por deslocamento
                         ; offset + deslocamento (reg)

   ;mov ecx, [r9+r15d*4] ; end. é inválido 

   mov edx, [v2+r15d*4]  ; end. por deslocamento indexado
                         ; offset + deslocamento * posicionamento
jmpLaco:
   inc r8               ; indexação incremental
   inc r9               ; indexação incremental
   inc r15d
   cmp r15d, 5
   jl laco

   mov r10b, [v1]    ; 'a' end. indireto
   mov r11b, [v1+2]  ; 'c' end. indireto por deslc.

   mov r12d, [v2]    ; 1024 end. indireto
   mov r13d, [v2+8]  ; 4096 end. indireto por deslc.

fim:
   mov eax, 1  ; end. imediato
   mov ebx, 0  ; end. imediato
   int 0x80
