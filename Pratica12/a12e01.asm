; teste para P.F. (load)
;    montar: nasm -f elf64 a12e01.asm 
;    linkar: gcc -m64 a12e01.o -o a12e01.x

section .data
   fp1 : dd 1.1     ; precisao simples
   fp2 : dd 1.2e3
   fp3 : dq 1.3e3   ; precisao dupla
   fp4 : dq 1.4e-3
   fp5 : dq -1.5e3
   fp6 : dt 1.6     ; precisao dupla est.

section .text
   global main

main:
   ; rotaciona FPU
   ; carrega st0 com fp1
   fld dword [fp1]   

f1:
   ; rotaciona FPU (st1 := st0)
   ; carrega st0 com fp2
   fld dword [fp2] 

f2:
   ; rotaciona FPU (st2 := st1, st1 := st0)
   ; carrega st0 com fp3
   fld qword [fp3]

f3:
   ; rotaciona FPU
   ; carrega st0 com fp6
   fld qword [fp4]
   
f4:
   ; rotaciona FPU
   ; carrega st0 com st3
   fld st3

f5: 
   ; rotaciona FPU
   ; carrega st0 com fp5
   fld qword [fp5]

f6: 
   ; rotaciona FPU
   ; carrega st0 com fp6
   fld tword [fp6]

f7:
   ; rotaciona FPU
   ; carrega st0 com st3
   fld st3

f8:
   ; rotaciona FPU
   ; tenta carregar st0 com st3
   ; st0 não está vazio
   ; estraga valor st0
   fld st3


fim:
   ret
