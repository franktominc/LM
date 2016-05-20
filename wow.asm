global _start:

section .data

section .bss

  pid: resq 1

section .text

_start:

mov rax, 39d
syscall
mov [pid], rax
breakpoint:
mov rax, 0
syscall
