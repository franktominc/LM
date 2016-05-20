; repetição infinita
; comando "top" linux -> k: PID -> sigkill
;         ou ctrl+c
section .bss
   destino: resq 1

section .text
   global _start

_start:
   ; play dead
   ;jmp _start
   
   ;mov rax, _start
   ;jmp rax

   mov qword [destino], _start
   jmp [destino]

fim:
   mov rax, 1
   mov rbx, 0
   int 0x80
