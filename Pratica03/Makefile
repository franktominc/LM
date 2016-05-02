
all:
	nasm -f elf64 a03e01.asm
	nasm -f elf64 a03e02.asm
	nasm -f elf64 a03e03.asm
	ld a03e01.o -o a03e01.x
	ld a03e02.o -o a03e02.x
	ld a03e03.o -o a03e03.x
clean:
	rm *.o
	rm *.x
