section .data
   strSF : db "%lf",0
   strPF : db "Float digitado: %f", 10, 0

section .bss
   fp : resq 1

extern printf
extern scanf

section .text
   global main

main:
   ; alinhamento printf
   sub rsp, 8

   ; chamada para scanf
   mov rdi, strSF   
   mov rsi, fp
   call scanf

label:
   ; chamada para printf
   mov rax, 1
   movlps xmm0, [fp]
   mov rdi, strPF
   call printf

fim:
   ; re-alinhamento printf
   add rsp, 8
   ret
