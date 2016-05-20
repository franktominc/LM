; Simulação ADD e SUB de 64 bits
;    em máquinas 32 bits
; Utilizar somente registradores 32 bits
;    porém montar com elf64

section .data
   ; i1 = -1
   i1: dq 0x00000000ffffffff ; 64bits
   ; i2 = 1
   i2: dq 0x0000000000000002 ; 64bits

section .bss
   i3: resq 1 ; 64 bits
   i4: resq 1 ; 64 bits

section .text
   global _start

_start:
   ; i3 = i1 + i2

   ; i4 = i2 - i3

enderecos:
   mov r14, i3
   mov r15, i4

fim:
   mov rax, 1
   mov rbx, 0
   int 80h
