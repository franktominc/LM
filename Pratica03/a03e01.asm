section .data
  num: dq 0x1111111122334455

section .text
  global _start

_start:
  mov rax, [num]

fim:
 mov rax, 1
 mov rbx, 0
 int 0x80

