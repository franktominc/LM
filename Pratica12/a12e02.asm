; teste para P.F. (store)
;    montar: nasm -f elf64 a12e02.asm 
;    linkar: gcc -m64 a12e02.o -o a12e02.x

section .data
   fp1 : dd 1.1     ; precisao simples
   fp2 : dd 1.2e3
   fp3 : dq 1.3e3   ; precisao dupla
   fp4 : dt 1.4e-3  ; extendido

section .bss
   fpa : resd 1
   fpb : resd 1
   fpc : resq 1   ; sera armazenado incorretamente
   fpd : resq 1
   fpe : rest 1

section .text
   global main

main:
   ; rotaciona FPU a cada load
   ; carrega st0 com fp1
   fld dword [fp1]   
   ; carrega st0 com fp2
   fld dword [fp2] 
   ; carrega st0 com fp3
   fld qword [fp3]

s1:
   ; armazena st0 em fpa
   fst  dword [fpa]

s2:
   ; armazena st0 em fpa
   ; rotaciona Regs FPU
   fstp dword [fpb]

s3:
   ; armazena st0 em st5
   fst  st5

s4:
   ; armazena st0 em st6
   ; rotaciona Regs FPU
   fstp st6

s5:
   ; armazena st0 em fpc
   fst  dword [fpc] ; cuidado: dword
   
   ; armazena st0 em fpc
   fstp qword [fpd] ; correto: qword

s6:
   ; carrega st0 com fp4
   fld tword [fp4]

s7:
   ; armazena st0 em fpe
   ; rotacao obrigatoria
   fstp tword [fpe]

fim:
   ret
