extern strcmp

global _start

section .data:
    equalString : db "*", 10,0
    equalStringL: equ $ - equalString
    filename: db "saida.txt",0
    fileOpenMode: dq 02101o
    separationString: db "==========", 10,0
    separationStringL: equ $ - separationString
    exitString: db "q!", 10,0
    exitStringL: equ $ - exitString
section .bss
    fileHandle: resq 1
    buffer: resb 20
    lastWord: resb 20

section .text
_start:
;syscall open(const char* filename, int mode, int flags)
    mov rax, 2
    mov rdi, filename
    mov rsi, [rel fileOpenMode]
    mov rdx, 0666o
    syscall
;mov the file handle to memory, so we don't lose it
    mov [fileHandle], rax
;syscall write(unsigned int fd,const char *buf, size_t count)
    mov rax, 1
    mov rdi, [rel fileHandle]
    mov esi, separationString
    mov rdx, separationStringL
    syscall
;nulling the String
    xor rax, rax
    mov [lastWord], rax
while:
;syscall read(unsigned int fileDescriptor, char* buffer, size_t size)
    xor rax, rax
    xor rdi, rdi
    mov rsi, buffer
    mov rdx, 20
    syscall
;compare with exitString
    mov rdi, buffer
    mov rsi, exitString
    call strcmp
    cmp rax, 0
    je exit
;compare with lastWord
    mov rdi, buffer
    mov rsi, lastWord
    call strcmp
    je Equals
;syscall write
notEquals:
;syscall write(unsigned int fd,const char *buf, size_t count)
    mov rax, 1
    mov rdi, [rel fileHandle]
    mov rsi, buffer
    mov rdx, 20
    syscall
    mov rax, [buffer]
    mov [lastWord], rax
    xor rax, rax
    mov [buffer], rax
    jmp while
Equals:
    mov rax, 1
    mov rdi, [rel fileHandle]
    mov esi, equalString
    mov rdx, 3
    syscall
    mov rax, [buffer]
    mov [lastWord], rax
    xor rax, rax
    mov [buffer], rax
    jmp while
exit:
    mov rax, 60d
    xor rdi, rdi
    syscall
