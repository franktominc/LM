; teste para P.F. (store)
;    montar: nasm -f elf64 a12e02.asm 
;    linkar: gcc -m64 a12e03.o -o a12e03.x

; executa  (2,0 + 1,5 * 0,03) / 0,00321
;           2,045 / 0,0321 = 637,0716510903

; precisão dupla
; operações com operando implícito + memória

section .data
   fp1 : dq 2.0    
   fp2 : dq 1.5
   fp3 : dq 0.03
   fp4 : dq 3.21e-3

   strCtrl1 : db 'Resultado: %f', 10, 0

   strCtrl2 : db '(%f + %f * %f) / %f = %f ', 10, 0

extern printf

section .bss
   fpr : resq 1

section .text
   global main

main:
   mov rbp, rsp
   sub rsp, 8 ; alinhamento para printf

   ; st0 = 1,5
   fld qword [fp2]

   ; st0   = st0 / st1
   ; 0,045 = 1,5 / 0,03
   fmul qword [fp3]

   ; st0   = st0   + fp1
   ; 2,045 = 0,045 + 2,0
   fadd qword [fp1]

   ; st0   = st0   / fp4
   ; 2,045 = 2,045 / 0,00321
   fdiv qword [fp4]

   ; fpr = st0
   ; fpr = 637,0716510903
   fst qword [fpr]

print:
   ; ajustar ponteiro st0
   ; printf
   mov rax, 1 ; printf usará 1 double (xmm0)
   mov rdi, strCtrl1
   movlps xmm0, [fpr]
   call printf   
   
   ; importante: ativar Regs. XMM corrompe STs (acho)
   
   ; printf para (2,0 + 1,5 * 0,03) / 0,00321 = 637...
   ; printf("(%f + %f * %f) / %f = %f \n", fp1, fp2, fp3, fp4, fpr);
   mov rax, 4 ; serão usados 4 doubles
   movlps xmm0, [fp1] ; primeiro param
   movlps xmm1, [fp2] ; segundo param
   movlps xmm2, [fp3] ; terceiro
   movlps xmm3, [fp4] ; ...
   movlps xmm4, [fpr] ; quinto param
   mov rdi, strCtrl2
   call printf
   
   ; gdb? x/1fg &fpr

   add rsp, 8
fim:
   ret
