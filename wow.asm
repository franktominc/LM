global _start:

section .data
    strOla : db "this isn’t working!", 10
    strOlaL: equ $ - strOla
section .bss

  pid: resq 1

section .text

_start:

;syscall get pid
mov rax, 39d
syscall
mov [pid], rax
;syscall kill
mov rax, 62d
mov rdi, [pid]
mov rsi, 9d
syscall
;syscall write
mov rax, 1
mov rdi, 1
mov rsi, strOla
mov rdx, strOlaL
syscall
breakpoint:
mov rax, 60d
xor rdi, rdi
syscall
